#from evaluation

import numpy as np
import sys

dataset_name = sys.argv[1] #  [0_day / office / office_w_people]
d = sys.argv[2] # duration
dataset_group = sys.argv[3]
environment = sys.argv[4]

#boxplot_{dataset_name}_{d}


rosbag_duration_d = {"parking": 59.6, "city": 66, "office":506, "apartment":138, "subway": 738, "neighborhood": 486.3}

if dataset_group == "uhumans":
    num_exec = 5
elif dataset_group == "viode":
    num_exec = 10

rosbag_duration = rosbag_duration_d[environment] #NOTE, assumed that this is equivalent to ground truth tracking duration


track_time_dyn_lst = [None]*num_exec
track_time_orig_lst = [None]*num_exec

dataset_name_dur = f"{dataset_name}_{d}"

def round_3_sigfig(num):
    return float('%.3g' % num)

def tracktime_from_tex(metadata_tex_f):
    with open(metadata_tex_f) as f:
        lines = f.readlines()
        tracktime = float(lines[6].split(" ")[-2])

    return tracktime


for i in range(num_exec):
    metadata_dyn_tex_f = f"boxplot_{dataset_name}_{d}/{dataset_name}_{d}_dyn_{i+1}/{dataset_group}_{dataset_name}_{d}_dyn_table.tex"
    metadata_orig_tex_f = f"boxplot_{dataset_name}_{d}/{dataset_name}_{d}_orig_{i+1}/{dataset_group}_{dataset_name}_{d}_orig_table.tex"

    tt_dyn_i = tracktime_from_tex(metadata_dyn_tex_f)
    tt_orig_i = tracktime_from_tex(metadata_orig_tex_f)

    track_time_dyn_lst[i] = tt_dyn_i
    track_time_orig_lst[i] = tt_orig_i



track_time_dyn_avg = np.mean(track_time_dyn_lst)
track_time_orig_avg = np.mean(track_time_orig_lst)

SR_dyn_avg = track_time_dyn_avg / rosbag_duration #Semantic-Kimera-VIO
SR_orig_avg = track_time_orig_avg / rosbag_duration #Kimera-VIO
SR_improvement_perc = (SR_dyn_avg-SR_orig_avg)/SR_orig_avg * 100

# print("modif", round_2_sigfig(track_time_dyn_avg), SR_dyn_avg)
# print("orig", round_2_sigfig(track_time_orig_avg), SR_orig_avg)
logfile = "SR_log.txt"

logging_str = ""
logging_str += " \n---------------------------\n"
logging_str += ("Dataset:" + dataset_name + "\n")
logging_str += f"{round_3_sigfig(SR_orig_avg)} & {round_3_sigfig(SR_dyn_avg)} & {round_3_sigfig(SR_improvement_perc)}\% "
logging_str += "\n---------------------------\n"


print(f"writing SR* for {dataset_name} to file...")
with open(logfile, 'a') as f:
    data = f.write(logging_str)