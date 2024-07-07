%% Initialization
warning('off');
clear all
clc;

addpath('./tools');
addpath('./measure');
addpath('./dataset');

%% Function Use
[matrixS,matrixC,return_label]=uci_3view( ...
    neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd, ...
    viewWeight1,viewWeight2,viewWeight3,maxIter,rhoMax,epsilon);

