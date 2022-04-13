import sys
from utils import find_percentage_diff

metircs_orig_latex_str = sys.argv[1]
metrics_modif_latex_str = sys.argv[2]




print(find_percentage_diff(metircs_orig_latex_str, metrics_modif_latex_str))