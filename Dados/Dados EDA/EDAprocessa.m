% tonicEDA returns the skin conductance level
%
% [SCL]=tonicEDA(TIME,EDA,INTERVAL[,MOMENT][,statistic])
%
% TIME: column vector of time in milliseconds
% EDA: signal in any unit
% INTERVAL:  interval in milliseconds to compute skin conductance level
%            if no MOMENT is specified, the whole signal is divided in
%            INTERVAL blocks and for each the statistic is computed
% MOMENT (optional):   
% statistic (optional): 

EDA=EDA;%Sinal
time=length(EDA);%Vetor tempo
interval=250; %Sampling rate (In milliseconds)
moment=[1:interval:time(end)];
EDA_raw=EDA;

plot(EDA_raw)
%% ***************filtering**************
[b,a] = butter(8,0.03,'low');%[b,a] = butter(8,1/(SR/2),'low'); %0.03=1/32;
EDA=filtfilt(b,a,EDA);
figure
plot(EDA)
%%

mm=movmean(EDA, interval);
figure
plot(mm)

subplot(3,1,1)
plot(EDA_raw)
hold on
plot(EDA)
hold on
plot(mm)
title('Filtros')
legend('Sinal original','Sinal filtrado passa baixas','Sinal filtrado com MM')