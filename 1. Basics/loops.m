% Loops for/while in matlab 
A = rand(2000,3000); % some large matrix
ASum = sum(A, 2);

% method 1
tic                                     
ANorm = zeros(size(A));
for i = 1:size(A, 1)
    for j = 1:size(A, 2)
        ANorm(i,j) = A(i,j)/ASum(i);
    end
end
toc

% method 2
tic                                     % This method is significantly
ANorm = A./repmat(ASum, 1, size(A, 2)); % faster
toc                                   
