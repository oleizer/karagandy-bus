#!/bin/bash

if [ "$USER" == "jenkins" ]; then
        echo "Running on jenkins. Exit."
        exit 0
fi

if [ $# -eq 0 ]; then
    echo "No arguments supplied. Exit."
    exit 0
fi

FILE_NAME="buildtimes.log"

START_TIME=$(cat $FILE_NAME | head -n 1)
END_TIME=$(date +%s)
DELTA=$(($END_TIME-$START_TIME))
TYPE=$(cat $FILE_NAME | tail -n 1)
STAT_TYPE=""$TYPE"_"$1""

echo ""$STAT_TYPE" time: $DELTA"

NORMALIZATION_COEF="20" # время в секундах, меньше которого считаем данные погрешностью

if (( $DELTA > $NORMALIZATION_COEF )); then
  curl -d "{\"type\": \"$STAT_TYPE\", \"value\": $DELTA}" -H "Content-Type: application/json" -X POST https://techmetrics.ru/api/compileTime
  echo "Stat sent"
fi


# Args to track
# ACTION = build
# USER
# arch
# TARGET_NAME=AlphaBank
