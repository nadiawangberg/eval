
bagname=$1 #'0_none' # 0_none, 1_low, 2_mid, 3_high
d=$2 #1m


mkdir evaluation/boxplot_${bagname}_${d}


for i in 1 2 3 4 5 6 7 8 9 10
do
	./launch_and_plot_viode.sh $bagname $d false dyn
    cd evaluation
    mv --backup=numbered ${bagname}_${d}_dyn boxplot_${bagname}_${d}/${bagname}_${d}_dyn_$i
    cd ..
done

for i in 1 2 3 4 5 6 7 8 9 10
do
	./launch_and_plot_viode.sh $bagname $d false orig
    cd evaluation
    mv --backup=numbered ${bagname}_${d}_orig boxplot_${bagname}_${d}/${bagname}_${d}_orig_$i
    cd ..
done
