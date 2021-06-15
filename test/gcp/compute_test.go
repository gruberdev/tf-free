package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestUnitCompute(t *testing.T) {
	t.Parallel()

	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)
	gsCreds := gcp.GetGoogleCredentialsFromEnvVar(t)
	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../../", "examples/gcp/unit/compute")
	region := gcp.GetRandomRegion(t, projectId, []string{"us-west1", "us-central1", "us-east1"}, nil)
	randomValidGcpName := gcp.RandomValidGcpName()
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: exampleDir,
		Vars: map[string]interface{}{
			"gcp_project_region": region,
			"gcp_instance_name":  randomValidGcpName,
			"gcp_project_id":     projectId,
		},
		EnvVars: map[string]string{
			"GOOGLE_PROJECT":                 projectId,
			"GOOGLE_APPLICATION_CREDENTIALS": gsCreds,
		},
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	resultingInstanceName := terraform.OutputRequired(t, terraformOptions, "resulting_name")
	resultingInstanceType := terraform.OutputRequired(t, terraformOptions, "resulting_type")
	assert.Equal(t, randomValidGcpName, resultingInstanceName)
	assert.Equal(t, "f1-micro", resultingInstanceType)
}
