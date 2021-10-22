function varargout = simpleEDA(varargin)
% simpleEDA detects spontaneous fluctuations in the electrodermal activity
%
% [reactions]=simpleEDA(TIME,EDA [,minspeed]); 
% TIME: column vector of time in milliseconds
% EDA: signal in any unit
% minspeed (optional)= minimum increase for a phasic reaction
%
% [reactions] contains the following columns:
% [starting_time EDA_value@starting_time stop_time EDA_value@stop_time maximum_speed]
%
%************simple call*********************
% [reactions]=simpleEDA(TIME,EDA); 
% opens a dialog box, where you set the minimum speed for an SC-Response
% (blue line: filtered raw signal, red line: speed = 1st derivative)
% either mark section in raw signal or set threshold in speed graph
%
%************call with minimum speed*********************
% [reactions]=simpleEDA(TIME,EDA,minspeed)
% no dialog box, as you named the minimum speed already
%
%************output options*********************
% [reactions,varnames]=simpleEDA(TIME,EDA)
% additionally returns variable names as a cell array 
%
% [reactions,varnames, minspeed]=simpleEDA(TIME,EDA)
% also returns the selected minimum speed
% written by Robert Schleicher
% r *DOT* schleicher *AT* uni *MINUS* koeln *DOT* de 
cutoff=0.03; %cutoff-frequency for butterworth filter, s.a. Matlab function 'butter'
gap=700; %minimum interval between consecutive SCRs; SCRs below are merged
time=varargin{1};
EDA=varargin{2};
flag=~isnan(EDA); %delete empty entries (otherwise problems with filtering)
EDA=EDA(flag);
%time=time(flag);
%SR=round(1000/nanmean(diff(time(1:100,1))));%Samplingrate...
[b,a] = butter(8,cutoff,'low');%[b,a] = butter(8,1/(SR/2),'low'); %0.03=1/32;
EDA_bw1Hz=filtfilt(b,a,EDA);
speed=[0;diff(EDA_bw1Hz)]./[1;diff(time)];
if nargin>2
    minspeed=varargin{3};
else
    minspeed=uigetlimit([time EDA_bw1Hz],speed,'Specify Mininum EDA activity',...
    'Select area in raw signal (blue) or move minimum speed in 1st derivative (red)',...
    'max'); %value has to be slightly lower than the actual max
    minspeed=minspeed(1);
    if minspeed<=0
        return
    end
    
    disp(['Minimum speed set to: ' num2str(minspeed)]);
end
%**************************************
%start identifying events
imax=size(EDA_bw1Hz,1);%limit of while-loop
i=1;
amp=[]; %Output parameters
start=[];
stop=[];
start_amp=[];
stop_amp=[];
max_speed=[];
while i<imax
     if speed(i)<minspeed
        i=i+1;
    else %threshold exceeded...
        j=i;
        while speed(j)>0 %run back to detect beginning...
          j=j-1; 
        end;
        start=[start; time(j)];
        start_amp=[start_amp; EDA_bw1Hz(j)];
        k=i;
        while (k<imax && speed(k)>0) %go ahead to find the end...
          k=k+1; 
        end;        
        stop=[stop;time(k)];
        stop_amp=[stop_amp; EDA_bw1Hz(k)];
        max_speed=[max_speed; max(speed(j:k))]; %maxspeed: maximum difference of two consecutive values
        i=k; %set to end of current event
    end
end;
%**************************************
%merge consecutive SCRs
interval=start(:,1)-[0; stop(1:end-1,1)]; %time between to consecutive SCRs
merge=find(interval<gap);
merged=[]; %for plotting merged SCRs
for i=2:size(merge,1) 
    start(merge(i))=start(merge(i)-1);
    start_amp(merge(i))=start_amp(merge(i)-1);
    max_speed(merge(i))=max(max_speed(merge(i)),max_speed(merge(i)-1)); %larger of both maxspeeds
    merged=[merged; start(merge(i)-1) start_amp(merge(i)-1) stop(merge(i)-1) stop_amp(merge(i)-1)];
    start(merge(i)-1)=NaN;
end
flag=~isnan(start);%delete double entries
start=start(flag);
start_amp=start_amp(flag);
stop=stop(flag);
stop_amp=stop_amp(flag);
max_speed=max_speed(flag);
ret=[start start_amp stop stop_amp max_speed];
varargout{1}=ret;
if nargout>1
    varargout{2}={'start'; 'startamp'; 'stop'; 'stopamp'; 'maxspeed'};
end
if nargout>2 
    varargout{3}= minspeed;
end
%**************************************
%plot results:
f1=figure; 
h0=plot(time/1000, EDA,'c'); %raw signal
hold;
h1=plot(time/1000, EDA_bw1Hz,'b'); %filtered raw signal
a1=gca;
for i=1:size(start,1)
    rh=fill([start(i) stop(i) stop(i) start(i)]/1000,...
            [start_amp(i) start_amp(i) stop_amp(i) stop_amp(i)],[0.6 0.6 0],'LineStyle',':','FaceAlpha',0.7);
end
if~isempty(merged)
    for i=1:size(merged,1)
        rh2=fill([merged(i,1) merged(i,3) merged(i,3) merged(i,1)]/1000,...
            [merged(i,2) merged(i,2) merged(i,4) merged(i,4)],[0.7 0.9 1],'LineStyle',':','FaceColor','none');
    end    
end    
legend3={'speed >=' num2str(minspeed,'%6.4g')};
legend3=char(legend3); %to create a 2-line-string
legend('raw signal','filtered signal',legend3)
