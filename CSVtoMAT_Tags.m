function CSVtoMAT ('filename.csv')%%% E4 export data format
csv=csvread('filename.csv')
signal= csv(3:end);
hour= csv(1)
fs=csv(2)
save('filename.mat','signal','hour','fs')