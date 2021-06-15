// NOTE: We use build tags to differentiate GCP testing for better isolation and parallelism when executing our tests.

package test

import (
	"bytes"
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/logger"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/require"
)

func TestUnitStorage(t *testing.T) {
	t.Parallel()

	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)
	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../../", "examples/gcp/unit/storage")
	region := gcp.GetRandomRegion(t, projectId, []string{"us-east1"}, nil)

	gsNetworkName := gcp.RandomValidGcpName()
	gsBucketName := gcp.RandomValidGcpName()

	// Variables to pass to our Terraform code using -var options
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: exampleDir,
		Vars: map[string]interface{}{
			"gcp_project_region": region,
			"gcp_network_name":   gsNetworkName,
			"gcp_project_id":     projectId,
			"gcp_bucket_name":    gsBucketName,
		},
		EnvVars: map[string]string{
			"GOOGLE_PROJECT": projectId,
		},
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	testFilePath := fmt.Sprintf("test-file-%s.txt", random.UniqueId())
	testFileBody := "test file text"
	logger.Logf(t, "Random values selected Bucket Name = %s, Test Filepath: %s\n", gsBucketName, testFilePath)
	objectURL := gcp.WriteBucketObject(t, gsBucketName, testFilePath, strings.NewReader(testFileBody), "text/plain")
	logger.Logf(t, "Got URL: %s", objectURL)
	fileReader := gcp.ReadBucketObject(t, gsBucketName, testFilePath)
	buf := new(bytes.Buffer)
	buf.ReadFrom(fileReader)
	result := buf.String()
	require.Equal(t, testFileBody, result)
}
