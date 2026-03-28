#!/bin/bash

DATE=$(date '+%Y-%m-%d %H:%M:%S')

isLive() {
    rootfs=$(findmnt -n -o FSTYPE / 2>/dev/null)
    [[ "$rootfs" == "squashfs" ]] && [[ -d "/usr/share/live" ]]
}

live_exec() {
    if grep -q "26" /etc/os-release 2>/dev/null; then
        bash ./LNS26.sh
    fi
}

normal_exec() {
  if grep -q "26" /etc/os-release 2>/dev/null; then
        bash ./NNS26.sh
    fi
}

echo "------------------------------------------------------------------${DATE}"
echo "_Lets Begin___________________________________________________________________"
echo ""

if isLive; then
    live_exec
else
    normal_exec
fi
