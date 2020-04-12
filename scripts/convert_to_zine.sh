#!/bin/bash
# Usage: ./convert_to_zine.sh english/zines/so-you-want-to-be-a-wizard
# Requres inkscape and pdftk
set -e

mkdir tmp
ZINE=`basename $1`
for page in $1/*.svg
do
    inkscape $page --export-pdf=tmp/$(basename $page).pdf
done
pdftk tmp/*.pdf cat output $ZINE.pdf
rm -rf tmp
