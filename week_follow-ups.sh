
#!/bin/bash

# Usage:

# For most recent completed week:
# $ ./week_follow-ups.sh

# For previous weeks:
# $ ./week_follow-ups.sh 2


# ADD TOE SCRIPT: check if exists in /archive folder

mkdir -p follow-ups

weeks_back=${1:-1}
days_back=`expr $weeks_back \* 7`

week_date_formatted=`date -v -Mon -v-${days_back}d +"%Y-%m-%d"`
follow_ups_file="follow-ups/week-of-$week_date_formatted.md"

if [[ -f "$follow_ups_file" ]]; then
  printf "Follow ups file already exists for week of $week_date_formatted\n"
  exit
fi

touch $follow_ups_file

printf "# Week of $week_date_formatted\n" >> $follow_ups_file


end=`expr $days_back - 6`

for (( i=$days_back; i>=$end; i-- ))
do
  if [ -f logs/$(date -v -Mon -v-${i}d +"%Y-%m-%d")/daily.md ]; then
    date_formatted=`date -v -Mon -v-${i}d +"%Y-%m-%d"`
    printf "\n## $date_formatted\n" >> $follow_ups_file
    grep -A 1000 '/ Todos' logs/$(date -v -Mon -v-${i}d +"%Y-%m-%d")/daily.md | sed -n '1!p' | sed '/^[[:space:]]*$/d' >> $follow_ups_file
  fi
done
