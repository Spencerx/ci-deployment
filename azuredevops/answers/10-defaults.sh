#!/bin/bash

# SET SOME SANE DEFAULTS
{
  echo "RANCHER_STACK_NAME=${SYSTEM_TEAMPROJECT}"
  echo "PROJECT_NAME=${SYSTEM_TEAMPROJECT}"
  echo "DEPLOY_URL='${SYSTEM_TEAMPROJECT}.${RELEASE_ENVIRONMENTNAME}.beta.nhschoices.net'"
  echo "RANCHER_DESCRIPTION='https://dev.azure.com/nhsuk/${SYSTEM_TEAMPROJECT}'"
  echo "DEPLOY_BUILD=true"
} >> answers.txt

# TAG BUILDS
if [ -n "${BUILD_BUILDNUMBER}" ]; then
  echo "DOCKER_IMAGE_TAG=${BUILD_BUILDNUMBER}" >> answers.txt
# INTEGRATION BUILD
else [ "$BUILD_SOURCEBRANCHNAME" = "master" ]; then
  echo "DOCKER_IMAGE_TAG=latest" >> answers.txt
fi