function segments_cell = overlap_window_segmentation(signal,windowSize,overlap,fs,rowNumber,filteredOrRaw)
%filteredOrRaw must be 1 for raw data and must be other numbers for filtered data.

colors=['r','g'];
%L=length(signal);
sz=size(signal);
if(sz(2)==1)
    signal=signal';
end
sz=size(signal);
numberOfSegmentsEachRow=floor(sz(2)/(windowSize-overlap));
remaindar = mod(sz(2),(windowSize-overlap));
if remaindar < overlap
    numberOfSegmentsEachRow=numberOfSegmentsEachRow-1;
end

save('numberOfSegmentsEachRow.mat','numberOfSegmentsEachRow');
total_number_of_segments=numberOfSegmentsEachRow*sz(1);
%segments = NET.createArray('System.Double[]',total_number_of_segments);
segments = zeros(total_number_of_segments,windowSize);
maxSignal= max(signal(rowNumber,:));
t=(1:length(signal(rowNumber,:)))/fs;

figure
plot(t,signal(rowNumber,:));hold on,
i=0;
j=1;
hight=[maxSignal  0.8*maxSignal];

for k=1:sz(1)
    start=1;
    L=length(signal(k,:));
while(start+windowSize-1 <= L && j <= total_number_of_segments)

%segments(j)=signal(k,start:start+windowSize-1);
segments(j,:)=signal(k,start:start+windowSize-1);
if(k==1)
  plot([start start]/fs ,[hight(i+1) -0.5*maxSignal],colors(i+1));hold on, 
  plot([start+windowSize-1 start+windowSize-1]/fs ,[hight(i+1) -0.5*maxSignal],colors(i+1));hold on,
  plot([start start+windowSize-1]/fs, [hight(i+1) hight(i+1)],colors(i+1));
end
  start=start+windowSize-1-overlap;  

  i=~i;
  j=j+1;
end
end

if(filteredOrRaw==1)
    title('Overlap window segmentation for raw data');
else
    title('Overlap window segmentation for filtered data');
end

xlabel('Time (s)');
ylabel('Amplituse');
%segments_cell=cell(segments);
segments_cell=segments;

