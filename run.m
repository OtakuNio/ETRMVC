%% Initialization
warning('off');
clear all
clc;

addpath('./tools');
addpath('./measure');
addpath('./dataset');

%{
%% Function Use
% ---------- define variables ----------
neighborNumList = [2,3,5,7,9,10];
proximityOrderList = [2,3,4,5];

% ---------- define hyper-parameters List ----------
alphaList = [0.01,0.1,0.5,0.9,1,3,10,20];
betaList = [0.01,0.1,0.5,0.9,1,3,10,20];
rhoList =[10e-3,10e-1,10e1];
muList = [1.1,1.2,1.5,1.9,2,5];
viewWeightList1 = [0.1,1,2,10];
viewWeightList2 = [0.1,1,2,10];
viewWeightList3 = [0.1,1,2];
viewWeightList4 = [0.1,1];
viewWeightList5 = [0.1,1];
viewWeightList6 = [0.1,1];
isSvdList = [0,1];
%}

neighborNum = 5;
proximityOrder = 3;
alpha = 0.5;
beta = 2;
rho = 10e-3;
mu =1.9;
isSvd = 1;
viewWeight1 = 2;
viewWeight2 = 2;
viewWeight3 = 2;
viewWeight4 = 1;
viewWeight5 = 1;
viewWeight6 = 1;

[matrixS,matrixC,return_label]=uci_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);

