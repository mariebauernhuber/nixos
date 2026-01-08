#!/bin/bash

current=$(date +%H%M)  # 0823 for 08:23
current_s=$(date +%H%M%S) #082351 for 08:23:51

if      [ "$current" -ge 820 ] && [ "$current" -le 825 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 1 ending soon!"}'
elif [ "$current" -ge 910 ] && [ "$current" -le 915 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 2 ending soon!"}'
elif [ "$current" -ge 1010 ] && [ "$current" -le 1015 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 3 ending soon!"}'
elif [ "$current" -ge 1100 ] && [ "$current" -le 1105 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 4 ending soon!"}'
elif [ "$current" -ge 1200 ] && [ "$current" -le 1205 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 5 ending soon!"}'
elif [ "$current" -ge 1250 ] && [ "$current" -le 1255 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 6 ending soon!"}'
elif [ "$current" -ge 1425 ] && [ "$current" -le 1430 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 7 ending soon!"}'
elif [ "$current" -ge 1510 ] && [ "$current" -le 1515 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 8 ending soon!"}'
elif [ "$current" -ge 1600 ] && [ "$current" -le 1605 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 9 ending soon!"}'
elif [ "$current" -ge 1645 ] && [ "$current" -le 1650 ]; then
    echo '{"text": "󰜸", "class": "warning", "tooltip": "Lesson 10 ending soon!"}'

elif [ "$current" -ge 825 ] && [ "$current" -le 830 ]; then
    BREAK_END=83000
    remaining=$((BREAK_END - current))
    echo "{\"text\": \"☕ ${remaining}m\", \"class\": \"break\", \"tooltip\": \"Youre on break! ${remaining}min left until class at 08:30!\"}"
elif [ "$current" -ge 915 ] && [ "$current" -le 930 ]; then
    BREAK_END=93000
    remaining=$((BREAK_END - current))
    echo "{\"text\": \"☕ ${remaining}m\", \"class\": \"break\", \"tooltip\": \"Youre on break! ${remaining}min left until class at 09:30!\"}"
elif [ "$current" -ge 1015 ] && [ "$current" -le 1020 ]; then
    BREAK_END=102000
    remaining=$((BREAK_END - current))
    echo "{\"text\": \"☕ ${remaining}m\", \"class\": \"break\", \"tooltip\": \"Youre on break! ${remaining}min left until class at 10:20!\"}"
elif [ "$current" -ge 1105 ] && [ "$current" -le 1120 ]; then
    BREAK_END=112000
    remaining=$((BREAK_END - current))
    echo "{\"text\": \"☕ ${remaining}m\", \"class\": \"break\", \"tooltip\": \"Youre on break! ${remaining}min left until class at 11:20!\"}"
elif [ "$current" -ge 1205 ] && [ "$current" -le 1210 ]; then
    BREAK_END=121000
    remaining=$((BREAK_END - current))
    echo "{\"text\": \"☕ ${remaining}m\", \"class\": \"break\", \"tooltip\": \"Youre on break! ${remaining}min left until class at 12:10!\"}"
elif [ "$current" -ge 1255 ] && [ "$current" -le 1345 ]; then
    BREAK_END=134000 #Adjusted for it not knowing that an hour ends at 60min
    remaining=$((BREAK_END - current))
    echo "{\"text\": \"☕ ${remaining}m\", \"class\": \"break\", \"tooltip\": \"Youre on lunchbreak! ${remaining}min left until class 13:45!\"}"
elif [ "$current" -ge 1515 ] && [ "$current" -le 1520 ]; then 
    BREAK_END=152000
    remaining=$((BREAK_END - current))
    echo "{\"text\": \"☕ ${remaining}m\", \"class\": \"break\", \"tooltip\": \"Youre on break! ${remaining}min left until class at 15:20!\"}"
else
    echo '{"text": "", "tooltip": ""}'
fi
