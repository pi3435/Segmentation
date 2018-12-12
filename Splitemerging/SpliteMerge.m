function [g] = SpliteMerge(I,mindim,fun)
%Input:I-input image.
%Mindim:The minimize dim of segmentation results.
%Fun:The rule that check each region.true-need split, false-need not.
%examples:SpliteMerge(I,mindim,@predicate)
    %function flag = predicate(region)
    %sd = std2(region);
    %m = means2(region);
    %flag = (sd > 10) & (m > 0) & (m < 125);

%Zero padding the image to nearest 2^ size.
[row,col] = size(I);
New_size = nextpow2(max([row,col]));
I_new = padarray(I,[New_size - row, New_size - col],'post');

%Splite the new image.
I_splite = qtdecomp(I_new, @splite_test,mindim,fun);

%Merge.

%Get the largest size of the largest block.
B_max = full(max(I_splite(:)));

%Initial g and marker.
g = zeros(size(f));
marker = zeros(size(f));

%Traversing block with all size.
for B_size = 1:1:B_max
    %val:the size of the block.
    %(r,c):location of the block
    [val,r,c]  = qtgetblk(I,I_splite,B_size)
    
    if ~isempty(val)
        for j = 1:1:length(r)
            xlow = r(j);
            ylow = c(j);
            xhigh = xlow + B_size -1;
            yhigh = xlow + B_size -1;
            region = I(xlow:xhigh,ylow:yhigh);
            fl = feval(fun,region);
            if fl
                g(xlow:xhigh,ylow:yhigh) = 1;
                marker(xlow,ylow) = 1;
            end
        end
    end
end

%Just like regiongrowing.
g = bwlabel(imreconstruct(marker,g));
g = g(1:M, 1:N);

function [Nd_split] = splite_test(I_new_split,mindim,fun)
    %input:I_new_splite:(m,m,k) matrix : all the current blocks of size 
    %m-by-m stacked into an m-by-m-by-k array, where k is the number blocks. 
    %output:v:(1,k)vector.v(1,k)==1 means the k block need to be split and 
    %v(1,k)==0 means should not.
    
    Nd_split(1:k) = false;
    %For every block.Check 1)size 2)fun.
    for i = 1:1:k
        block = I_new_split(:,:,i);
        
        %Check size.
        if max(size(block)) <= mindim
            Nd_split(1:k) = false;
        end
        
        %Check fun.
        flag = feval(fun,block);
        if flag
            Nd_split(1:k) = true;
        end
    end
    
end
end


