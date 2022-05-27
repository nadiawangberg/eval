#DOCUMENTATION
# $1: The start of the name of the folders that should be compd (The only difference between these two should be the suffix 'dyn' / 'orig')


mkdir $1_comp
mkdir $1_comp/ATE
mkdir $1_comp/RPE
mkdir $1_comp/comp

cp $1_orig/metrics/$1_orig_ATE.zip $1_comp/ATE/Kimera-VIO # ATE
cp $1_dyn/metrics/$1_dyn_ATE.zip $1_comp/ATE/Semantic-Kimera-VIO # ATE

cp $1_orig/metrics/$1_orig_RPE.zip $1_comp/RPE/Kimera-VIO # RPE
cp $1_dyn/metrics/$1_dyn_RPE.zip $1_comp/RPE/Semantic-Kimera-VIO # RPE


cd $1_comp/RPE
evo_res Kimera-VIO Semantic-Kimera-VIO --use_filenames --plot --save_plot ../comp/$1_comp_rpe.svg --save_table  ../comp/$1_comp_rpe_table.tex

cd ..
cd ..
cd $1_comp/ATE
evo_res Kimera-VIO Semantic-Kimera-VIO --use_filenames --plot --save_plot ../comp/$1_comp_ate.svg --save_table ../comp/$1_comp_ate_table.tex
