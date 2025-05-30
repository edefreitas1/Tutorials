inp=device

siesta_qmmm < $inp.fdf > $inp.out &

while true
do
  if [ -f start_siesta ]
  then
    rm -f start_siesta
    echo `date` ": running SIESTA now" >> output
    mpirun -n 4 siesta < $inp.siesta.fdf > $inp.siesta.out       
    break
  else
    # If the file does not exist wait a small increment of time
    echo "still waiting for file start_siesta" >> output
    sleep 1
  fi  
done

sleep 30
