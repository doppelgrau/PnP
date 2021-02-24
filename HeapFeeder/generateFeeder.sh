#!/bin/bash

feeder=$1
coordX=$2
coordY=$3
centerDistance=14.8
rowWidth=5.8
rows="A B C D"
collums="1 2 3 4 5 6 7 8 9"
dropBox="DropBox-1588870767912"
lastY=-75
lastX=240

rowCounter=-1
for row in $rows; do
    rowCounter=$[ $rowCounter + 1 ]
    curX=$(echo "$coordX + $rowCounter * $centerDistance" | bc)
    if [ $rowCounter -ge 2 ]; then
         curX=$(echo "$curX + $rowWidth" | bc)
    fi
    for collum in $collums; do
        curY=$(echo "$coordY + ($collum - 1) * $centerDistance" | bc)
        firstX=$curX
        if [ $[ $rowCounter % 2 ] -eq 0 ]; then
            firstX=$(echo "$firstX - ( $centerDistance + $rowWidth ) / 2" | bc)
        else
            firstX=$(echo "$firstX + ( $centerDistance + $rowWidth ) / 2" | bc)
        fi
        cat <<EOFEOFEOF
         <feeder class="org.openpnp.machine.reference.feeder.ReferenceHeapFeeder" id="FDR$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM" name="HF $feeder - $row$collum" enabled="false" part-id="HeapFeeder-Dummy" retry-count="2" pick-retry-count="2" drop-box-id="$dropBox" box-depth="-25.0" last-feed-depth="-5" throw-away-drop-box-content-after-failed-feeds="7" required-vacuum-difference="300">
            <location units="Millimeters" x="$curX" y="$curY" z="-18.0" rotation="0.0"/>
            <way-1 units="Millimeters" x="$firstX" y="$curY" z="0.0" rotation="0.0"/>
            <way-2 units="Millimeters" x="$firstX" y="$lastY" z="0.0" rotation="0.0"/>
            <way-3 units="Millimeters" x="$lastX" y="$lastY" z="0.0" rotation="0.0"/>
         </feeder>
EOFEOFEOF
    done
done
