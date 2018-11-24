%I_in:input image.
%T_o:predefined.

function [T] = FindGlobalThresholding(I_in,T_o)

%Find the max and min intensities of image;
T_max = max(max(I_in));
T_min = min(min(I_in));
T_n = (T_max + T_min)/2;
T_d = 1;

while T_d >= T_o
    [T_up,T_bo] = FindAvg(T_n);
    T_m = (T_up + T_bo)/2;
    T_d = abs(T_m - T_n);
    T_n = T_m;
end

T = T_n;
function [T_arg_g1,T_arg_g2] = FindAvg(T_z)
%Find Group1 and Group2;
num_g1 = 0;
num_g2 = 0;
sum_g1 = 0;
sum_g2 = 0;
[row,col] = size(I_in);
for i = 1:1:row
    for j = 1:1:col
        
        if I_in(i,j) >= T_z
            sum_g1 = sum_g1 + I_in(i,j);
            num_g1 = num_g1 + 1;
        else
            sum_g2 = sum_g2 + I_in(i,j);
            num_g2 = num_g2 + 1;
        end
        
        %Find avg.
        T_arg_g1 = sum_g1/num_g1;
        T_arg_g2 = sum_g2/num_g2;
        
    end
end
end
end

