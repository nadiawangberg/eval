#!/usr/bin/python

import sys
import os
import json

path = sys.argv[1] # "/home/nadia/bags/eval/evaluation/office_w_people_9m_dyn/metrics/office_w_people_9m_dyn_ATE"

print("Converting from .json to .tex table")

json_filename = path + "/stats.json"
tex_filename = path + "/stats.tex"


# if not os.path.exists(path):
#     os.mkdir(path)


try:
    f_tex = open(tex_filename, "w")
except:
    print("RPE and ATE was not generated, exiting table_json_to_tex.py file...")
    sys.exit(1)


with open(json_filename) as f_json:
    data = json.load(f_json)

    f_tex.write("\\begin{table}[!ht] \n \\centering \n \\begin{tabular}{|l|l|} \\hline \n \\multicolumn{2}{|c|}{RPE/ATE} \\\ \\hline \n ")

    for key, value in data.items():
        f_tex.write(f"{key} & {value} \\\ \\hline \n")

    f_tex.write("\\end{tabular} \n \\end{table}")

f_tex.close()
f_json.close()