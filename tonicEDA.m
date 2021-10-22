function varargout = tonicEDA(varargin)
% tonicEDA returns the skin conductance level
%
% [SCL]=tonicEDA(TIME,EDA,INTERVAL[,MOMENT][,statistic])
%
% TIME: column vector of time in milliseconds
% EDA: signal in any unit
% INTERVAL:  interval in milliseconds to compute skin conductance level
%            if no MOMENT is specified, the whole signal is divided in
%            INTERVAL blocks and for each the statistic is computed
% MOMENT (optional): colum vector of time points in milliseconds for tonic SC measurement
%                    SCL is computed for INTERVAL milliseconds after MOMENT  
% statistic (optional): statistical parameter (format: string) to compute for INTERVAL
%                       Default: mean
%                       has to be a Matlab-defined function like median etc.
%
%************output*********************
% [SCL]=tonicEDA(...)
% [SCL] contains the following columns:
%       [starting_time stop_time mean(EDA)*]
%       *or median, if specified in PARAMETER
%************output options*********************
% [SCL,varnames]=tonicEDA(...)
% additionally returns variable names as a cell array
% written by Robert Schleicher
% r *DOT* schleicher *AT* uni *MINUS* koeln *DOT* de
%***************handle input statistics**************
if nargin<3
    disp('not enough input arguments')
    return
end
time=varargin{1};
EDA=varargin{2};
interval=varargin{3}; %applies to case 4 and 5 
moment=[1:interval:time(end)]'; 
statistic=@mean; %default statistic
if nargin>3
   switch nargin 
        case 4
            if isnumeric(varargin{4}) %interval given...
              moment=varargin{4};
            else
              temp=varargin{4}; %could be statisticial function
            end            
        case 5
            moment=varargin{4};
            temp=varargin{5}; %could be statisticial function
        otherwise        %more
   end
   %check whether temp is a valid statistical function
   if exist('temp') && isstr(temp) %statistical parameter given
        if temp(1)=='@' %anonymous function given, e.g. '@(x)mean(x)*0.7' 
            eval(['temp=' temp ';']);           
        else %name of a function given
            temp=str2func(temp);            
        end
        if isa(temp,'function_handle');
            statistic=temp;        
        end
   end
   
end
flag=~isnan(EDA); %delete empty entries (otherwise problems with filtering)
EDA=EDA(flag);
time=time(flag); %both vectors have to be of the same length
%***************filtering**************
EDA_raw=EDA;
[b,a] = butter(8,0.03,'low');%[b,a] = butter(8,1/(SR/2),'low'); %0.03=1/32;
EDA=filtfilt(b,a,EDA);
%**********comment this out if you don't want to filter********
ret=[]; %Output vector
for i=1:size(moment,1)
    flag=((time(:,1)>=moment(i)) & (time(:,1)<=(moment(i)+interval)));
        if sum(flag)<1
            disp(['No data for moment: ' num2str(moment(i))]);             
        else 
            %disp(num2str(nanmean(EDA(flag))));
            ret=[ret;moment(i) (moment(i)+interval) statistic(EDA(flag))];
        end    
    
end
varargout{1}=ret;
if nargout>1
    varargout{2}={'start'; 'stop'; 'SCL'};
end
%**************************************
%plot results:
f1=figure; %create new figure
h0=plot(time/1000, EDA_raw,'c'); %raw signal
hold;
h1=plot(time/1000, EDA,'b'); %filtered raw signal
a1=gca;
set(gca,'NextPlot','add');
lh=[];
for i=1:size(ret,1)
    ltemp=line([ret(i,1)/1000 (ret(i,1)+interval)/1000], [ret(i,3) ret(i,3)],'Color','g','LineWidth',4);
    lh=[lh;ltemp];
    if (ret(i,1)+interval)>time(end) %in case last moment + interval exceed time
        interval=time(end)-ret(i,1);
    end     
end
legend('raw signal','filtered signal',func2str(statistic))
