#! /usr/bin/env python3

"""
Replay Log with Timestamp based delay

Simple tool to replace a bro log with a time stamp based delay (accurate only
to the seconds place.

Usage:
    python3 replay_bro_log.py <input log> <output log>

    Run `tail -f` on the output log to follow the output.

Currently has a max delay of 10 seconds.

"""

import csv
import time
import sys


def log_yield(fileName):
    """ Generator for a Bro Log file, skipping lines with # """
    with open(fileName, "r") as f:
        for a in f:
            if a[0] == '#':
                continue
            b = a.split('\t')
            yield(b)

log = log_yield(sys.argv[1])

dest_file = sys.argv[2]

max_delay = 10

# We only care about the seconds, not going to be more accurate than that
first_line = next(log)
initial_ts = int(first_line[0].split('.')[0])

# Seconds, loosely
time_elasped = 0

with open(dest_file, 'w', buffering=1) as d:
    d.write('\t'.join(first_line))

    for l in log:
        ts = int(l[0].split('.')[0])

        # "current time"
        cur_time = initial_ts + time_elasped

        if ts <= cur_time:
            d.write('\t'.join(l))
        else:
            sleep = ts - cur_time

            # Don't sleep too long
            if sleep >= 10:
                time.sleep(10)
            else:
                time.sleep(sleep)

            d.write('\t'.join(l))
            time_elasped += sleep
