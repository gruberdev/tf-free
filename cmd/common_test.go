package cmd

import (
	"errors"
	"testing"

	"github.com/kami-zh/go-capturer"
	"github.com/stretchr/testify/assert"
)

func TestEchoStdErrIfError(t *testing.T) {
	var (
		expectStatus int = 1
		actualStatus int
		expectMsg    string = "foo bar"
		actualMsg    string
		errorMsg     error = errors.New(expectMsg)
	)

	// Run the function and capture the STDERR msg and it's returned int value.
	actualMsg = capturer.CaptureStderr(func() {
		actualStatus = 0 // This should turn into 1
		actualStatus = EchoStdErrIfError(errorMsg)
	})

	assert.Equal(t, expectStatus, actualStatus, "Error code should return 1")
	assert.Equal(t, expectMsg+"\n", actualMsg, "The two words should be the same.")
}

func TestEchoStdErrIfError_IsNil(t *testing.T) {
	var (
		expectStatus int    = 0
		actualStatus int    = 1 // This should turn into 0
		expectMsg    string = ""
		actualMsg    string
	)

	actualMsg = capturer.CaptureStderr(func() {
		actualStatus = EchoStdErrIfError(nil)
	})

	assert.Equal(t, expectStatus, actualStatus, "Error code should return 1")
	assert.Equal(t, expectMsg, actualMsg,
		"If the arg is nil it should not print enything to STDERR. STDERR Msg: "+actualMsg,
	)
}

func TestExecute(t *testing.T) {
	var (
		result   string
		contains string
	)

	result = capturer.CaptureStdout(func() {
		if err := Execute(); err != nil {
			assert.FailNowf(t, "Failed to execute 'root.Execute()'.", "Error msg: %v", err)
		}
	})
	contains = "A simple CLI app to see how Cobra works."

	assert.Contains(t, result, contains, "When no arg, should return help message.")
}

    © 2021 GitHub, Inc.