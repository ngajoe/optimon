#!/usr/bin/env python3
"""
USAGE: seismic_format.py in_file out_file calibration
"""
from __future__ import print_function
from pyrfc3339 import parse
from datetime import datetime

import sys

import numpy as np
import obspy

import pytz



try:
	in_file = sys.argv[1]
	out_file = sys.argv[1]
	calibration = float(.5)
except:
	print(__doc__)
	raise

#setup initial file data
dp_limit = 4990
dp_ctr = 0
filenum = 0
#f = open("%s_%d" % (out_file, filenum), "w")

st = obspy.read(in_file)


## done in tuple form
for i, tr in enumerate(st):
	station = tr.stats.station
	channel = tr.stats.channel
	timejunk = parse(str(tr.stats.starttime))
	time_ns = int(datetime.timestamp(timejunk)*1000000) * 1000
	rate = int(1000000000 / tr.stats.sampling_rate)
	print(time_ns,rate)

	for p, value in enumerate(tr.data):
		if (p > 10): 
			break
		data_cal = value * calibration
		print("seismic,station=%s,channel=%s value=%f %d\n" % (station, channel, data_cal, time_ns))
		time_ns += rate
		dp_ctr += 1
		#TODO: When dp gets to max, close out file and open new one
		
	#f.write("# STATION %s\n" % (tr.stats.station))
	#f.write("# CHANNEL %s\n" % (tr.stats.channel))
	#f.write("# START_TIME %s\n" % (str(tr.stats.starttime)))
	#f.write("# SAMP_FREQ %f\n" % (tr.stats.sampling_rate))
	#f.write("# NDAT %d\n" % (tr.stats.npts))
	#np.savetxt(f, tr.data * calibration, fmt="%f")

#f.close()
print("done\n")
