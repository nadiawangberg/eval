
bagname=$1 # office, office_w_people, office_half
d=$2 #9m for office, 12m ish for subway?

mkdir evaluation/boxplot_${bagname}_${d}

for i in 1 2 3
do
	./launch_and_plot.sh $bagname $d false dyn
    cd evaluation
    mv ${bagname}_${d}_dyn boxplot_${bagname}_${d}/${bagname}_${d}_dyn_$i
    cd ..
done

for i in 1 2 3
do
	./launch_and_plot.sh $bagname $d false orig
    cd evaluation
    mv ${bagname}_${d}_orig boxplot_${bagname}_${d}/${bagname}_${d}_orig_$i
    cd ..
done
