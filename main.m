%% Initialization
warning('off');
clear all
clc;

addpath('./tools');
addpath('./measure');
addpath('./dataset');

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






%% graph
for proximityOrderIter = 1:length(proximityOrderList)
    proximityOrder = proximityOrderList(proximityOrderIter);
    for alphaIter = 1:length(alphaList)
        alpha = alphaList(alphaIter);
        for betaIter = 1:length(betaList)
            beta = betaList(betaIter);
            for rhoIter = 1:length(rhoList)
                rho = rhoList(rhoIter);
                for muIter = 1:length(muList)
                    mu = muList(muIter);
                    for isSvdIter = 1:length(isSvdList)
                        isSvd = isSvdList(isSvdIter);
                        for viewWeightIter1 = 1:length(viewWeightList1)
                            viewWeight1 = viewWeightList1(viewWeightIter1);
                            if proximityOrderIter==1 && alphaIter==1 && betaIter==1 && rhoIter==1 && muIter==1 && isSvdIter==1
                                break
                            end
                            for viewWeightIter2 = 1:length(viewWeightList2)
                                viewWeight2 = viewWeightList2(viewWeightIter2);
                                tempDataset = load("ACM3025_graph.mat");
                                ACM3025_graph_2view(tempDataset.('feature'),proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                clear tempDataset;
                                recordFileACM2V = fopen("./record/ACM3025_graph_2view_record.txt", "a+");
                                fprintf(recordFileACM2V, "--------------------\r\n");
                                fprintf(recordFileACM2V, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                fprintf(recordFileACM2V, "--------------------\r\n\r\n");
                                fclose(recordFileACM2V);
                            end
                        end
                        for viewWeightIter1 = 1:length(viewWeightList1)
                            viewWeight1 = viewWeightList1(viewWeightIter1);
                            for viewWeightIter2 = 1:length(viewWeightList2)
                                viewWeight2 = viewWeightList2(viewWeightIter2);
                                for viewWeightIter3 = 1:length(viewWeightList3)
                                    viewWeight3 = viewWeightList3(viewWeightIter3);
                                    for viewWeightIter4 = 1:length(viewWeightList4)
                                        viewWeight4 = viewWeightList4(viewWeightIter4);
                                        tempDataset = load("ACM3025_graph.mat");
                                        ACM3025_graph_4view(tempDataset.('feature'),proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3,viewWeight4);
                                        clear tempDataset;
                                        recordFileACM4V = fopen("./record/ACM3025_graph_4view_record.txt", "a+");
                                        fprintf(recordFileACM4V, "--------------------\r\n");
                                        fprintf(recordFileACM4V, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d   viewWeightIter4:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3,viewWeightIter4);
                                        fprintf(recordFileACM4V, "--------------------\r\n\r\n");
                                        fclose(recordFileACM4V);
                                    end
                                end
                            end
                        end
                        recordFileGraph = fopen("./record/Record.txt", "a+");
                        fprintf(recordFileGraph, "--------------------\r\n");
                        fprintf(recordFileGraph, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter);
                        fprintf(recordFileGraph, "--------------------\r\n\r\n");
                        fclose(recordFileGraph);
                    end
                end
            end
        end
    end
end

%% Moudle Record
moudleRecordFile = fopen("./record/MoudleRecord.txt", "a+");
fprintf(moudleRecordFile, "graph finish\r\n");
fclose(moudleRecordFile);


%% 2view
for neighborIter = 1:length(neighborNumList)
    neighborNum = neighborNumList(neighborIter);
    for proximityOrderIter = 1:length(proximityOrderList)
        proximityOrder = proximityOrderList(proximityOrderIter);
        for alphaIter = 1:length(alphaList)
            alpha = alphaList(alphaIter);
            for betaIter = 1:length(betaList)
                beta = betaList(betaIter);
                for rhoIter = 1:length(rhoList)
                    rho = rhoList(rhoIter);
                    for muIter = 1:length(muList)
                        mu = muList(muIter);
                        for isSvdIter = 1:length(isSvdList)
                            isSvd = isSvdList(isSvdIter);
                            for viewWeightIter1 = 1:length(viewWeightList1)
                                viewWeight1 = viewWeightList1(viewWeightIter1);
                                for viewWeightIter2 = 1:length(viewWeightList2)
                                    viewWeight2 = viewWeightList2(viewWeightIter2);
                                    ANIMAL_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/ANIMAL_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    bbcsport_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/bbcsport_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    BDGP_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/BDGP_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    BioData2_2K3K_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/BioData2_2K3K_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    BioData_2K3K_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/BioData_2K3K_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    common_RNA_CNA_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/common_RNA_CNA_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    face_ok_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/face_ok_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    labelme_ok_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/labelme_ok_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    MIT_8_scene_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/MIT_8_scene_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    pascals_ok_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/pascals_ok_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    syn500_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/syn500_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);

                                    WikipediaArticles_2view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2);
                                    recordFile1 = fopen("./record/WikipediaArticles_2view.txt", "a+");
                                    fprintf(recordFile1, "--------------------\r\n");
                                    fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2);
                                    fprintf(recordFile1, "--------------------\r\n\r\n");
                                    fclose(recordFile1);
                                end
                            end
                            recordFile2V = fopen("./record/Record2v.txt", "a+");
                            fprintf(recordFile2V, "--------------------\r\n");
                            fprintf(recordFile2V, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter);
                            fprintf(recordFile2V, "--------------------\r\n\r\n");
                            fclose(recordFile2V);
                        end
                    end
                end
            end
        end
    end
