#!/bin/bash
#Searches for use of the pause step method in the given feature files, and outputs the total time spent paused.
#First provided argument is a regex of the files to search through. Defaults to "../src/features/ODC*"
#common file patterns: "../src/features/*", "../src/features/ODC*"
#Example usages: sh pauseTracker.sh,  sh pauseTracker.sh "../src/features/*"


ODCFiles="../src/features/ODC*"
files=${1:-$ODCFiles}
regex="I pause for (\d+)ms"


echo "Searching for '$regex' in $files"

millisecondsPaused=0
cat $files | ack  "$regex" --output '$1' | (while read -r line ; do
    ((millisecondsPaused+=$line))
done

secondsPaused=$(bc <<< "scale=5; $millisecondsPaused/1000")
minutesPaused=$(bc <<< "scale=5; $secondsPaused/60")
echo "Total seconds paused: $secondsPaused"
echo "Total minutes paused: $minutesPaused"
)
