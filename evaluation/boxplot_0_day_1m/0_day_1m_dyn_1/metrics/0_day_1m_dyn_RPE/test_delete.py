import numpy as np

stamps = np.load("timestamps.npy")
error = np.load("error_array.npy")
align = np.load("alignment_transformation_sim3.npy")
sec_from_start = np.load("seconds_from_start.npy")

print("stamps: ", stamps.ndim, len(stamps))
print("stamps: ", stamps[-1]-stamps[0])