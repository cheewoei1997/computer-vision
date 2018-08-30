% Creating a vector
a = [1, 2, 3, 4]    % Use comma (,) to create a row-vector
a = [1  2  3  4]    % Space = (,)
b = [1; 2; 3; 4]    % Use semi-colon (;) to create a column vector

% Dealing with colons(:) and transpose(')
an = 1:4            % J:K is the same as [J, J+1, ..., K] 
                    % Basically creates a matrix with numbers 1 to 4
an = 1:0.2:2        % J:D:K is the same as [J, J+D, ..., J+m*D], m = floor((K-J)/D)
                    % Creates matrix with starting value 1, increments 0.2
                    % until limit 2
bn = an'            % Use quote (') to transpose
                    % Pretty self-explanatory

% Defining a matrix
A = [1, 2, 3, 4 ; 5, 6, 7, 8]

% Stacking vectors
A1 = [1, 2, 3, 4]
A2 = [5, 6, 7, 8]
AN = [A1;A2]

% Function to manipulate the structure of vector/matrix
repmat(A,[2,3]) % Replicates the matrix with 2 rows and 3 columns
