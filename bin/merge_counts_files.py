#!/usr/bin/env python

"""
Sage Bionetworks
Xindi Guo
Septemebr 2020
FHA Project
"""

import argparse
import os

import pandas
from functools import reduce


def read_count_files(file_list):
    """Return a list of DataFrames

    """
    df_list = []
    for file in file_list:
        col_name = os.path.splitext(os.path.basename(file))[0]
        count_df = pandas.read_csv(
            file, sep="\t", names=["guide_id", col_name], skiprows=1
        )
        df_list.append(count_df)
    return df_list


def main():
    parser = argparse.ArgumentParser(
        description="Merge the list of counts with corresponding reference library"
    )
    parser.add_argument(
        "-f", "--files", nargs="+", help="<Required> List of count files", required=True
    )
    parser.add_argument(
        "-r", "--reference", help="<Required> Reference library file", required=True
    )
    parser.add_argument(
        "-o", "--output", help="<Required> Output file name prefix", required=True
    )

    args = parser.parse_args()
    df_list = read_count_files(args.files)
    referece_df = pandas.read_csv(
        args.reference, usecols=[0, 1], names=["guide_id", "gene"], skiprows=1
    )
    output_df = reduce(
        lambda x, y: pandas.merge(x, y, on="guide_id"), [referece_df] + df_list
    )
    output_df.to_csv(args.output + "_counts.csv", index=False)


if __name__ == "__main__":
    main()
