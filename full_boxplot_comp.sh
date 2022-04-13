# 10x executions for VIODE, 3x for uHumans
dataset = 0_day
d = 1m

./run_all_viode_boxplts.sh 0_day 1m #Runs 10x executions
yes | ./compare_results_for_boxplots.sh {dataset}_{d} #Runs evo_traj comparing between the 10x executions
python3 box_plot.py boxplot_{dataset}_{d}/{dataset}_{d}_comp VIODE #Create box_plot and compute average metrics between the 10x executions



#8.4m should be max, rounded up to nearest whole num

dataset = office_w_people
d = 9m

./run_all_uhumans_boxplts.sh {dataset} {d} #Runs 3x executions
yes | ./compare_results_for_boxplots.sh {dataset}_{d} #Runs evo_traj comparing between the 3x executions
python3 box_plot.py boxplot_{dataset}_{d}/{dataset}_{d}_comp uHumans2 #Create box_plot and compute average metrics between the 3x executions

