%% README
% constructW_PKN: 
% A parameter free graph construction method with probabilistic k-nearest neighbors. 
% Graph construction is a fundamental and the most important problem in graph 
% based learning methods. The constructed graph with this function can be used
% in other graph based learning methods.
% 
% CLR: 
% The Constrained Laplacian Rank algorithm
%% 
% construct similarity matrix with probabilistic k-nearest neighbors. It is a parameter free, distance consistent similarity.
function W = constructW_PKN(X, k, issymmetric)
% X: each column is a data point
% k: number of neighbors
% issymmetric: set W = (W+W')/2 if issymmetric=1
% W: similarity matrix

if nargin < 3
    issymmetric = 1;
end;
if nargin < 2
    k = 5;
end;

[dim, n] = size(X);
D = L2_distance_1(X, X);  % % ||A-B||^2 = ||A||^2 + ||B||^2 - 2*A'*B
[dumb, idx] = sort(D, 2); % sort each row

W = zeros(n);
for i = 1:n
    id = idx(i,2:k+2);
    di = D(i, id);
    W(i,id) = (di(k+1)-di)/(k*di(k+1)-sum(di(1:k))+eps);
end;

if issymmetric == 1
    W = (W+W')/2;
end;