/*
Copyright © 2021 NAME HERE <EMAIL ADDRESS>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
package cmd

import (
	"context"
	"io/ioutil"
	"log"
	"os"
	"time"

	spinner "github.com/Yash-Handa/spinner"
	"github.com/fatih/color"
	"github.com/hashicorp/terraform-exec/tfexec"
	"github.com/hashicorp/terraform-exec/tfinstall"
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
	sp, err := spinner.New(10, 150*time.Millisecond, spinner.Cyan, spinner.Normal)
	if err != nil {
		log.Fatal(err)
	}

	sp.SetPostText("  Loading Infrastucture...\n")

	sp.Start()                  // the spinner starts
	time.Sleep(3 * time.Second) // after 3 seconds

	tmpDir, err := ioutil.TempDir("", "tfinstall")
	if err != nil {
		color.Red("Error creating temp dir: %s", err)
	}
	defer os.RemoveAll(tmpDir)

	execPath, err := tfinstall.Find(context.Background(), tfinstall.LatestVersion(tmpDir, false))
	if err != nil {
		color.Red("Error locating terraform binary: %s", err)
	}

	workingDir := "/home/gruber/projects/tf-free"
	tf, err := tfexec.NewTerraform(workingDir, execPath)
	if err != nil {
		color.Red("\nError accessing path to Terraform directory:\n %s", err)
	}

	err = tf.Init(context.Background(), tfexec.Upgrade(true))
	if err != nil {
		color.Red("Error running init: %s", err)
	}

	state, err := tf.Show(context.Background())
	if err != nil {
		color.Red("rror runnig show: %s", err)
	}

	color.Cyan(state.FormatVersion) // "0.1"
	sp.SetDoneText("Finished loading.\n")
	time.Sleep(3 * time.Second)
	sp.Stop() // the spinner stops
}
