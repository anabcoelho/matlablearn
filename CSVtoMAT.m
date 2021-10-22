function CSVtoMAT(x)  %%% E4 export data format
csv=csvread(x);
signal= csv(3:end);
hour= csv(1);
fs=csv(2);
save('x.mat','signal','hour','fs')