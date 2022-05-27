dataset=$1
d=$2
datasettype=$3

cd evaluation
python3 box_plot.py boxplot_${dataset}_${d}/${dataset}_${d}_comp $3