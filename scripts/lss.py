#!/usr/bin/python

import os
import re

re_pattern = re.compile('[0-9]')

frames = []

def missing_elements(L, padding):
    start, end = L[0], L[-1]
    nums = sorted(set(range(start, end + 1)).difference(L))
    return [str(num).zfill(padding) for num in nums]


for f in os.listdir('/home/julius/example_project/TST/0010/plate'):
    filename = os.path.basename(f)    
    digit_result = re.findall(r'\d{2,}', filename)
    print digit_result
    if digit_result:
        digit = digit_result[0]
        padding = len(digit)
        frames.append(int(digit))
        


missing_frames_list = missing_elements(frames, padding)
if len(missing_frames_list) > 0: 
    missing_frames = " [Missing: " + ", ".join(missing_frames_list) + "]"
else:
    missing_frames = ""

first_frame = str(sorted(frames)[0]).zfill(padding)
last_frame = str(sorted(frames)[-1]).zfill(padding)

print "".join( [first_frame, '-', last_frame, missing_frames] )  
#        print filename.replace( digit, '%0' + str(padding) + 'd' )
