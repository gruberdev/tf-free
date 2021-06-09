package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/docker"
	"github.com/stretchr/testify/assert"
)

func TestDockerBuild(t *testing.T) {
	t.Parallel()
	dockerComposeFile := "../../scripts/docker-compose.yml"
	docker.RunDockerCompose(
		t,
		&docker.Options{},
		"-f",
		dockerComposeFile,
		"build",
	)

	output := docker.RunDockerComposeAndGetStdOut(
		t,
		&docker.Options{},
		"-f",
		dockerComposeFile,
		"run",
		"--rm",
		"simple_stdout",
	)
	assert.Contains(t, output, "stdout: passed")
	assert.NotContains(t, output, "stderr: building error")
}s
