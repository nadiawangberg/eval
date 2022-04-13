import sys
import numpy as np
import matplotlib.pyplot as plt
from utils import find_percentage_diff

fullpath_comp_folder = sys.argv[1]
name_of_parent_dataset = sys.argv[2]
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

    num_executions = len(metrics)

    boxplt_arr = []
    for row in metrics:
        row = row.split("&")[1:]
        row[-1] = row[-1][:9] #Remove '////n' from end of row

        row_of_floats = np.array([float(num_str) for num_str in row])

        boxplt_arr.append(row_of_floats)

    boxplt_arr = np.array(boxplt_arr).transpose()
    return boxplt_arr, num_executions

def plot_figure(data, title, name_of_dataset, show_plt, name_of_parent_dataset, N):
    fig1, ax1 = plt.subplots()

    subtitle = "\n (for " + str(N) + " executions on the " + name_of_parent_dataset + " " + name_of_dataset[:-3] + " dataset)"
    ax1.set_title(title + subtitle)

    bplot = ax1.boxplot(data, patch_artist=True)

    # fill with colors
    colors = ['pink', 'lightblue', 'lightgreen']
    for patch, color in zip(bplot['boxes'], colors):
        patch.set_facecolor(color)

    ax1.legend(["Semantic-Kimera-VIO", "Kimera-VIO"], labelcolor=colors)

    fullpath_svg = fullpath_comp_folder + "/" + name_of_dataset + "_" + title + ".svg"
    plt.savefig(fullpath_svg)
    if show_plt: plt.show()


def create_avg_metric_tex(metric_orig, metric_modif):
    avg_metric_orig = np.median(metric_orig)
    avg_metric_modif = np.median(metric_modif)
    perc_diff = round(((avg_metric_orig-avg_metric_modif) / avg_metric_orig) * 100, 2)

    latex_str = f"{round(avg_metric_orig,3)} & {round(avg_metric_modif,3)} & {perc_diff}\%"
    return latex_str



metric_title = ["RMSE", "Mean", "Median"]
#metric_index = int(input("Which metric to use (rmse: 0, mean: 1, median: 2)"))
metric_index = 0

boxplt_dyn_rpe, N = read_latex_table(fullpath_dyn_rpe_tex)
boxplt_orig_rpe, _ = read_latex_table(fullpath_orig_rpe_tex)
boxplt_rpe = [boxplt_dyn_rpe[metric_index], boxplt_orig_rpe[metric_index]]

boxplt_dyn_ate, _ = read_latex_table(fullpath_dyn_ate_tex)
boxplt_orig_ate, _ = read_latex_table(fullpath_orig_ate_tex)
boxplt_ate = [boxplt_dyn_ate[metric_index], boxplt_orig_ate[metric_index]]


title_rpe = metric_title[metric_index] + " RPE"
title_ate = metric_title[metric_index] + " ATE"

ate_tex_str = create_avg_metric_tex(boxplt_orig_ate[metric_index], boxplt_dyn_ate[metric_index])
rpe_tex_str = create_avg_metric_tex(boxplt_orig_rpe[metric_index], boxplt_dyn_rpe[metric_index])

# fullpath_comp_folder/../../metrics_avg_ATE_log.txt
# fullpath_comp_folder/../../metrics_avg_RPE_log.txt


logging_str = ""
logging_str += " \n---------------------------\n"
logging_str += ("Dataset:" + name_of_dataset + "\n")
logging_str += title_rpe + "\n"
logging_str += rpe_tex_str + "\n\n"
logging_str += title_ate + "\n"
logging_str += ate_tex_str + "\n\n"
logging_str += "---------------------------\n"

logging_file_name = fullpath_comp_folder + "/../../metrics_avg_log.txt" 

with open(logging_file_name, 'a') as f:
    data = f.write(logging_str)

print(logging_str)

plot_figure(data=boxplt_rpe, title=title_rpe, name_of_dataset=name_of_dataset, show_plt=False, name_of_parent_dataset=name_of_parent_dataset, N=N)
plot_figure(data=boxplt_ate, title=title_ate, name_of_dataset=name_of_dataset, show_plt=False name_of_parent_dataset=name_of_parent_dataset, N=N)