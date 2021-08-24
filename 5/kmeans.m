function [ y ] = kmeans(x,K)
MAX_IT = 10;%max number of iterations
ep = 10; %max error allowed in solution
iteration = 0;
errorsum = 11;
[M,N, c] = size (x);
labels = zeros (M,N);
centroids = uint8 (zeros (1,K, 3));
centroids (1,:,1) = uint8 (linspace (0,256,K));
centroids (1,:,2) = uint8(linspace(0,256,K));
centroids (1,:,3) = uint8 (linspace(0,256,K));
y = zeros (M,N, c); 
x = double (x);
sums = zeros (1,K,3);
counts = zeros (1,K);
while (iteration <= MAX_IT && errorsum > ep)
    errorsum = 0;
    for m = 1:M
        for n = 1:N
            smallest_dist = 500;
            closestk = 1;
            for k = 1:K
                dist = sqrt((x(m, n, 1) - double(centroids(1,k,1)))^2 + (x(m,n,2)...
                    - double(centroids(1,k,2)))^2 + (x(m, n, 3) - double(centroids(1, k,3)))^2);
                if dist < smallest_dist
                    smallest_dist = dist;
                    closestk = k;
                end 
            end     
            errorsum = errorsum + smallest_dist; %update total error
            labels(m, n) = closestk;    
            counts(closestk) = counts(closestk) + 1; %update new label count
            sums(1, closestk, 1) = sums(1, closestk, 1) + x(m,n,1);
            sums(1, closestk, 2) = sums(1, closestk, 2) + x(m, n, 2);
            sums(1,closestk, 3) = sums(1, closestk,3) + x(m, n,3);
            
            y(m, n, 1) = centroids(1, closestk, 1);
            y(m, n, 2) = centroids(1, closestk, 2);
            y(m, n, 3) = centroids(1, closestk, 3);
        end %column
    end %row
    for k = 1:K
        if counts(k) > 0
            centroids(1,k,1) = sums(1,k,1) / counts(k);
            centroids(1,k,2) = sums(1,k,2) / counts(k);
            centroids(1,k, 3) = sums(1,3,3) / counts(k); %update centroid values
        else
            centroids(1, k, 1) = centroids(1,k,1) / 10;
            centroids(1,k,2) = centroids(1,k,2) / 2;
            centroids(1,k,3) = centroids(1, k,3) / 3; %randomly reassign
        end
    end %Change location of centroid k
    iteration = iteration + 1;
    errorsum = errorsum / (M*N);
end %one iteration of the k-mean process
imshow (uint8 (y))
end