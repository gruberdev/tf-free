package main

import (
	"os"

	"github.com/gruberdev/tf-free/cmd"
)

// osExit is a copy of `os.Exit` to ease the "exit status" test.
// See: https://stackoverflow.com/a/40801733/8367711
var osExit = os.Exit

func main() {
	// `cmd.Execute()` initializes the app such as adding sub-commands to the root command.
	// Then executes the designated command.
	// If `cmd.Execute()` returns an error then it will print the error message to STDERR and exits with 1.
	osExit(cmd.EchoStdErrIfError(cmd.Execute()))
}
