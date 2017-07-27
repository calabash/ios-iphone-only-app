#!/usr/bin/env bash

# Stages binaries built by Xcode to ./Products/

source bin/log.sh
source bin/ditto.sh

# Command line builds already stage binaries to Products/
if [ ! -z $COMMAND_LINE_BUILD ]; then
  exit 0
fi

if [ ${CONFIGURATION} != "Debug" ]; then
  info "Skipping staging to Products; only necessary for Debug configuration"
  info "Nothing to do; exiting 0."
  exit 0
fi

if [ ${EFFECTIVE_PLATFORM_NAME} = "-iphoneos" ]; then
  info "Building from Xcode; will stage binary to Products/ipa"
  APP_TARGET_DIR=${SOURCE_ROOT}/Products/ipa
else
  info "Building from Xcode; will stage binary to Products/app"
  APP_TARGET_DIR=${SOURCE_ROOT}/Products/app
fi

banner "Preparing"

info "Xcode build detected; will stage binary to $APP_TARGET_DIR"

rm -rf "${APP_TARGET_DIR}"
mkdir -p "${APP_TARGET_DIR}"

info "Cleaned install directory: ${APP_TARGET_DIR}"

APP_SOURCE_PATH="${CONFIGURATION_BUILD_DIR}/${FULL_PRODUCT_NAME}"
APP_TARGET_PATH="${APP_TARGET_DIR}/${FULL_PRODUCT_NAME}"
ditto_or_exit "${APP_SOURCE_PATH}" "${APP_TARGET_PATH}"
info "Copied .app to ${APP_TARGET_DIR}/${FULL_PRODUCT_NAME}"

DSYM_SOURCE_PATH="${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}"
DSYM_TARGET_PATH="${APP_TARGET_DIR}/${DWARF_DSYM_FILE_NAME}"
ditto_or_exit "${DSYM_SOURCE_PATH}" "${DSYM_TARGET_PATH}"
info "Copied .dSYM to ${APP_TARGET_DIR}/${DWARF_DSYM_FILE_NAME}"

if [ ${EFFECTIVE_PLATFORM_NAME} = "-iphoneos" ]; then

  banner "Creating ipa"

  PAYLOAD_DIR="${APP_TARGET_DIR}/Payload"
  mkdir -p "${PAYLOAD_DIR}"
  PAYLOAD_APP="${PAYLOAD_DIR}/${FULL_PRODUCT_NAME}"
  ditto_or_exit "${APP_TARGET_PATH}" "${PAYLOAD_APP}"

  IPA_PATH="${APP_TARGET_DIR}/${TARGET_NAME}.ipa"

  info "Zipping .app to ${IPA_PATH}"
  xcrun ditto -ck --rsrc --sequesterRsrc --keepParent \
    "${PAYLOAD_APP}" \
    "${IPA_PATH}"
  info "Installed .ipa to ${IPA_PATH}"
fi

info "Done!"

