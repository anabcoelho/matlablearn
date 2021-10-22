close all
clear all
clc

%% Abrir sinal
participante = 9;
perMVC = 100;
nome = ['EMG_' num2str(participante) '_' num2str(perMVC) '.pebx'];
EMG100 = AbreSinalPEBx(nome)
perMVC = 15;
nome = ['EMG_' num2str(participante) '_' num2str(perMVC) '.pebx'];
EMG15 = AbreSinalPEBx(nome)
fs = 2000;
musculos = {'ECD','ECP','FSD','FPD','FLP'};
NumCanais = 5;

for j=1:NumCanais
    EMG15.Sinal(j,:) = ((EMG15.Sinal(j,:).*4.5.*EMG15.Escalas(j)./((2^23)-1))+EMG15.Offsets(j))./EMG15.Ganhos(j);
    EMG100.Sinal(j,:) = ((EMG100.Sinal(j,:).*4.5.*EMG100.Escalas(j)./((2^23)-1))+EMG100.Offsets(j))./EMG100.Ganhos(j);
end
EMG15.Sinal(NumCanais+1,:) = EMG15.Sinal(NumCanais+1,:) - min(EMG15.Sinal(NumCanais+1,:));
trigger15 = EMG15.Sinal(NumCanais+1,:)./max(EMG15.Sinal(NumCanais+1,:));
EMG100.Sinal(NumCanais+1,:) = EMG100.Sinal(NumCanais+1,:) - min(EMG100.Sinal(NumCanais+1,:));
trigger100 = EMG100.Sinal(NumCanais+1,:)./max(EMG100.Sinal(NumCanais+1,:));

t = 0:1/fs:(EMG15.NumAmostras - 1)/fs;
figure('Name','EMG de 15% MVC bruto')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,EMG15.Sinal(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
end
subplot(2,3,NumCanais+1)
plot(t,trigger15)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

t = 0:1/fs:(EMG100.NumAmostras - 1)/fs;
figure('Name','EMG de 100% MVC bruto')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,EMG100.Sinal(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
end
subplot(2,3,NumCanais+1)
plot(t,trigger100)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

%% Pre-processamento
%% Filtragem
for i=1:NumCanais
    w1 = 59*2/fs;
    w2 = 61*2/fs;  
    [b,a] = butter(2,[w1 w2],'stop');
    EMG15.Sinal(i,:) = filtfilt(b,a,EMG15.Sinal(i,:));
    EMG100.Sinal(i,:) = filtfilt(b,a,EMG100.Sinal(i,:));
    
    w1 = 119*2/fs;
    w2 = 121*2/fs;  
    [b,a] = butter(2,[w1 w2],'stop');
    EMG15.Sinal(i,:) = filtfilt(b,a,EMG15.Sinal(i,:));
    EMG100.Sinal(i,:) = filtfilt(b,a,EMG100.Sinal(i,:));
    
    w1 = 179*2/fs;
    w2 = 181*2/fs;  
    [b,a] = butter(2,[w1 w2],'stop');
    EMG15.Sinal(i,:) = filtfilt(b,a,EMG15.Sinal(i,:));
    EMG100.Sinal(i,:) = filtfilt(b,a,EMG100.Sinal(i,:));
    
    w1 = 239*2/fs;
    w2 = 241*2/fs;  
    [b,a] = butter(2,[w1 w2],'stop');
    EMG15.Sinal(i,:) = filtfilt(b,a,EMG15.Sinal(i,:));
    EMG100.Sinal(i,:) = filtfilt(b,a,EMG100.Sinal(i,:));
    
    w1 = 299*2/fs;
    w2 = 301*2/fs;  
    [b,a] = butter(2,[w1 w2],'stop');
    EMG15.Sinal(i,:) = filtfilt(b,a,EMG15.Sinal(i,:));
    EMG100.Sinal(i,:) = filtfilt(b,a,EMG100.Sinal(i,:));
    
    w1 = 359*2/fs;
    w2 = 361*2/fs;  
    [b,a] = butter(2,[w1 w2],'stop');
    EMG15.Sinal(i,:) = filtfilt(b,a,EMG15.Sinal(i,:));
    EMG100.Sinal(i,:) = filtfilt(b,a,EMG100.Sinal(i,:));
    
    [b,a] = butter(2,10*2/fs,'high');
    EMG15.Sinal(i,:) = filtfilt(b,a,EMG15.Sinal(i,:));
    EMG100.Sinal(i,:) = filtfilt(b,a,EMG100.Sinal(i,:));
    
    [b,a] = butter(8,400*2/fs,'low');
    EMG15.Sinal(i,:) = filtfilt(b,a,EMG15.Sinal(i,:));
    EMG100.Sinal(i,:) = filtfilt(b,a,EMG100.Sinal(i,:));
end

t = 0:1/fs:(EMG15.NumAmostras - 1)/fs;
figure('Name','EMG 15% MVC filtrado')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,EMG15.Sinal(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(EMG15.Sinal(1:NumCanais,:))) max(max(EMG15.Sinal(1:NumCanais,:)))])
end
subplot(2,3,NumCanais+1)
plot(t,trigger15)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

