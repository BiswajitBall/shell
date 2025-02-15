#/bin/sh

OUTPUT='reached required accuracy - stopping structural energy minimisation'
if echo "$OUTPUT" | grep -q 'reached required accuracy - stopping structural energy minimisation' OUTCAR
then
echo "Geometry optimization is successful"
else
echo "Geometry optimization failed"
fi
