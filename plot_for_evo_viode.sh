#DOCUMENTATION
# viode_$1: the name of the rosbag to plot
# $2: set to --plot if you want to visualize the plots

mkdir evaluation
mkdir evaluation/$1
mkdir evaluation/$1/metrics

#Set latex params for plots
evo_config reset
# evo_config set plot_seaborn_style whitegrid
# evo_config set plot_usetex
# evo_config set plot_fontfamily serif plot_fontscale 1.2
# evo_config set plot_linewidth 1.0
# evo_config set plot_reference_linestyle -
# evo_config set plot_figsize 5 4.5


# VARIABLES
T_START=15

T_MAX_DIFF=1.0
N_TO_ALIGN=50

# Table in latex format
evo_config set table_export_format latex
evo_config set save_traj_in_zip true

# Plot graphs
evo_traj bag --no_warnings --t_max_diff $T_MAX_DIFF --sync --align --n_to_align $N_TO_ALIGN viode/viode_$1.bag /kimera_vio_ros/odometry --ref /kimera_vio_ros/gt_odom $2 --plot_mode xy --save_plot evaluation/$1/viode_$1.svg --save_table evaluation/$1/viode_$1_table.tex


# ATE
evo_ape bag --no_warnings --t_start $T_START --t_max_diff $T_MAX_DIFF --align --n_to_align $N_TO_ALIGN viode/viode_$1.bag /kimera_vio_ros/gt_odom /kimera_vio_ros/odometry $2 --plot_mode xy --save_plot evaluation/$1/metrics/$1_ate_plot.svg --save_results evaluation/$1/metrics/$1_ATE.zip

# RPE
evo_rpe bag --no_warnings --t_start $T_START --t_max_diff $T_MAX_DIFF --align --n_to_align $N_TO_ALIGN viode/viode_$1.bag /kimera_vio_ros/gt_odom /kimera_vio_ros/odometry $2 --plot_mode xy --save_plot evaluation/$1/metrics/$1_rpe_plot.svg --save_results evaluation/$1/metrics/$1_RPE.zip


# Convert stats.json to stats.tex

unzip evaluation/$1/metrics/$1_ATE.zip -d evaluation/$1/metrics/$1_ATE 
python3 table_json_to_tex.py  evaluation/$1/metrics/$1_ATE

unzip evaluation/$1/metrics/$1_RPE.zip -d evaluation/$1/metrics/$1_RPE 
python3 table_json_to_tex.py  evaluation/$1/metrics/$1_RPE

# Copy duplicate and rename zipfile
# cp evaluation/$1/metrics/$1_ATE.zip evaluation/$1/metrics/Kimera-VIO
# cp evaluation/$1/metrics/$1_RPE.zip evaluation/$1/metrics/Semantic-Kimera-VIO