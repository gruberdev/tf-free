package cmd

import (
	//	"time"

	"github.com/bitfield/script"
	"github.com/fatih/color"
	"github.com/spf13/cobra"
)

// createCmd represents the create command
var createCmd = &cobra.Command{
	Use:   "create",
	Short: "Creates resources using Terraform as the main provisioning tool",
	Long: `

This command allows for the CLI user to select which cloud providers 
will be used when deploying the project.`,
	Run: func(cmd *cobra.Command, args []string) {
		createInfra()
	},
}

func init() {
	terraformCmd.AddCommand(createCmd)
}

func createInfra() {
	color.Cyan("Creating resources")
	script.Exec("bash -c 'cd /home/gruber/projects/tf-free && task unit-rds-aws'").Stdout()
	// upload...
	//time.Sleep(2 * time.Second)
}