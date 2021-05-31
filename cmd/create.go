package cmd

import (
	"context"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/hashicorp/terraform-exec/tfexec"
	"github.com/hashicorp/terraform-exec/tfinstall"
	"github.com/spf13/cobra"
)

var createCmd = &cobra.Command{
	Use:   "create",
	Short: "Creates resources, can be specificed per cloud provider basis",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {
		tmpDir, err := ioutil.TempDir("", "tfinstall")
		if err != nil {
			log.Fatalf("error creating temp dir: %s", err)
		}
		defer os.RemoveAll(tmpDir)

		execPath, err := tfinstall.Find(context.Background(), tfinstall.LatestVersion(tmpDir, false))
		if err != nil {
			log.Fatalf("error locating Terraform binary: %s", err)
		}

		cwd, err := os.Getwd()
		if err != nil {
			log.Fatalf("error getteing current folder: %s", err)
		}
		fmt.Println(cwd) // "0.1"

		tf, err := tfexec.NewTerraform(cwd, execPath)
		if err != nil {
			log.Fatalf("error running NewTerraform: %s", err)
		}

		err = tf.Init(context.Background(), tfexec.Upgrade(true))
		if err != nil {
			log.Fatalf("error running Init: %s", err)
		}

		state, err := tf.Show(context.Background())
		if err != nil {
			log.Fatalf("error running Show: %s", err)
		}

		fmt.Println(cwd)                 // "0.1"
		fmt.Println(state.FormatVersion) // "0.1"
	},
}

func init() {
	rootCmd.AddCommand(createCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// createCmd.PersistentFlags().String("foo", "", "A help for foo")

	createCmd.Flags().BoolP("all", "a", true, "Create resources on ALL available cloud providers.")
	createCmd.Flags().String("provider", "p", "Specify a cloud provider to create resources, --all must be false. Options: [aws, az, gcp]")
	createCmd.Flags().BoolP("dry-run", "d", false, "Creates a terraform plan but doesn't create any resource.")
}
