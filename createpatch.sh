#!/bin/bash
git diff $(git rev-list --max-parents=0 HEAD) HEAD -- . ':(exclude)wireless-kconfig.patch' ':(exclude)wireless-makefile-kconfig.patch' ':(exclude)createpatch.sh' ':(exclude)esp_hosted.patch' > esp_hosted.patch
