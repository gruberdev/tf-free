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

func TestUnitCompute(t *testing.T) {
	t.Parallel()

	projectId := gcp.GetGoogleProjectIDFromEnvVar(t)
	exampleDir := test_structure.CopyTerraformFolderToTemp(t, "../", "examples/aws/e2e")
	region := gcp.GetRandomRegion(t, projectId, []string{"us-west1", "us-central1", "us-east1"}, nil)
	randomValidInstanceGcpName := gcp.RandomValidGcpName()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: exampleDir,
		Vars: map[string]interface{}{
			"project_region": region,
			"instance_name":  randomValidInstanceGcpName,
			"google_project": projectId,
		},
		EnvVars: map[string]string{
			"GOOGLE_PROJECT": projectId,
		},
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	resultingInstanceName := terraform.OutputRequired(t, terraformOptions, "resulting_name")
	resultingInstanceType := terraform.OutputRequired(t, terraformOptions, "resulting_type")
	assert.Equal(t, randomValidInstanceGcpName, resultingInstanceName)
	assert.Equal(t, "f1-micro", resultingInstanceType)
}
