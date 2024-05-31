#!/usr/bin/env bash

N=1
while true; do
  if [ ! -f ./Log/explain_${N}.log ];
  then
      fileLogName="./Log/explain_${N}.log"
      break
  else ((N++))
  fi
done

LINE="___________________________________________________"
echo "Filename: $fileLogName">>$fileLogName
echo "$LINE">>$fileLogName

for ((j = 1; j <= 3; j++))
do
  echo "Query${j} Results: ">>$fileLogName

  times_array=()
  for ((i = 1; i <= 5; i++))
  do
      output="$(psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -f Query${j}.sql)"
      exec_time=$( echo "$output" | tail -n 2 | head -n 1 | awk '{ print $3 }' )
      times_array+=("$exec_time")
  done

  sorted_numbers=($(printf "%s\n" "${times_array[@]}" | sort -g))
  lowest=${sorted_numbers[0]}
  highest=${sorted_numbers[${#sorted_numbers[@]}-1]}
  total=0

  for number in "${sorted_numbers[@]}"; do
      echo "$number" >> sorted_numbers.temp
  done

  average=$(awk '
    BEGIN {
        sum = 0
        count = 0
    }
    {
        sum += $1
        count++
    }
    END {
        if (count > 0) {
            avg = sum / count
            printf "%f\n", avg
        } else {
            print "0"
        }
    }
    ' sorted_numbers.temp)

    rm sorted_numbers.temp

  echo "best_result: $lowest">>$fileLogName
  echo "worst_result: $highest">>$fileLogName
  echo "average_result: $average">>$fileLogName
  echo "$LINE">>$fileLogName
done