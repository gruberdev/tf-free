package main //nolint:testpackage // To override osExit the test needs to be part of main

import (
	"testing"

	"github.com/kami-zh/go-capturer"
	"github.com/stretchr/testify/assert"
)

func Test_main(t *testing.T) {
	// Save current function and restore at the end
	oldOsExit := osExit

	defer func() { osExit = oldOsExit }()

	var (
		expectExitCode = 0
		expectMsg      = "Usage:" // Help msg includes this string

		actualMsg      string
		actualExitCode int

		// Mock of "osExit" to capture the exit-status-code.
		myExit = func(code int) {
			actualExitCode = code
		}
	)

	// Assign the mock
	osExit = myExit
	// Run main() to capture STDOUT message and its exit-status-code
	actualMsg = capturer.CaptureOutput(func() {
		main()
	})

	// Assertion
	assert.Equal(t, actualExitCode, expectExitCode, "Unexpected exit code.")
	assert.Contains(t, actualMsg, expectMsg, "Should contain help message")
}
