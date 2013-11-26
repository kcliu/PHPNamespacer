#!/bin/sh
rm -rf .nstmp
mkdir -p .nstmp
checkPath=('class' 'src/class' 'public' 'src/public')
nsPath=('class' 'src/class' 'vendor/eztable/kernel/class')

#gen check list
find ${checkPath[@]} 2> /dev/null| xargs awk '/^use/ {print substr($2, 0, length($2)-1)}' >> .nstmp/checklist.txt

#gen namespace table
for ns in "${nsPath[@]}"
do
    # echo $ns
    (cd $ns 2> /dev/null&& find . -type f -name '*.php'| sed 's/^.\/\(.*\).php$/\1/' | sed 's/\//\\/g') >> .nstmp/nstable.txt
done

#matching namespace
while read -r line
do
    # echo $line
    if grep -Fxq "$line" .nstmp/nstable.txt
    then :
    else
        echo "$line not found"
    fi
done < .nstmp/checklist.txt