end

%% Moudle Record
moudleRecordFile = fopen("MoudleRecord.txt", "a+");
fprintf(moudleRecordFile, "2view finish\r\n");
fclose(moudleRecordFile);

%% 3view
for neighborIter = 1:length(neighborNumList)
    neighborNum = neighborNumList(neighborIter);
    for proximityOrderIter = 1:length(proximityOrderList)
        proximityOrder = proximityOrderList(proximityOrderIter);
        for alphaIter = 1:length(alphaList)
            alpha = alphaList(alphaIter);
            for betaIter = 1:length(betaList)
                beta = betaList(betaIter);
                for rhoIter = 1:length(rhoList)
                    rho = rhoList(rhoIter);
                    for muIter = 1:length(muList)
                        mu = muList(muIter);
                        for isSvdIter = 1:length(isSvdList)
                            isSvd = isSvdList(isSvdIter);
                            for viewWeightIter1 = 1:length(viewWeightList1)
                                viewWeight1 = viewWeightList1(viewWeightIter1);
                                for viewWeightIter2 = 1:length(viewWeightList2)
                                    viewWeight2 = viewWeightList2(viewWeightIter2);
                                    for viewWeightIter3 = 1:length(viewWeightList3)
                                        viewWeight3 = viewWeightList3(viewWeightIter3);
                                        bbc_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/bbc_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        COIL20_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/COIL20_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        COIL20_3VIEWS_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/COIL20_3VIEWS_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        LandUse_21_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/LandUse_21_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        mnist4_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/mnist4_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        NottingHill_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/NottingHill_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        ORL_mtv_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/ORL_mtv_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        prokaryotic_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/prokaryotic_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        Scene_15_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/Scene_15_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        three3_sources_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/three3_sources_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        till_DB_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/till_DB_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        uci_2_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/uci_2_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        uci_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/uci_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        yale_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/yale_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);

                                        YaleB_first10_3view(neighborNum,proximityOrder,alpha,beta,rho,mu,isSvd,viewWeight1,viewWeight2,viewWeight3);
                                        recordFile1 = fopen("./record/YaleB_first10_3view.txt", "a+");
                                        fprintf(recordFile1, "--------------------\r\n");
                                        fprintf(recordFile1, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d   viewWeightIter1:%d   viewWeightIter2:%d   viewWeightIter3:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter,viewWeightIter1,viewWeightIter2,viewWeightIter3);
                                        fprintf(recordFile1, "--------------------\r\n\r\n");
                                        fclose(recordFile1);
                                    end
                                end
                            end
                            recordFile3V = fopen("./record/Record3v.txt", "a+");
                            fprintf(recordFile3V, "--------------------\r\n");
                            fprintf(recordFile3V, "proximityOrderIter:%d   alphaIter:%d   betaIter:%d   rhoIter:%d   muIter:%d   isSvdIter:%d\r\n",proximityOrderIter,alphaIter,betaIter,rhoIter,muIter,isSvdIter);
                            fprintf(recordFile3V, "--------------------\r\n\r\n");
                            fclose(recordFile3V);
                        end
                    end
                end
            end
        end
    end
end

%% Moudle Record
moudleRecordFile = fopen("MoudleRecord.txt", "a+");
fprintf(moudleRecordFile, "3view finish\r\n");
fclose(moudleRecordFile);

clear all
