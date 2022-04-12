import sys
import numpy as np
import matplotlib.pyplot as plt

fullpath_comp_folder = sys.argv[1]
name_of_dataset = fullpath_comp_folder[-14:-5]

fullpath_dyn_rpe_tex = fullpath_comp_folder + "/dyn/" + name_of_dataset + "_comp_rpe_table.tex"
fullpath_dyn_ate_tex = fullpath_comp_folder + "/dyn/" + name_of_dataset + "_comp_ate_table.tex"
fullpath_orig_rpe_tex = fullpath_comp_folder + "/orig/" + name_of_dataset + "_comp_rpe_table.tex"
fullpath_orig_ate_tex = fullpath_comp_folder + "/orig/" + name_of_dataset + "_comp_ate_table.tex"

def read_latex_table(textable_fullpath):
    # Converts from Latex table with metrics to numpy array
    with open(textable_fullpath) as f:
        lines = f.readlines()
        metrics = lines[4:-2]

    boxplt_arr = []
    for row in metrics:
        row = row.split("&")[1:]
        row[-1] = row[-1][:9] #Remove '////n' from end of row

        row_of_floats = np.array([float(num_str) for num_str in row])

        boxplt_arr.append(row_of_floats)

    boxplt_arr = np.array(boxplt_arr).transpose()
    return boxplt_arr

def plot_figure(data, title, name_of_dataset):
    fig1, ax1 = plt.subplots()

    subtitle = "\n (for 10 runs on the VIODE " + name_of_dataset[:-3] + " dataset)"
    ax1.set_title(title + subtitle)

    bplot = ax1.boxplot(data, patch_artist=True)

    # fill with colors
    colors = ['pink', 'lightblue', 'lightgreen']
    for patch, color in zip(bplot['boxes'], colors):
        patch.set_facecolor(color)

    ax1.legend(["Semantic-Kimera-VIO", "Kimera-VIO"], labelcolor=colors)

    fullpath_svg = fullpath_comp_folder + "/" + name_of_dataset + "_" + title + ".svg"
    plt.savefig(fullpath_svg)
    plt.show()



metric_title = ["RMSE", "Mean", "Median"]
metric_index = int(input("Which metric to use (rmse: 0, mean: 1, median: 2)"))

boxplt_dyn_rpe = read_latex_table(fullpath_dyn_rpe_tex)
boxplt_orig_rpe = read_latex_table(fullpath_orig_rpe_tex)
boxplt_rpe = [boxplt_dyn_rpe[metric_index], boxplt_orig_rpe[metric_index]]

boxplt_dyn_ate = read_latex_table(fullpath_dyn_ate_tex)
boxplt_orig_ate = read_latex_table(fullpath_orig_ate_tex)
boxplt_ate = [boxplt_dyn_ate[metric_index], boxplt_orig_ate[metric_index]]


title_rpe = metric_title[metric_index] + " RPE"
title_ate = metric_title[metric_index] + " ATE"

plot_figure(data=boxplt_rpe, title=title_rpe, name_of_dataset=name_of_dataset)
plot_figure(data=boxplt_ate, title=title_ate, name_of_dataset=name_of_dataset)


# save figure as fullpath_comp_folder + "/" + metric_title[metric_index] + "_ATE"
