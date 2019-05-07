%cria conjunto de dados de todos eeg sem crise convulsiva
%features: PSD e LPC

LPC_nonSeizure = [];
PSD_nonSeizure = [];

base = 'C:\Users\Cabral\Documents\TCC\data\chb08\non seizure\';
dirData = dir('C:\Users\Cabral\Documents\TCC\data\chb08\non seizure\');
dirIndex = [dirData.isdir];
fileList = {dirData(~dirIndex).name}';
  
  for k=1:length(fileList)
      file =fileList{k};
      path = strcat(base,file)
     [header, data_eeg] = edfread(path);
     fprintf("Extracting features \n" + k);
     LPC_nonSeizure1 = extract_LPC_features(data_eeg,256,4);
     PSD_nonSeizure1 = extractWelchFeatures(data_eeg,256);
     LPC_nonSeizure = horzcat(LPC_nonSeizure,LPC_nonSeizure1);
     PSD_nonSeizure = horzcat(PSD_nonSeizure,PSD_nonSeizure1);
  end
  


%%

save('features_nonSeizure.mat','LPC_nonSeizure', 'PSD_nonSeizure');

