#!/bin/bash
f1="calyx"
f2="_1000.dae"
f3="_1004.dae"

for i in {1..10}
do
  eval "cp $f1$i$f2 $f1$i$f3"
done

echo "Copying complete."