t = 0:1/fs:(EMG100.NumAmostras - 1)/fs;
figure('Name','EMG 100% MVC filtrado')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,EMG100.Sinal(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(EMG100.Sinal(1:NumCanais,:))) max(max(EMG100.Sinal(1:NumCanais,:)))])
end
subplot(2,3,NumCanais+1)
plot(t,trigger100)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

%% Delimitacao do tamanho do sinal
indTrig15 = find(diff(trigger15) ~= 0);
sinal15 = EMG15.Sinal(1:NumCanais,indTrig15(1):indTrig15(end));
trigger15 = trigger15(1,indTrig15(1):indTrig15(end));

indTrig100 = find(diff(trigger100) ~= 0);
sinal100 = EMG100.Sinal(1:NumCanais,indTrig100(1):indTrig100(end));
trigger100 = trigger100(1,indTrig100(1):indTrig100(end));

NumAmostras = length(sinal15(1,:));
t = 0:1/fs:(NumAmostras - 1)/fs;
figure('Name','EMG 15% MVC delimitado')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,sinal15(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(sinal100)) max(max(sinal100))])
end
subplot(2,3,NumCanais+1)
plot(t,trigger15)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

NumAmostras = length(sinal100(1,:));
t = 0:1/fs:(NumAmostras - 1)/fs;
figure('Name','EMG 100% MVC delimitado')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,sinal100(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(sinal100)) max(max(sinal100))])
end
subplot(2,3,NumCanais+1)
plot(t,trigger100)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

%% RMS do sinal
janela = 0.1*fs;
ovl = 0.5*janela;
for i=1:NumCanais
    sinal15_rms(i,:) = sinal_rms(sinal15(i,:), janela, ovl, 1);
    sinal100_rms(i,:) = sinal_rms(sinal100(i,:), janela, ovl, 1);
end

NumAmostras = length(sinal15(1,:));
t = 0:ovl/fs:(NumAmostras - 1)/fs;
figure('Name','EMG 15% MVC RMS')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,sinal15_rms(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(sinal100_rms)) max(max(sinal100_rms))])
end
subplot(2,3,NumCanais+1)
plot(t,downsample(trigger15,ovl))
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

NumAmostras = length(sinal100(1,:));
t = 0:ovl/fs:(NumAmostras - 1)/fs;
figure('Name','EMG 100% MVC RMS')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,sinal100_rms(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(sinal100_rms)) max(max(sinal100_rms))])
end
subplot(2,3,NumCanais+1)
plot(t,downsample(trigger100,ovl))
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

%% Envelope do sinal
for i=1:NumCanais
    sinal15(i,:)=abs(sinal15(i,:));
    sinal100(i,:)=abs(sinal100(i,:));    
end

NumAmostras = length(sinal15(1,:));
t = 0:1/fs:(NumAmostras - 1)/fs;
figure('Name','EMG 15% MVC retificado')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,sinal15(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(sinal100)) max(max(sinal100))])
end
subplot(2,3,NumCanais+1)
plot(t,trigger15)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

NumAmostras = length(sinal100(1,:));
t = 0:1/fs:(NumAmostras - 1)/fs;
figure('Name','EMG 100% MVC retificado')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,sinal100(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(sinal100)) max(max(sinal100))])
end
subplot(2,3,NumCanais+1)
plot(t,trigger100)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

fc = 2;
[b,a] = butter(2,fc*2/fs,'low');
for i=1:NumCanais
    sinal15(i,:) = filtfilt(b,a,sinal15(i,:));
    sinal100(i,:) = filtfilt(b,a,sinal100(i,:)); 
end

NumAmostras = length(sinal15(1,:));
t = 0:1/fs:(NumAmostras - 1)/fs;
figure('Name','EMG 15% MVC envelopado')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,sinal15(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(sinal100)) max(max(sinal100))])
end
subplot(2,3,NumCanais+1)
plot(t,trigger15)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')

NumAmostras = length(sinal100(1,:));
t = 0:1/fs:(NumAmostras - 1)/fs;
figure('Name','EMG 100% MVC envelopado')
for i=1:NumCanais
    subplot(2,3,i)
    plot(t,sinal100(i,:))
    title(musculos{i})
    xlabel('Tempo (s)')
    ylabel('Amplitude (V)')
    ylim([min(min(sinal100)) max(max(sinal100))])
end
subplot(2,3,NumCanais+1)
plot(t,trigger100)
title('Trigger')
xlabel('Tempo (s)')
ylabel('Amplitude')