mkdir comp_for_report
mkdir comp_for_report/$1


evo_res $1_dyn_1/metrics/$1_dyn_ATE.zip $1_orig_1/metrics/$1_orig_ATE.zip --use_filenames --save_plot comp_for_report/dyn/comp_for_report_ate.svg --save_table  comp_for_report/dyn/comp_for_report_ate_table.tex
evo_res $1_dyn_1/metrics/$1_dyn_RPE.zip $1_orig_1/metrics/$1_orig_RPE.zip --use_filenames --save_plot comp_for_report/dyn/comp_for_report_rpe.svg --save_table  comp_for_report/dyn/comp_for_report_rpe_table.tex