#!/bin/sh

array=( initial saddle )
for ((k=0;k<${#array[@]};k++))
do
  cd ${array[k]}/BIII_X
  awk 'END {print}' python.*.out
  rm *.py python.*
  cd ../../
done > matrix.file




declare -A m
read_matrix() {
    local i=0
    local line
    local j
    #Ignore the first 2 lines containing size of the matrix
    #read rows
    #read cols
    while read -r line; do
        j=0
        # split on spaces
        for v in `echo $line`; do
            m[$i,$j]="$v"
            j=$((j+1))
        done
        i=$((i+1))
    done
}

read_matrix < matrix.file

change_of_bonding=$( echo "($( echo ${m[1,0]} ) - $( echo ${m[0,0]} ))" | bc -l )
change_of_antibonding=$( echo "($( echo ${m[1,1]} ) - $( echo ${m[0,1]} ))" | bc -l )
change_of_bonding_plus_antibonding=$( echo "($( echo ${m[1,2]} ) - $( echo ${m[0,2]} ))" | bc -l )
change_of_bonding_plus_antibonding_lobster=$( echo "($( echo ${m[1,3]} ) - $( echo ${m[0,3]} ))" | bc -l )

echo "$change_of_bonding  $change_of_antibonding  $change_of_bonding_plus_antibonding $change_of_bonding_plus_antibonding_lobster"


#change_of_DOE=$( echo "($( echo ${m[1,0]} ) - $( echo ${m[0,0]} ))" | bc -l )
#change_of_onsite=$( echo "($( echo ${m[1,1]} ) - $( echo ${m[0,1]} ))" | bc -l )
#change_of_offsite=$( echo "($( echo ${m[1,2]} ) - $( echo ${m[0,2]} ))" | bc -l )
#echo "$change_of_DOE $change_of_onsite $change_of_offsite"
