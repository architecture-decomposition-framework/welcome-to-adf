#!/bin/sh
currentMillis=$(date +%s%3N)
tempFile="${1%%\.md}-${currentMillis}.html"
pandoc "$1" -o "$tempFile" -f gfm -t html 
pagedjs-cli -i "$tempFile" -o "${1%%\.md}.pdf" --style "gh-md.css"
rm -f "${tempFile}"