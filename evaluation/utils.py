def find_percentage_diff(latex_str_orig, latex_str_modif):

    metrics_orig = latex_str_orig.split("&") # orig
    metrics_modif = latex_str_modif.split("&") # modif

    perc_diff_lst = []
    for i in range(len(metrics_orig)):
        v1 = float(metrics_orig[i])
        v2 = float(metrics_modif[i])

        # print("metrics_orig: ", v1)
        # print("metrics_modif: ", v2)

        perc_diff = round(((v1-v2) / v1) * 100, 2)
        perc_diff_lst.append(str(perc_diff) + "\%")


    latex_str = " & ".join(perc_diff_lst)
    return latex_str
