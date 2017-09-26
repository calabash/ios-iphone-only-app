#!/usr/bin/env bash

set -e

source bin/log.sh
source bin/ditto.sh

if [ -z "${TRAVIS}" ] && [ -z "${JENKINS_HOME}" ]; then
  echo "FAIL: only run this script on Travis or Jenkins"
  exit 1
fi

if [ -n "${TRAVIS}" ] && [ "${TRAVIS_SECURE_ENV_VARS}" != "true" ]; then
  echo "INFO: skipping make framework; non-maintainer activity"
  exit 0
fi

git clone \
  --recursive \
  --depth 1 \
  --branch develop \
  https://github.com/calabash/calabash-ios-server

(cd calabash-ios-server && make framework)

echo "path: ${PWD}"
rm -rf calabash.framework
ditto_or_exit calabash-ios-server/calabash.framework calabash.framework
