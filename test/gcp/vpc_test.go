package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/gcp"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
)

func TestUnitVPC(t *testing.T) {
	t.Parallel()
	randomValidNetworkGcpName := gcp.RandomValidGcpName()
	randomValidIPGcpName := gcp.RandomValidGcpName()
	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)

	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../../", "examples/gcp/unit/vpc")
	region := gcp.GetRandomRegion(t, projectId, []string{"us-west1", "us-central1", "us-east1"}, nil)
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: exampleDir,
		Vars: map[string]interface{}{
			"gcp_project_region": region,
			"gcp_network_name":   randomValidNetworkGcpName,
			"gcp_project_id":     projectId,
			"gcp_ipv4_name":      randomValidIPGcpName,
		},
		EnvVars: map[string]string{
			"GOOGLE_PROJECT": projectId,
		},
	})
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
