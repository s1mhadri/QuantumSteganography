%{
Function to perform Arnold scrambling on a Quantum Image.
Input:
qim - The quantum image which needs to be scrambled
Output:
arim - Arnold scrambled quantum image
%}

function [arim] = fn_arnscr(qim)
    l = length(qim);
    % get the size of total positions in an image.
    % 256 is the total grayscale values (2^8)
    N = sqrt(l/256);
    % to find the number of bits needed to represent
    % all the positions (N = 2^n)
    n = floor(log2(N-1)+1);
    % extract the intensity values from quantum image
    v = intenext(qim);
    arim = sparse(l, 1);
    it = 1;
    for i = 0:N-1
        for j = 0:N-1
            % create a ket of x and y position values
            ketx = fn_qureg(mod(i + j, N), n);
            kety = fn_qureg(mod(2*j + i, N), n);
            % taking tensor product of x and y ket vector
            % gives the ket vector of the position of pixel in image
            xy = kron(ketx, kety);
            % creating quantum image from extracted intensity and new
            % position ket vectors
            arim = arim + kron(fn_qureg(v(it), 8), xy);
            it = it+1;
        end
    end
    arim = fn_ket(arim);
end

