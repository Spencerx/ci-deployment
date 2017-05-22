#!/bin/bash

MSG=$1

PULL_REQUEST="$TRAVIS_PULL_REQUEST"
REPO="$TRAVIS_REPO_SLUG"

if [ -z "$GITHUB_ACCESS_TOKEN" ]; then
  echo "GITHUB_ACCESS_TOKEN not set"
  exit 1
fi

PAYLOAD="{\"body\": \"${MSG}\" }"

GITHUB_RESPONSE=$(curl -s -o /dev/null -w '%{http_code}' -d "${PAYLOAD}" "https://api.github.com/repos/${REPO}/issues/${PULL_REQUEST}/comments?access_token=${GITHUB_ACCESS_TOKEN}")

if [ "${GITHUB_RESPONSE}" = "201" ]; then
  echo "Comment '${MSG}' added to pr ${PULL_REQUEST} on ${REPO}"
else
  echo "Failed to add comment to pr ${PULL_REQUEST} on ${REPO} (response code: \"${GITHUB_RESPONSE}\")"
fi