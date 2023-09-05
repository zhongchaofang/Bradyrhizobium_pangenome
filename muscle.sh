for i in cluster*
do
muscle -in $i -out ./muscle_out/$i".muscleout"
echo $i muscle end time is `date`
done
echo muscle.sh end time is `date`
