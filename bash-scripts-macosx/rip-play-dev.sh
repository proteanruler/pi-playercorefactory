#!/bin/bash

[[ $# -eq 1 ]] || exit
[[ -f "$1" ]] && VIDEOURL=`cat "$1"` || VIDEOURL="$1"
echo $VIDEOURL | while read url; do source $HOME/git/kodi-playercorefactory/bash-scripts-macosx/video-regex.sh

case "$url" in
	"$VIDEOFILE") ffplay -hide_banner -fs "$VIDEOFILE";;
	"$M3U8") ffplay -hide_banner -fs "$M3U8" 2>&1 | sed '/\[/d';;
	"$XFORWARD") ffplay -hide_banner -fs -headers 'X-Forwarded-For: '"$XFORWARDIP"''$'\r\n' "$M3U8";;
	"$USEREF") ffplay -fs -user-agent "$USERAGENT" -headers 'Referer: '"$REFERER"''$'\r\n' "$VIDEOFILE";;
	"$M3U8USERAGENT") ffplay -hide_banner -fs -user-agent "$USERAGENT" "$M3U8";;
	"$M3U8UAGENTREFERER") ffplay -hide_banner -fs -user-agent "$USERAGENT" -headers 'Referer: '"$REFERER"''$'\r\n' "$M3U8UAGNTREF";;
	"$REFUSERAGENT") ffplay -hide_banner -fs -headers 'Referer: '"$REFERER"''$'\r\n' -user-agent "$USERAGENT" "$VIDEOFILE";;
	*) ffplay -hide_banner -fs "$VIDEOURL";;
esac 
done