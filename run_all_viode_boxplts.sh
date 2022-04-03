
bagname='3_high'
d=1m


mkdir evaluation/boxplot_${bagname}_${d}


# for i in 1 2 3 4 5 6 7 8 9 10
# do
# 	./launch_and_plot_viode.sh $bagname $d false dyn
#     cd evaluation
#     mv ${bagname}_${d}_dyn boxplot_${bagname}_${d}/${bagname}_${d}_dyn_$i
#     cd ..
# done

for i in 1 2 3 4 5 6 7 8 9 10
do
	./launch_and_plot_viode.sh $bagname $d false orig
    cd evaluation
    mv ${bagname}_${d}_orig boxplot_${bagname}_${d}/${bagname}_${d}_orig_$i
    cd ..
done
