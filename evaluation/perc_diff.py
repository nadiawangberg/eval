import sys

arg1 = sys.argv[1].split("&") # orig
arg2 = sys.argv[2].split("&") # modif


print("arg1: ", arg1)
print("arg2: ", arg2)



perc_diff_lst = []
for i in range(len(arg1)):
    v1 = float(arg1[i])
    v2 = float(arg2[i])

    perc_diff = round(((v1-v2) / v1) * 100, 2)

    # print(str(perc_diff) + "\%")

    perc_diff_lst.append(str(perc_diff) + "\%")


latex_str = " & ".join(perc_diff_lst)
print(latex_str)

# if __name__ == "__main__":
#     print(f"Arguments count: {len(sys.argv)}")
#     for i, arg in enumerate(sys.argv):
#         print(f"Argument {i:>6}: {arg}")