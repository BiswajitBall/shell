#/bin/sh
OUTPUT='WARNING:'
if echo "$OUTPUT" | grep -q 'WARNING:' slurm.*.out
then
    echo "Something is wrong"
else
    echo "There is no WARNING in output"
fi
