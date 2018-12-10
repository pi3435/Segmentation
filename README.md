# Segmentation
Includes Thresholding, region-based method.

## Region-based method

### Region growing
input: <br>
I - double 2-D matrix, which represent an image.<br>
S - scalar, which means the intensity of seed pixel. Be found from histogram.<br>
T - threhold. Be found from hstogram.<br>
output:<br>
g - the result which each region labeled by a different integer.<br>
NR - number of regions.<br>
SI - final seed image.<br>
TI - the pixels that satisfied the thresold.<br>

For every pixel I(i,j) <br>
&nbsp;&nbsp; if I(i,j) == S<br>
&nbsp;&nbsp; SI(i,j) = 1<br>
&nbsp;&nbsp; if I(i,j) is within the threhold<br>
&nbsp;&nbsp; TI(i,j) =1<br>
Find non-zero pixel from TI, at less one of which 8 neighbors is equal to 1 in the SI.<br>