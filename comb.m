function [b, a] = comb(N, varargin)
% Returns IIR coefficients for a Nth order Comb Filter
%
% Usage:     [B,A] = COMB(order, scalar);
%
%             ORDER is the number of samples delayed prior to add
%             SCALAR is the coefficient that will be applied to
%                the delayed signal path at the final summation block.
%
% Note, there are two types of comb filters.  A DC-blocker and a DC-passer.
% To get a DC-Blocker (tooth at DC), pass in a -1 for the scalar.  
% To get a DC-Passer (+6dB at DC), pass in a +1 for the scalar.
%
% By default, if the scalar is not passed, a DC-Passer is assumed.
%
% Author: Jeff Tackett 03/16/09
% Validate that the proper argument count was supplied
error(nargchk(1, 2, nargin));
% Use scalar is passed as an argument, otherwise assume scalar=1;
if (nargin == 1)
    scalar = 1; 
else
    scalar = varargin{1};
end
% Input has zeros to simulate a single delay of N samples
a = [ 1 ];
b = [ 1 zeros(1, N-1) scalar*1];
zplane(b,a)