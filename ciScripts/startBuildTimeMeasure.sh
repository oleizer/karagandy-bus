#!/bin/bash

BUILDTIME_FILE="buildtimes.log"
echo "$(date +%s)" > $BUILDTIME_FILE

CACHE_DIRECTORY=""$BUILT_PRODUCTS_DIR"/"$EXECUTABLE_PATH""
echo "CACHE_DIRECTORY = $CACHE_DIRECTORY"

if [ -f "$CACHE_DIRECTORY" ]; then
  echo "Warm build"
  echo "warm" >> $BUILDTIME_FILE
else
  echo "Cold build"
  echo "cold" >> $BUILDTIME_FILE
fi
