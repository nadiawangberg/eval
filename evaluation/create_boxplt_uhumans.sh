dataset=$1
d=15m #long enough for all uhumans datasets


python3 box_plot.py boxplot_${dataset}_${d}/${dataset}_${d}_comp uHumans2 #Create box_plot and compute average metrics between the 3x executions
