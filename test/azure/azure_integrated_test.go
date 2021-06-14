package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestIntegrationAzure(t *testing.T) {
	t.Parallel()

	/* 	subscriptionID := ""
	   	uniquePostfix := random.UniqueId() */

	// Configure Terraform setting up a path to Terraform code.
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located.
		TerraformDir: "../../examples/azure/e2e",

		// Variables to pass to our Terraform code using -var options.
		Vars: map[string]interface{}{
			"location":            "eastus",
			"resource_group_name": "test",
		},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created.
	defer terraform.Destroy(t, terraformOptions)

	// Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// Run tests for the Virtual Machine.
}

/* func testStrategiesForVMs(t *testing.T, terraformOptions *terraform.Options, subscriptionID string) {
	// Run `terraform output` to get the values of output variables.
	resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")
	virtualMachineName := terraform.Output(t, terraformOptions, "linux_name")
	expectedVMSize := compute.VirtualMachineSizeTypes(terraform.Output(t, terraformOptions, "vm_size"))

	// 1. Check the VM Size directly. This strategy gets one specific property of the VM per method.
	actualVMSize := azure.GetSizeOfVirtualMachine(t, virtualMachineName, resourceGroupName, subscriptionID)
	assert.Equal(t, expectedVMSize, actualVMSize)

	// 2. Check the VM size by reference. This strategy is beneficial when checking multiple properties
	// by using one VM reference. Optional parameters have to be checked first to avoid nil panics.
	vmByRef := azure.GetVirtualMachine(t, virtualMachineName, resourceGroupName, subscriptionID)
	actualVMSize = vmByRef.HardwareProfile.VMSize
	assert.Equal(t, expectedVMSize, actualVMSize)

	// 3. Check the VM size by instance. This strategy is beneficial when checking multiple properties
	// by using one VM instance and making calls against it with the added benefit of property check abstraction.
	vmInstance := azure.Instance{VirtualMachine: vmByRef}
	actualVMSize = vmInstance.GetVirtualMachineInstanceSize()
	assert.Equal(t, expectedVMSize, actualVMSize)
}
*/
