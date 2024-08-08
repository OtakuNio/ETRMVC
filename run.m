%% Initialization
warning('off');
clear all
clc;

addpath('./tools');
addpath('./measure');
addpath('./dataset');

%% Function Use
neighborNum = 7;
proximityOrder = 2;
alpha = 1;
beta = 1;
rho = 10e-3;
mu = 1.9;
isSvd = 0;
viewWeight1 = 1;
viewWeight2 = 1;
viewWeight3 = 1;
viewWeight4 = 1;
viewWeight5 = 1;
viewWeight6 = 1;

% Notice that matrixC = 0.5 * (abs(matrixS) + abs(matrixS')).
% And The "Return_1abel" is the true label of the input data, which is used to compare with the clustering results.
% Please use the function myNMIACCwithmean(U, Y, numclass) on matrix C to evaluate the performance of ETRMVC.
% For example: myNMIACCwithmean(matrixC, return_label, numclass).

tic;
[matrixS1,matrixC1,return_label1]=mnist4_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
tmnist=toc;

tic;
[matrixS2,matrixC2,return_label2]=uci_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
tuci=toc;

tic;
[matrixS3,matrixC3,return_label3]=HW1256_4view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3,viewWeight4);
thw=toc;

tic;
[matrixS4,matrixC4,return_label4]=prokaryotic_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
tpro=toc;

tic;
[matrixS5,matrixC5,return_label5]=syn500_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
tsyn=toc;

% Please use function CMU_PIE_2view after unzip the dataset CMU-PIE.
% tic;
% [matrixS6,matrixC6,return_label6]=CMU_PIE_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
% tface=toc;

