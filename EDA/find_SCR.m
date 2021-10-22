function find_SCR(filtered,fs,rowNumber)

diffrentiated=diff(filtered');
L = 20;
w = bartlett(L);
diffrentiated = diffrentiated';
sz=size(diffrentiated);
bartlett_filtered=zeros(sz);     
% begins_ends = NET.createArray('System.Double[]',sz(1));
% SCR_Amplitudes = NET.createArray('System.Double[]',sz(1));
% SCR_Peak_indices = NET.createArray('System.Double[]',sz(1));
begins_ends = zeros(sz);
SCR_Amplitudes = zeros(sz);
SCR_Peak_indices = zeros(sz);

for i=1:sz(1)
   bartlett_filtered(i,:)=filtfilt(w,1,diffrentiated(i,:));
   [Begin End]=find_zeroCrossing_SCR(bartlett_filtered(i,:)); 
   index=[];
   LMaxima=[];
   for j=1:min(length(Begin),length(End))
       [val I]=max(bartlett_filtered(i,(Begin(j):End(j))));
       LMaxima=[LMaxima val];
       index =[index Begin(j)+I-1];
   end
   maximumSCR=max(LMaxima);
   index(find( LMaxima< (0.1*maximumSCR)))=[];
   Begin(find( LMaxima< (0.1*maximumSCR)))=[];
   End(find( LMaxima< (0.1*maximumSCR)))=[];
   LMaxima(find( LMaxima< (0.1*maximumSCR)))=[];
   minLength = min(length(Begin),length(End));
%% Features
   begins_ends(i,(1:length([Begin(1:minLength) End(1:minLength)])))=[Begin(1:minLength) End(1:minLength)];
   SCR_Amplitudes(i,(1:length(LMaxima)))=LMaxima;
   SCR_Peak_indices(i,(1:length(index)))=index;
   
end
%begins_ends_cells = cell(begins_ends);
save('begins_ends_cells.mat','begins_ends');

%SCR_Amplitudes_cells=cell(SCR_Amplitudes);
save('SCR_Amplitudes_cells.mat','SCR_Amplitudes');

%SCR_Peak_indices_cells=cell(SCR_Peak_indices);
save('SCR_Peak_indices_cells.mat','SCR_Peak_indices');
save('filtered_SCRs.mat','bartlett_filtered');
nonZero1 = find(begins_ends(rowNumber,:)>0);
L1=length(nonZero1);
nonZero2 = find(SCR_Peak_indices(rowNumber,:)>0);
L2=length(nonZero2);
t= (1:length(filtered(rowNumber,:)))/fs;
figure 
subplot(2,1,1,'align')
plot((1:length(bartlett_filtered(rowNumber,:)))/fs,bartlett_filtered(rowNumber,:),'k')
hold on
%L=length(begins_ends_cells{rowNumber});

% scatter(begins_ends_cells{rowNumber}(1:(L/2))/fs,bartlett_filtered(rowNumber,begins_ends_cells{rowNumber}(1:(L/2))),'*','b')
% hold on
% scatter(begins_ends_cells{rowNumber}((L/2)+1:end)/fs,bartlett_filtered(rowNumber,begins_ends_cells{rowNumber}((L/2)+1:end)),'*','r')
% hold on
% scatter(SCR_Peak_indices_cells{rowNumber}/fs,SCR_Amplitudes_cells{rowNumber},'*','p')
scatter(begins_ends(rowNumber,(1:(L1/2)))/fs,bartlett_filtered(rowNumber,begins_ends(rowNumber,(1:(L1/2)))),'*','b')
hold on
scatter(begins_ends(rowNumber,((L1/2)+1:L1))/fs,bartlett_filtered(rowNumber,begins_ends(rowNumber,((L1/2)+1:L1))),'*','r')
hold on
scatter(SCR_Peak_indices(rowNumber,(1:L2))/fs,SCR_Amplitudes(rowNumber,(1:L2)),'*','p')
legend('bartletted differentiated signal','start of SCR','end of SCR','SCR peak');
xlabel('Time (s)')
ylabel('Amplitude (uS)')
title('Detection of SCRs on bartletted differentiated EDA signal')

subplot(2,1,2,'align')
plot(t,filtered(rowNumber,:),'k')
hold on
% scatter(begins_ends{rowNumber}((L/2)+1:end)/fs,filtered(rowNumber,begins_ends{rowNumber}((L/2)+1:end)),'*','r')
scatter(begins_ends(rowNumber,((L1/2)+1:L1))/fs,filtered(rowNumber,begins_ends(rowNumber,((L1/2)+1:L1))),'*','r')
hold on
% scatter(begins_ends{rowNumber}(1:(L/2))/fs,filtered(rowNumber,begins_ends{rowNumber}(1:(L/2))),'*','b')
scatter(begins_ends(rowNumber,(1:(L1/2)))/fs,filtered(rowNumber,begins_ends(rowNumber,(1:(L1/2)))),'*','b')
title('Demonstration of detected SCRs peaks and starts on lowpassed EDA signal');
ylabel('Amplitude (uS)');
xlabel('Time (s)');
legend('filtered siganal','peak of SCR','start of SCR');
