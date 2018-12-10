function [g, NR, SI, TI] = RegionGrowing(I,S,T)
%Input: I:input Image.
%S:Seed point intensity. The pixel which intensity equal to S would be seed.
%T:Thereshold. Scalar means global threshold.
%Output: g: the result of region growing, with each region labeled by a
%different integet.
%NR: Number of regions.
%SI: Seed image.
%TI: The pixel that satisfied the thresold test.


[row, col] = size(I);
SI = zeros(row,col);
TI = zeros(row,col);

for i = 1:1:row
    for j = 1:1:col
        
        %Find seed matrix;
        if I(i,j) == S
            SI(i,j) = 1;
        end
        
        %Find the pixel that satisfied the thresold test.
        if abs(I(i,j) - S) <= T
            TI(i,j) = 1;
        end
    end
end

[g,NR] = bwlabel(imreconstruct(SI,TI));

end

