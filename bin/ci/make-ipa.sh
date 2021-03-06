#!/usr/bin/env bash

set -e

if [ -z "${TRAVIS}" ] && [ -z "${JENKINS_HOME}" ]; then
  echo "FAIL: only run this script on Travis or Jenkins"
  exit 1
fi

if [ -n "${TRAVIS}" ] && [ "${TRAVIS_SECURE_ENV_VARS}" != "true" ]; then
  echo "INFO: skipping make ipa; non-maintainer activity"
  exit 0
fi

CODE_SIGN_DIR="${HOME}/.calabash/calabash-codesign"
KEYCHAIN="${CODE_SIGN_DIR}/ios/Calabash.keychain"

if [ -e ".env" ]; then
  cp .env .env-backup
fi

mv .env-template .env

OUT=`xcrun security find-identity -p codesigning -v "${KEYCHAIN}"`
IDENTITY=`echo $OUT | perl -lne 'print $& if /iPhone Developer: Karl Krukow \([A-Z0-9]{10}\)/' | tr -d '\n'`
CODE_SIGN_IDENTITY="${IDENTITY}" make ipa

