%% Initialization
warning('off');
clear all
clc;

addpath('./tools');
addpath('./measure');
addpath('./dataset');

%% Function Use
% Notice that matrixC = 0.5 * (abs(matrixS) + abs(matrixS')).
% And The "Return_1abel" is the true label of the input data, which is used to compare with the clustering results.
% Please use the function myNMIACCwithmean(U, Y, numclass) on matrix C to evaluate the performance of ETRMVC.
% For example: myNMIACCwithmean(matrixC, return_label, numclass).
[matrixS,matrixC,return_label]=uci_3view( ...
    neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd, ...
    viewWeight1,viewWeight2,viewWeight3,maxIter,rhoMax,epsilon);
