A = randi(10,[5,3]) % A 5x3 matrix of uniformly random integers in range [1,10]
 
A(3,2)              % Subscript (row,col) indexing
                    % ^ That means get contents of row 3 column 2
A(8)                % Linear indexing
ind = sub2ind(size(A),3,2)  % Converting subscript --> linear
[i,j] = ind2sub(size(A),8)  % Converting linear --> subscript
 
 
A(1:2,2:3)          % Select a block
A(3,:)              % Select a row
A(2:end-1,2)        % end = the last index in the respective dimension

% Lmao good luck with this