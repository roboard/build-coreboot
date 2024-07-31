#! /bin/sh
BASE_DIR=`dirname $0`
. ${BASE_DIR}/repo.opt

# git clone coreboot and seabios
git clone ${COREBOOT_REPO} coreboot && \
git clone ${SEABIOS_REPO} seabios && \
cd coreboot && \
git checkout 86duino-bios-0.9beta-oss && \
wget -O .git/hooks/commit-msg http://review.coreboot.org/tools/hooks/commit-msg && \
chmod +x .git/hooks/commit-msg

