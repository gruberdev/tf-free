package test

import (
	"fmt"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/environment"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/ssh"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

var accessList = []string{
	"AWS_ACCESS_KEY_ID",
}

var secretList = []string{
	"AWS_SECRET_ACCESS_KEY",
}

func TestUnitEC2(t *testing.T) {
	t.Parallel()
	sshName := fmt.Sprintf("ssh-key-%s", random.UniqueId())
	// Pick a random AWS region to test in. This helps ensure your code works in all regions.
	awsRegion := aws.GetRandomStableRegion(t, []string{"us-east-1", "us-west-1", "ca-central-1", "eu-west-1", "sa-east-1", "ap-northeast-1", "af-south-1"}, nil)
	awsAvailability := aws.GetAvailabilityZones(t, awsRegion)
	awsAccessID := environment.GetFirstNonEmptyEnvVarOrEmptyString(t, accessList)
	awsSecretKey := environment.GetFirstNonEmptyEnvVarOrEmptyString(t, secretList)
	// retryable errors in terraform testing.
	keyPair := ssh.GenerateRSAKeyPair(t, 2048)
	amiID := aws.GetUbuntu1604Ami(t, awsRegion)
	keyPublic := fmt.Sprintf("%s", keyPair.PublicKey)
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::1:: The path to where our Terraform code is located
		TerraformDir: "../../examples/aws/unit/ec2",
		// Environment variables to set when running Terraform
		Vars: map[string]interface{}{
			"aws_account_id":     awsAccessID,
			"aws_account_key":    awsSecretKey,
			"aws_default_region": awsRegion,
			"ssh_name":           sshName,
			"ssh_public":         keyPublic,
			"subnet_region":      awsAvailability[0],
			"ami_id":             amiID,
		},
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION":    awsRegion,
			"AWS_ACCESS_KEY_ID":     awsAccessID,
			"AWS_SECRET_ACCESS_KEY": awsSecretKey,
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
	publicIp := terraform.Output(t, terraformOptions, "public_ip")

	// website::tag::5:: Make an HTTP request to the instance and make sure we get back a 200 OK with the body "Hello, World!"
	url := fmt.Sprintf("http://%s:80", publicIp)
	http_helper.HttpGetWithRetry(t, url, nil, 200, "Hello, World!", 30, 5*time.Second)
}
