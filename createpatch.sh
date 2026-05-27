#!/bin/bash
find . \
    -path './.git' -prune -o \
    -type f \
    ! -name '*.patch' \
    ! -name 'createpatch.sh' -print0 \
    | xargs -0 -I{}  cp --parents {} /tmp/linux/drivers/net/wireless/espressif

cd /tmp/linux/drivers/net/wireless/espressif
git add .
git diff --staged > esp_hosted.patch

# command to get diff for everything committed in repo. But if done in the wiroc-esp-hosted-host-driver repo it won't have the correct
# paths...
#git diff $(git rev-list --max-parents=0 HEAD) HEAD -- . ':(exclude)wireless-kconfig.patch' ':(exclude)wireless-makefile-kconfig.patch' ':(exclude)createpatch.sh' ':(exclude)esp_hosted.patch' > esp_hosted.patch
