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
	"github.com/stretchr/testify/assert"
)

func TestUnitVPC(t *testing.T) {
	t.Parallel()
	randomValidNetworkGcpName := gcp.RandomValidGcpName()
	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)
	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../", "examples/gcp/unit/vpc")
	region := gcp.GetRandomRegion(t, projectId, []string{"us-west1", "us-central1", "us-east1"}, nil)
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: exampleDir,
		Vars: map[string]interface{}{
			"project_region":     region,
			"gcp_project_region": region,
			"main_network_name":  randomValidNetworkGcpName,
			"google_project":     projectId,
		},
		EnvVars: map[string]string{
			"GOOGLE_PROJECT": projectId,
		},
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
