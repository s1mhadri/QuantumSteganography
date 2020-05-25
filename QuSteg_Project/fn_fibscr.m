%{
Function to perform Fibonacci scrambling on a Quantum Image.
Input:
qim - The quantum image which needs to be scrambled
Output:
arim - Fibonacci scrambled quantum image
%}

function [fibim] = fn_fibscr(qim)
    l = length(qim);
    % get the size of total positions in an image.
    % 256 is the total grayscale values (2^8)
    N = sqrt(l/256);
    % to find the number of bits needed to represent
    % all the positions (N = 2^n)
    n = floor(log2(N-1)+1);
    % extract the intensity values from quantum image
    v = intenext(qim);
    fibim = sparse(l, 1);
    it = 1;
    for i = 0:N-1
        for j = 0:N-1
            % create a ket of x and y position values
            ketx = fn_qureg(mod(i + j, N), n);
            kety = fn_qureg(mod(i, N), n);
            % taking tensor product of x and y ket vector
            % gives the ket vector of the position of pixel in image
            xy = kron(ketx, kety);
            % creating quantum image from extracted intensity and new
            % position ket vectors
            fibim = fibim + kron(fn_qureg(v(it), 8), xy);
            it = it+1;
        end
    end
    fibim = fn_ket(fibim);
end

