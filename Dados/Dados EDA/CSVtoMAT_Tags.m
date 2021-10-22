function CSVtoMAT_Tags ('filename.csv','Tagsfile.csv')%%% E4 export data format
%Só não é valido para ACC IBI tags 
csv=csvread('filename.csv')
signal= csv(3:end);
hour= csv(1)
fs=csv(2)
tag=csvread('Tagsfile.csv')
save('filename.mat','signal' 'hour' 'fs' 'tag' )