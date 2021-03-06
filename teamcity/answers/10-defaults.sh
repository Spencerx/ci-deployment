#!/bin/bash

# SET SOME SANE DEFAULTS
{
  echo "RANCHER_STACK_NAME=${TEAMCITY_PROJECT_NAME}"
  echo "PROJECT_NAME=${TEAMCITY_PROJECT_NAME}"
  echo "DEPLOY_URL='${TEAMCITY_PROJECT_NAME}.${CI_ENVIRONMENT_NAME}.beta.nhschoices.net'"
  echo "RANCHER_DESCRIPTION='github/nhsuk/${TEAMCITY_PROJECT_NAME}'"
  echo "DEPLOY_BUILD=true"
} >> answers.txt

# TEAMCITY ONLY USED FOR PROMOTING TAGS TO STAGING/PRODUCTION
echo "DOCKER_IMAGE_TAG=${BUILD_TAG}" >> answers.txt
