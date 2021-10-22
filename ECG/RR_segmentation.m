function RR_segmentation(signal,QRS_array_i,fs,st)

t= (1:length(signal))/fs;
bit2voltData=convertBit2mV_bitalino_ECG(signal);
figure
plot(t,bit2voltData,'b')
hold on
scatter(QRS_array_i/fs,bit2voltData(QRS_array_i),'*','m');hold on,
yL = get(gca,'YLim');

for i = QRS_array_i/fs
plot([i i],yL,'r');
end

title(st);
ylabel('Amplitude (mV)');
xlabel('Time (s)');