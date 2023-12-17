for i in cluster*
do
/data5/zcf/muscle -in $i -out ./muscle_out/$i"_muscleout"
echo $i muscle end time is `date`
done
echo muscle.sh end time is `date`
