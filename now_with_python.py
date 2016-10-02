#/usr/bin/env python

import os

os.chdir("/Users/Scott/Google Drive/Hurwitz Lab/PATRIC-taxoner-species/now-with-fastq/")

import pandas as pd

raw_graph_data = pd.read_csv("source_data_for_R_based_on_new_normalization.csv")

