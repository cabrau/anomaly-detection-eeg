%gera o modelo de distribui��o dos dados pelo centroide e visualiza pelo histograma
clear,clc

load('features_nonSeizure.mat');
load('features_seizure.mat');

%calcula centroides e distancias
[dist_LPCns, centroid_LPCns, mean_dist_LPCns, std_dist_LPCns, max_dist_LPCns, min_dist_LPCns, threshold_LPCns] = centroid(LPC_nonSeizure);
[dist_PSDns, centroid_PSDns, mean_dist_PSDns, std_dist_PSDns, max_dist_PSDns, min_dist_PSDns, threshold_PSDns] = centroid(PSD_nonSeizure);
[dist_LPCs, centroid_LPCs, mean_dist_LPCs, std_dist_LPCs, max_dist_LPCs, min_dist_LPCs, threshold_LPCs] = centroid(LPC_seizure);
[dist_PSDs, centroid_PSDs, mean_dist_PSDs, std_dist_PSDs, max_dist_PSDs, min_dist_PSDs, threshold_PSDs] = centroid(PSD_seizure);

%%
%histograma das distancias aos centroides: LPC
figure
hold on;
histogram(dist_LPCns,'Normalization','pdf');
histogram(dist_LPCs,20,'Normalization','pdf','FaceColor','r');
title('Histograma das dist�ncias euclidianas normalizadas aos respectivos centr�ides. Atributos: LPC')
legend('N�o-Convulsivo','Convulsivo')
hold off;
%%
%histograma das distancias aos centroides: PSD
figure
hold on;
histogram(dist_PSDns,'Normalization','pdf');
histogram(dist_PSDs,'Normalization','pdf','FaceColor','r');
title('Histograma das dist�ncias euclidianas normalizadas aos respectivos centr�ides. Atributos PSD')
legend('N�o-Convulsivo','Convulsivo')
hold off;

%%
%classifica��o LPC
[LPC_results,lpc_conf] = classifier_centroid_seizure(LPC_nonSeizure,LPC_seizure,20,0.7)

title('Distancias LPC ao centroide n�o-convulsivo')
ylabel('Dist�ncia Euclidiana Normalizada')
legend('N�o-Convulsivo','Limiar')

%%
%classifica��o PSD
[PSD_results,psd_conf] = classifier_centroid_seizure(PSD_nonSeizure,PSD_seizure,20,0.7)

title('Distancias PSD ao centroide n�o-convulsivo')
ylabel('Dist�ncia Euclidiana Normalizada');
legend('N�o-Convulsivo','Limiar')