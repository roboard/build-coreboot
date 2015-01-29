#! /bin/bash

BASE_DIR=`dirname $0`

TARGET_NAME=$1

if [ -z $TARGET_NAME ]; then
  echo "Usage :"
  echo "$0 TARGET_NAME"
  exit 1
fi

if ! [ -f $TARGET_NAME ]; then
  echo "$TARGET_NAME : File not found."
  exit 1
fi

. $TARGET_NAME

echo Setup coreboot...
(cd ${BASE_DIR}/coreboot && git checkout ${COREBOOT_COMMIT}) || exit 1
(cd ${BASE_DIR} && cp config/coreboot/${COREBOOT_CONFIG} coreboot/.config) || exit 1
if ! [ -z $SEABIOS_COMMIT ]; then
  echo Setup SeaBIOS...
  (cd ${BASE_DIR}/seabios && git checkout ${SEABIOS_COMMIT}) || exit 1
  (cd ${BASE_DIR} && cp config/seabios/${SEABIOS_CONFIG} seabios/.config) || exit 1
fi

echo Save .target file.
echo $TARGET_NAME > .target
