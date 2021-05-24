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

func TestEndtoEndGCP(t *testing.T) {
	t.Parallel()

	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)
	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../", "examples/gcp")
	region := gcp.GetRandomRegion(t, projectId, []string{"us-west1", "us-central1", "us-east1"}, nil)
	randomValidGcpName := gcp.RandomValidGcpName()

	// Variables to pass to our Terraform code using -var options
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: exampleDir,
		Vars: map[string]interface{}{
			"gcp_project_region": region,
			"instance_name":      randomValidGcpName,
		},
		EnvVars: map[string]string{
			"GOOGLE_PROJECT": projectId,
		},
	})
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	publicIp := terraform.Output(t, terraformOptions, "public_ip")
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

func TestUnitCompute(t *testing.T) {
	t.Parallel()

	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)
	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../../../../modules/gcp/compute", "examples/gcp/unit/compute")
	region := gcp.GetRandomRegion(t, projectId, []string{"us-west1", "us-central1", "us-east1"}, nil)
	randomValidGcpName := gcp.RandomValidGcpName()
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: exampleDir,
		Vars: map[string]interface{}{
			"gcp_project_region": region,
			"instance_name":      randomValidGcpName,
		},
		EnvVars: map[string]string{
			"GCP_PROJECT_ID": projectId,
		},
	})
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
