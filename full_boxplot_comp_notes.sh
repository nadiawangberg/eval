# 10x executions for VIODE, 3x for uHumans
dataset = 0_day
d = 1m

./run_all_viode_boxplts.sh 0_day 1m #Runs 10x executions

cd evaluation
yes | ./compare_results_for_boxplots.sh {dataset}_{d} #Runs evo_traj comparing between the 10x executions
python3 box_plot.py boxplot_{dataset}_{d}/{dataset}_{d}_comp VIODE #Create box_plot and compute average metrics between the 10x executions



#8.4m should be max, rounded up to nearest whole num

dataset = office_w_people
d = 9m

./run_all_uhumans_boxplts.sh {dataset} {d} #Runs 3x executions + evo_traj / evo_rpe / evo_ate

cd evaluation
yes | ./compare_results_for_boxplots_3.sh {dataset}_{d} #Runs evo_res comparing between the 3x executions
python3 box_plot.py boxplot_{dataset}_{d}/{dataset}_{d}_comp uHumans2 #Create box_plot and compute average metrics between the 3x executions



# yes | ./compare_results_for_boxplots_3.sh 0_day_1m
# yes | ./compare_results_for_boxplots_3.sh 0_none_1m
# yes | ./compare_results_for_boxplots_3.sh 1_day_1m
# yes | ./compare_results_for_boxplots_3.sh 1_low_1m
# yes | ./compare_results_for_boxplots_3.sh 2_day_1m
# yes | ./compare_results_for_boxplots_3.sh 2_mid_1m
# yes | ./compare_results_for_boxplots_3.sh 3_day_1m
# yes | ./compare_results_for_boxplots_3.sh 3_high_1m


yes | ./compare_results_for_boxplots_3.sh subway_w_people_15m
yes | ./compare_results_for_boxplots_3.sh subway_15m

yes | ./compare_results_for_boxplots_3.sh office_w_people_15m
yes | ./compare_results_for_boxplots_3.sh office_15m

yes | ./compare_results_for_boxplots_3.sh neighborhood_w_people_15m
yes | ./compare_results_for_boxplots_3.sh neighborhood_15m



python3 box_plot.py boxplot_subway_15m/subway_15m_comp uHumans2 #Create box_plot and compute average metrics between the 3x executions
python3 box_plot.py boxplot_subway_w_people_15m/subway_w_people_15m_comp uHumans2 #Create box_plot and compute average metrics between the 3x executions
