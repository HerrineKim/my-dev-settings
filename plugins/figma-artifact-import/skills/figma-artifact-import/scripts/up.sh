#!/bin/bash
# up.sh <files.txt> <startLine(1-based)> <pageId e.g. 132:1004> <uuid...>
# upload_assets가 준 1회용 URL(uuid)마다 files.txt의 다음 파일을 POST한다. imageHash = 파일 SHA1.
list=$1; i=$2; page=${3/:/%3A}; shift 3
for u in "$@"; do f=$(sed -n "${i}p" "$list"); ct=image/png; case "$f" in *.jpg) ct=image/jpeg;; *.webp) ct=image/webp;; esac
 ( r=$(curl -s -X POST -H "Content-Type: $ct" --data-binary @"$f" "https://mcp.figma.com/mcp/upload/$u/submit?scaleMode=FILL&currentPageId=$page"); echo "$i $(echo "$r" | grep -o '"success":[a-z]*\|error[^,]*')" ) &
 i=$((i+1)); done; wait
