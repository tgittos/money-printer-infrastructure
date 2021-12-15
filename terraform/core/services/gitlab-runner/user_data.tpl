#!/bin/bash

echo ECS_CLUSTER=mp-runner-ecs-cluster >> /etc/ecs/ecs.config

export CI_SERVER_URL=http://gitlab.com
export RUNNER_NAME=MP-ECS-Runner
export REGISTRATION_TOKEN=${gitlab_access_token}
export REGISTER_NON_INTERACTIVE=true

gitlab-runner register
gitlab-runner verify