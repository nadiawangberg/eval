#DOCUMENTATION
#NOTE - assumes ten executions were done

# $1: The name of the first folders that should be used in the comparison (without the dyn/orig nor _$i suffix)

cd boxplot_$1

mkdir $1_comp
mkdir $1_comp/dyn
mkdir $1_comp/orig


evo_res $1_dyn_1/metrics/$1_dyn_ATE.zip $1_dyn_2/metrics/$1_dyn_ATE.zip $1_dyn_3/metrics/$1_dyn_ATE.zip $1_dyn_4/metrics/$1_dyn_ATE.zip $1_dyn_5/metrics/$1_dyn_ATE.zip --use_filenames --save_plot $1_comp/dyn/$1_comp_ate.svg --save_table  $1_comp/dyn/$1_comp_ate_table.tex
evo_res $1_dyn_1/metrics/$1_dyn_RPE.zip $1_dyn_2/metrics/$1_dyn_RPE.zip $1_dyn_3/metrics/$1_dyn_RPE.zip $1_dyn_4/metrics/$1_dyn_RPE.zip $1_dyn_5/metrics/$1_dyn_RPE.zip --use_filenames --save_plot $1_comp/dyn/$1_comp_rpe.svg --save_table  $1_comp/dyn/$1_comp_rpe_table.tex

evo_res $1_orig_1/metrics/$1_orig_ATE.zip $1_orig_2/metrics/$1_orig_ATE.zip $1_orig_3/metrics/$1_orig_ATE.zip $1_orig_4/metrics/$1_orig_ATE.zip $1_orig_5/metrics/$1_orig_ATE.zip --use_filenames --save_plot $1_comp/orig/$1_comp_ate.svg --save_table  $1_comp/orig/$1_comp_ate_table.tex
evo_res $1_orig_1/metrics/$1_orig_RPE.zip $1_orig_2/metrics/$1_orig_RPE.zip $1_orig_3/metrics/$1_orig_RPE.zip $1_orig_4/metrics/$1_orig_RPE.zip $1_orig_5/metrics/$1_orig_RPE.zip --use_filenames --save_plot $1_comp/orig/$1_comp_rpe.svg --save_table  $1_comp/orig/$1_comp_rpe_table.tex