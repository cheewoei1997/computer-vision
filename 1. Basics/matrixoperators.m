A = [1, 2; 3, 4]    % Creates 2 by 2 matrix
B = [1, 3; 2, 4]    % Creates 2 by 2 matrix
 
A*B     % Matrix multiplication
A.*B    % Element-wise multiplication
A\B     % inv(A)*B, but computed using QR factorization (recall)
        % Ax = b <==> QRx = b <==> Rx = Q'b
        % 1. QR factorization (e.g. Gram–Schmidt)
        % 2. Matrix multiplication d = Q'b
        % 3. Back-substitution Rx = d
A^2
A.^2    % Element wise exponentiation
