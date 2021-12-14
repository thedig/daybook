
#!/bin/bash

day_argument=""
day_to_generate=""
date_formatted=""

while getopts 'd:' flag; do
  case "${flag}" in
    d) day_argument="${OPTARG}" ;;
  esac
done

# Some unimportant script change


if [[ ! -z "$day_argument" ]]; then
  day_to_generate=`date -v -${day_argument:0:3} +%F`
  date_formatted=`date -v -${day_argument:0:3} +"%B %d, %Y"`
else
  day_to_generate=`date +%F`
  date_formatted=`date +"%a, %B %d, %Y"`
fi


if [[ -f logs/$day_to_generate/daily.md ]]; then
  printf "Day log already exists\n"
  exit
fi

mkdir logs/$day_to_generate

touch logs/$day_to_generate/daily.md

header='# '
# date_formatted=`date +"%B %d, %Y"`
combined="$header$date_formatted"

echo $combined >> logs/$day_to_generate/daily.md
printf "\n## Focus of the Day\n\n\n\n## Daily log\n\n\n\n## Time spent\n\n\n\n## Follow ups / Todos" >> logs/$day_to_generate/daily.md

# touch logs/$day_to_generate/time.json

# printf '{\n\t"start": "...",\n\t"middle": "...",\n\t"end": "..."\n}' >> logs/$day_to_generate/time.json