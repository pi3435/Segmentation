function [centroids, labels] = Kclustering(X,k,maxcyc)
%Input: X-sample set.
%   k-the number of  k centroids.
%   maxcyc-max of cycle times.
%Output:centroeds-k centroids.
%   labels-labels of sample set.

%K-means++ to find k centroids with as long distance as possible

%Find a centroid point randly
centroids = X(:,1+round(rand*(size(X,2)-1)));
%Set all label equal to 1.
labels = ones(1,size(X,2));

for i = 2:k 
    D = X-centroids(:,labels); 
    D = cumsum(sqrt(dot(D,D,1))); 
    if D(end) == 0 
        centroids(:,i:k) = X(:,ones(1,k-i+1)); 
        return; 
    end
    centroids(:,i) = X(:,find(rand < D/D(end),1)); 
    [~,labels] = max(bsxfun(@minus,2*real(centroids'*X),dot(centroids,centroids,1).'));
end

%K-means cluster
for iter = 1:maxcyc
    for j = 1:k
        l = labels==j; 
        centroids(:,j) = sum(X(:,l),2)/sum(l); 
    end
    [~,labels] = max(bsxfun(@minus,2*real(centroids'*X),dot(centroids,centroids,1).'),[],1);

end

end

