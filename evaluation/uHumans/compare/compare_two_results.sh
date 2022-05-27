#DOCUMENTATION
# $1: The name of the first folder that should be used in the comparison
# $2: The name of the second folder that should be used in the comparison

mkdir $1_comp
mkdir $1_comp/ATE
mkdir $1_comp/RPE
mkdir $1_comp/comp

cp $1/metrics/$1_ATE.zip $1_comp/ATE/static-dataset # ATE
cp $2/metrics/$2_ATE.zip $1_comp/ATE/dynamic-dataset # ATE

cp $1/metrics/$1_RPE.zip $1_comp/RPE/static-dataset # RPE
cp $2/metrics/$2_RPE.zip $1_comp/RPE/dynamic-dataset # RPE


cd $1_comp/RPE
evo_res static-dataset dynamic-dataset --use_filenames --plot --save_plot ../comp/$1_comp_rpe.svg --save_table  ../comp/$1_comp_rpe_table.tex

cd ..
cd ..
cd $1_comp/ATE
evo_res static-dataset dynamic-dataset --use_filenames --plot --save_plot ../comp/$1_comp_ate.svg --save_table ../comp/$1_comp_ate_table.tex
