import sys

# print("AAA FROM PYTHON", sys.argv[1])


dur_gt = float(sys.argv[1].split(",")[-1].split(" ")[1][:-1])
dur_odom = float(sys.argv[1].split(",")[2].split(" ")[1][:-1])
tracking_ratio = round(dur_odom / dur_gt,3)

# print("TRAKCING RATE FROM PYTHON: ", tracking_ratio)
print(tracking_ratio)