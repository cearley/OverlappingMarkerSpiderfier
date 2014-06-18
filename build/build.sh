#!/bin/bash

INDIR=../lib/
INPREFIX=oms

OUTDIR=../
OUTNAME=${INPREFIX}.min.js
OUTFILE=${OUTDIR}${OUTNAME}

coffee --output $OUTDIR --compile ${INDIR}${INPREFIX}.coffee

java -jar /usr/local/closure-compiler/compiler.jar \
  --compilation_level ADVANCED_OPTIMIZATIONS \
  --js ${OUTDIR}${INPREFIX}.js \
  --externs google_maps_api_v3_7.js \
  --output_wrapper '(function(){%output%}).call(this);' \
> $OUTFILE

echo '/*' $(date) '*/' >> $OUTFILE