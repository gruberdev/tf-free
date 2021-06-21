/*
Package cmd is the package of the actual commands of this CLI app.
*/
package cmd

import (
	"fmt"
	"os"

	"github.com/gruberdev/tf-free/conf"
)

// ===============================================================================
//  Constants
// ===============================================================================

const (
	// SUCCESS is an alias of exit status code to ease read.
	SUCCESS int = 0
	// FAILURE is an alias of exit status code to ease read.
	FAILURE int = 1
)

// ===============================================================================
//  Application Settings
// ===============================================================================

// TConfUser defines the data structure to store values from a conf file. Viper
// will read these values from the config file or env variables. `mapstructure`
// defines the key name in the conf file.
//   Ex) `{"name_to_greet": "foo"}`  will be `NameToGreet = "foo"```
type TConfUser struct {
	NameToGreet string `mapstructure:"name_to_greet"`
}

var (
	// ConfApp is the basic app settings.
	ConfApp = conf.TConfigFile{
		PathDirConf:        ".",
		NameFileConf:       "config",
		NameTypeConf:       "json",
		PathFileConf:       "",    // User defined file path
		IsUsingDefaultConf: false, // Set to true if conf file not fond
	}

	// ConfUser holds the values read from the config file. The values here are
	// the default.
	ConfUser = TConfUser{
		NameToGreet: "", // Conf for `hello` and `hello ext` command.
	}
)

// osExit is a copy of `os.Exit` to ease the "exit status" test.
// See: https://stackoverflow.com/a/40801733/8367711
var osExit = os.Exit

// ============================================================================
//  Exported functions of cmd package. (https://tour.golang.org/basics/3)
//
//  Define functions that were used outside this package such as `main` pkg.
//  These will work as `cmd` method.
//    Ex) cmd.EchoStdErrIfError(err)
// ============================================================================

// EchoStdErrIfError is an STDERR wrappter and returns 0(zero) or 1.
// It does nothing if the error is nil and returns 0.
func EchoStdErrIfError(err error) int {
	if err != nil {
		fmt.Fprintln(os.Stderr, err)

		return FAILURE
	}

	return SUCCESS
}

// Execute is the main function of `cmd` package.
// It adds all the child commands to the root's command tree and sets their flag
// settings. Then runs/executes the `rootCmd` to find appropriate matches for child
// commands with corresponding flags and args.
//
// Usually `cmd.Execute` will be called by the `main.main()` and it only needs to
// happen once to the rootCmd.
// Returns `error` when it fails to execute.
func Execute() error {
	// Read conf file values to ConfUser with ConfApp settings
	return rootCmd.Execute()
}
