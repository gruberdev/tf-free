// NOTE: We use build tags to differentiate GCP testing for better isolation and parallelism when executing our tests.

package test

import (
	"fmt"
	"strings"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/retry"
	"github.com/gruntwork-io/terratest/modules/ssh"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
)

// Create a Compute Instance, and attempt to SSH in and run a command.
func EndtoEndGCP(t *testing.T) {
	t.Parallel()

	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)

	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../../../", "examples/gcp/e2e")

	region := gcp.GetRandomRegion(t, projectId, []string{"us-west1", "us-central1", "us-east1"}, nil)

	randomValidGcpName := gcp.RandomValidGcpName()

	// Variables to pass to our Terraform code using -var options

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: exampleDir,
		Vars: map[string]interface{}{
			"gcp_region":    region,
			"instance_name": randomValidGcpName,
		},
		EnvVars: map[string]string{
			"GCP_PROJECT_ID": projectId,
		},
	})
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	publicIp := terraform.Output(t, terraformOptions, "public_ip")

	// Attempt to SSH and execute the command
	instance := gcp.FetchInstance(t, projectId, randomValidGcpName)

	sampleText := "Hello World"
	sshUsername := "terratest"

	keyPair := ssh.GenerateRSAKeyPair(t, 2048)
	instance.AddSshKey(t, sshUsername, keyPair.PublicKey)

	host := ssh.Host{
		Hostname:    publicIp,
		SshKeyPair:  keyPair,
		SshUserName: sshUsername,
	}

	maxRetries := 20
	sleepBetweenRetries := 3 * time.Second

	retry.DoWithRetry(t, "Attempting to SSH", maxRetries, sleepBetweenRetries, func() (string, error) {
		output, err := ssh.CheckSshCommandE(t, host, fmt.Sprintf("echo '%s'", sampleText))
		if err != nil {
			return "", err
		}

		if strings.TrimSpace(sampleText) != strings.TrimSpace(output) {
			return "", fmt.Errorf("Expected: %s. Got: %s\n", sampleText, output)
		}

		return "", nil
	})
}
