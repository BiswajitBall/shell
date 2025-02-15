#/bin/sh

for i in {01..08}
do
  cd $i
  echo "checking lattice constant, and elements for different images of a neb run:"
  awk 'NR==3 {print $0}' POSCAR
  awk 'NR==4 {print $0}' POSCAR
  awk 'NR==5 {print $0}' POSCAR
  awk 'NR==6 {print $0}' POSCAR
  awk 'NR==7 {print $0}' POSCAR
  cd ../
done

for i in 00 09
do
  cd $i
  echo "checking lattice constant, and elements for the initial and final structure of a neb run:"
  awk 'NR==3 {print $0}' POSCAR
  awk 'NR==4 {print $0}' POSCAR
  awk 'NR==5 {print $0}' POSCAR
  awk 'NR==6 {print $0}' POSCAR
  awk 'NR==7 {print $0}' POSCAR
  cd ..
done

grep ISIF INCAR
grep PAW_PBE POTCAR
