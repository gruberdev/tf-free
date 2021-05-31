package main

import (
	"os"

	"github.com/gruberdev/tf-free/cmd"
)

var osExit = os.Exit

func main() {
	osExit(cmd.EchoStdErrIfError(cmd.Execute()))
}
