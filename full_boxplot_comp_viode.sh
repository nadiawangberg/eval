# $1 - dataset (office / office_w_people)

dataset=$1
d=1m #long enough for all uhumans datasets

# ./run_all_uhumans_boxplts.sh ${dataset} ${d} #Runs 3x executions

cd evaluation
yes | ./compare_results_for_boxplots.sh ${dataset}_${d} #Runs evo_traj comparing between the 3x executions
python3 box_plot.py boxplot_${dataset}_${d}/${dataset}_${d}_comp uHumans2 #Create box_plot and compute average metrics between the 3x executions