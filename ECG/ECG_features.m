function varargout = ECG_features(varargin)
% ECG_FEATURES MATLAB code for ECG_features.fig
%      ECG_FEATURES, by itself, creates a new ECG_FEATURES or raises the existing
%      singleton*.
%
%      H = ECG_FEATURES returns the handle to a new ECG_FEATURES or the handle to
%      the existing singleton*.
%
%      ECG_FEATURES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECG_FEATURES.M with the given input arguments.
%
%      ECG_FEATURES('Property','Value',...) creates a new ECG_FEATURES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ECG_features_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ECG_features_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ECG_features

% Last Modified by GUIDE v2.5 02-Mar-2017 10:34:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ECG_features_OpeningFcn, ...
                   'gui_OutputFcn',  @ECG_features_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% End initialization code - DO NOT EDIT


% --- Executes just before ECG_features is made visible.
function ECG_features_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ECG_features (see VARARGIN)

% Choose default command line output for ECG_features
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ECG_features wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ECG_features_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectAll_botton.
function selectAll_botton_Callback(hObject, eventdata, handles)
% hObject    handle to selectAll_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.Mean_RR,'Value',1)
set(handles.NN50,'Value',1)
set(handles.pNN50,'Value',1)
set(handles.P_T_detection,'Value',1)
set(handles.Q_S_detection,'Value',1)
set(handles.QRtoQS_RStoQS,'Value',1)
set(handles.SD,'Value',1)
set(handles.SDSD,'Value',1)
set(handles.RMSSD,'Value',1)
set(handles.mean_EDR,'Value',1)
set(handles.EDR_SD,'value',1)


% --- Executes on button press in Mean_RR.
function Mean_RR_Callback(hObject, eventdata, handles)
% hObject    handle to Mean_RR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Mean_RR

% --- Executes on button press in NN50.
function NN50_Callback(hObject, eventdata, handles)
% hObject    handle to NN50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of NN50

% --- Executes on button press in pNN50.
function pNN50_Callback(hObject, eventdata, handles)
% hObject    handle to pNN50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pNN50


% --- Executes on button press in P_T_detection.
function P_T_detection_Callback(hObject, eventdata, handles)
% hObject    handle to P_T_detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of P_T_detection


% --- Executes on button press in Q_S_detection.
function Q_S_detection_Callback(hObject, eventdata, handles)
% hObject    handle to Q_S_detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Q_S_detection


% --- Executes on button press in QRtoQS_RStoQS.
function QRtoQS_RStoQS_Callback(hObject, eventdata, handles)
% hObject    handle to QRtoQS_RStoQS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of QRtoQS_RStoQS


% --- Executes on button press in SD.
function SD_Callback(hObject, eventdata, handles)
% hObject    handle to SD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SD


% --- Executes on button press in SDSD.
function SDSD_Callback(hObject, eventdata, handles)
% hObject    handle to SDSD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SDSD


% --- Executes on button press in RMSSD.
function RMSSD_Callback(hObject, eventdata, handles)
% hObject    handle to RMSSD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RMSSD


% --- Executes on button press in mean_EDR.
function mean_EDR_Callback(hObject, eventdata, handles)
% hObject    handle to mean_EDR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mean_EDR


% --- Executes on button press in EDR_SD.
function EDR_SD_Callback(hObject, eventdata, handles)
% hObject    handle to EDR_SD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of EDR_SD



% --- Executes on button press in apply_botton.
function apply_botton_Callback(hObject, eventdata, handles)
% hObject    handle to apply_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('segments_cell.mat')
load('Fs.mat');

filteredData=importdata('MyGUI_filteredData.mat');
rawdata=importdata('rawdata.mat');
% QRS = NET.createArray('System.Double[]',length(segments_cell));
sz = size(segments_cell);
QRS = zeros(sz);
% for i=1:length(segments_cell) 
% [qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin_revised(segments_cell{i},samplingRate,1);
% QRS(i)=qrs_i_raw;
% end
for i=1:sz(1) 
    L = length(find(segments_cell(i,:)));
    [qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin_revised(segments_cell(i,(1:L)),samplingRate,1);
    QRS(i,(1:length(qrs_i_raw)))=qrs_i_raw;
end

feature_Matrix=[];
%DatasetQRS = cell(QRS);
DatasetQRS = QRS;
RR_mean_features=[];

if get(handles.Mean_RR,'Value')== 1
%     for i=1:length(DatasetQRS)
%     RR_mean = find_mean_RR(DatasetQRS{i});
    sz = size(DatasetQRS);
    for i=1:sz(1)
    L = length(find(DatasetQRS(i,:)) > 0);
    RR_mean = find_mean_RR(DatasetQRS(i,(1:L)));
    RR_mean_features=[RR_mean_features ;RR_mean];
    end
    feature_Matrix=[feature_Matrix RR_mean_features];
end

SD_RR_features=[];
if get(handles.SD,'Value')== 1
   %for i=1:length(DatasetQRS)
   sz = size(DatasetQRS);
   for i=1:sz(1)
   L = length(find(DatasetQRS(i,:)) > 0);
   SD_RR = find_SD_RR(DatasetQRS(i,(1:L)));
   SD_RR_features=[SD_RR_features ; SD_RR];
   end
      feature_Matrix=[feature_Matrix SD_RR_features];
end     
    
SDSD_RR_features=[];
if get(handles.SDSD,'Value')== 1    
    %for i=1:length(DatasetQRS) 
    sz = size(DatasetQRS);
    for i=1:sz(1)
    L = length(find(DatasetQRS(i,:)) > 0);
    SDSD_RR= find_SDSD(DatasetQRS(i,(1:L)));
    SDSD_RR_features=[SDSD_RR_features ; SDSD_RR];
    end
      feature_Matrix=[feature_Matrix SDSD_RR_features];
end

RMSSD_features=[];
if get(handles.RMSSD,'Value')== 1   
   %for i=1:length(DatasetQRS) 
   sz = size(DatasetQRS);
   for i=1:sz(1)
   L = length(find(DatasetQRS(i,:)) > 0);
   RMSSD = find_RMSSD(DatasetQRS(i,(1:L)));
   RMSSD_features=[RMSSD_features ; RMSSD];
   end
      feature_Matrix=[feature_Matrix RMSSD_features];
end


meanEDR_features=[];
if get(handles.mean_EDR,'Value')== 1   
    highF= importdata('HighF.mat');
   sigma=importdata('Sigma.mat');
   gaus_length=importdata('Gaus_length.Mat');
   alpha = (gaus_length-1)/(2*(sigma/1000));
   load('raw_segments_cell.mat');
   Fs=importdata('Fs.mat');
   sz = size(raw_segments_cell);
   
%    for i=1:length(raw_segments_cell)   
   for i=1:sz(1) 
   highpassFiltered = elliptic_filter_highpass(raw_segments_cell(i,:),highF,Fs);
   smooth = guassian_filter(highpassFiltered,gaus_length,alpha);
   L = length(find(DatasetQRS(i,:)) > 0);
   QRS_array_i = DatasetQRS(i,(1:L));  
   [Q_i , S_i]= find_Q_S(smooth,QRS_array_i,round(0.07*Fs),round(0.07*Fs));
   PQoff = mean(QRS_array_i - Q_i);
   jOff = mean(S_i - QRS_array_i);
   EDR = find_EDR(QRS_array_i, filteredData,PQoff, jOff);
   mean_edr = mean(EDR);
   meanEDR_features=[meanEDR_features ; mean_edr];
   end
      feature_Matrix=[feature_Matrix meanEDR_features];
end

SD_EDR_features=[];
if get(handles.EDR_SD,'Value')== 1   
    highF= importdata('HighF.mat');
   sigma=importdata('Sigma.mat');
   gaus_length=importdata('Gaus_length.Mat');
   alpha = (gaus_length-1)/(2*(sigma/1000));
   load('raw_segments_cell.mat');
   Fs=importdata('Fs.mat');
   sz = size(raw_segments_cell);
   
%    for i=1:length(raw_segments_cell)  
   for i=1:sz(1)
   highpassFiltered = elliptic_filter_highpass(raw_segments_cell(i,:),highF,Fs);
   smooth = guassian_filter(highpassFiltered,gaus_length,alpha);
   L = length(find(DatasetQRS(i,:)) > 0);
   QRS_array_i = DatasetQRS(i,(1:L));
   [Q_i , S_i]= find_Q_S(smooth,QRS_array_i,round(0.07*Fs),round(0.07*Fs));
   PQoff = mean(QRS_array_i - Q_i);
   jOff = mean(S_i - QRS_array_i);
   EDR = find_EDR(QRS_array_i, filteredData,PQoff, jOff);
   std_edr = std(EDR);
   SD_EDR_features=[SD_EDR_features ; std_edr];
   end
      feature_Matrix=[feature_Matrix SD_EDR_features];
end


NN50_features=[];
if get(handles.NN50,'Value')== 1    
    fs=importdata('Fs.mat');
    criterion_ms=50;
    %for i=1:length(DatasetQRS)
    sz = size(DatasetQRS);
    for i=1:sz(1)
    L = length(find(DatasetQRS(i,:)) > 0);
    NN50= find_NN50(DatasetQRS(i,(1:L)), criterion_ms,fs);
    NN50_features=[NN50_features ; NN50];
    end
      feature_Matrix=[feature_Matrix NN50_features];
end

pNN50_features=[];
if get(handles.pNN50,'Value')== 1
    fs=importdata('Fs.mat');
    criterion_ms=50;
    %for i=1:length(DatasetQRS) 
    sz = size(DatasetQRS);
    for i=1:sz(1)
    L = length(find(DatasetQRS(i,:)) > 0);
    pNN50 = find_NN50(DatasetQRS(i,(1:L)), criterion_ms,fs);
    pNN50_features=[pNN50_features ; pNN50];
    end
      feature_Matrix=[feature_Matrix pNN50_features];
end


P_T_features=[];
if(get(handles.P_T_detection,'Value'))== 1
   highF= importdata('HighF.mat');
   sigma=importdata('Sigma.mat');
   gaus_length=importdata('Gaus_length.Mat');
   alpha = (gaus_length-1)/(2*(sigma/1000));
   %data=importdata('rawdata.mat');
   load('raw_segments_cell.mat');
   Fs=importdata('Fs.mat');
   sz = size(raw_segments_cell);
   
   %for i=1:length(raw_segments_cell) 
   for i=1:sz(1)
   highpassFiltered = elliptic_filter_highpass(raw_segments_cell(i,:),highF,Fs);
   smooth = guassian_filter(highpassFiltered,gaus_length,alpha);
   L = length(find(DatasetQRS(i,:)) > 0);
   QRS_array_i = DatasetQRS(i,(1:L));
   [Q_i , S_i]= find_Q_S(smooth,QRS_array_i,round(0.07*Fs),round(0.07*Fs));
   [P_i, T_i]=find_P_T(smooth,Q_i,S_i,0.12*Fs, 0.3*Fs,Fs);
   P_T_features = [P_T_features ; mean(T_i-P_i)];
   end
      feature_Matrix=[feature_Matrix P_T_features];
end

Q_S_features = [];
if(get(handles.Q_S_detection,'Value'))== 1
   highF= importdata('HighF.mat');
   sigma=importdata('Sigma.mat');
   gaus_length=importdata('Gaus_length.Mat');
   alpha = (gaus_length-1)/(2*(sigma/1000));
   load('raw_segments_cell.mat');
   Fs=importdata('Fs.mat');
   sz = size(raw_segments_cell);
   
  %for i=1:length(raw_segments_cell)
  for i=1:sz(1)
  highpassFiltered = elliptic_filter_highpass(raw_segments_cell(i,:),highF,Fs);
  smooth = guassian_filter(highpassFiltered,gaus_length,alpha);
  L = length(find(DatasetQRS(i,:)) > 0);
  QRS_array_i = DatasetQRS(i,(1:L));
  [Q_i , S_i]= find_Q_S(smooth,QRS_array_i,round(0.07*Fs),round(0.07*Fs)); 
  Q_S_features = [Q_S_features ; mean(S_i-Q_i)];
  end
     feature_Matrix=[feature_Matrix Q_S_features];
end


features_QRtoQS_RStoQS = [];
if(get(handles.QRtoQS_RStoQS,'Value'))== 1
   highF= importdata('HighF.mat');
   sigma=importdata('Sigma.mat');
   gaus_length=importdata('Gaus_length.Mat');
   alpha = (gaus_length-1)/(2*(sigma/1000));
   load('raw_segments_cell.mat');
   Fs=importdata('Fs.mat');
   sz = size(raw_segments_cell);
   
  %for i=1:length(raw_segments_cell)
   for i=1:sz(1)
   highpassFiltered = elliptic_filter_highpass(raw_segments_cell(i,:),highF,Fs);
   smooth = guassian_filter(highpassFiltered,gaus_length,alpha);
   L = length(find(DatasetQRS(i,:)) > 0);
   QRS_array_i = DatasetQRS(i,(1:L));
   [Q_i , S_i]= find_Q_S(smooth,QRS_array_i,round(0.07*Fs),round(0.07*Fs));
   [QRtoQS,RStoQS]= find_QRtoQS_RStoQS(Q_i, QRS_array_i,S_i);
   features_QRtoQS_RStoQS = [features_QRtoQS_RStoQS ; [mean(QRtoQS) mean(RStoQS)]];
   end
      feature_Matrix=[feature_Matrix features_QRtoQS_RStoQS];
end

if((get(handles.upload_label_checkbox,'Value'))==1)
  labelName=get(handles.upload_label,'String');
  label = importdata('label.mat');
  num_segment_each_row=importdata('numberOfSegmentsEachRow.mat');
  segments=importdata('segments_cell.mat');
  %label_column=ones(length(segments),1);
  sz = size(segments);
  label_column=ones(sz(1),1);
  for k=1:length(label)
    label_column((k-1)*num_segment_each_row+(1:num_segment_each_row))=label(k);
  end
  save('label_column.mat','label_column');
  feature_Matrix=[feature_Matrix importdata('label_column.mat')];
end

save('feature_Matrix.mat','feature_Matrix');


% --- Executes on selection change in featureTypeSelection_menu.
function featureTypeSelection_menu_Callback(hObject, eventdata, handles)
% hObject    handle to featureTypeSelection_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns featureTypeSelection_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from featureTypeSelection_menu
contents = cellstr(get(hObject,'String'));
FeatureApplicationChoise = contents{get(hObject,'Value')};
switch FeatureApplicationChoise
    case 'Sleep Quality'
        set(handles.Mean_RR,'Value',1)
        set(handles.SD,'Value',1)
        set(handles.SDSD,'Value',1)
        set(handles.NN50,'Value',1)
        set(handles.pNN50,'Value',1)
        set(handles.RMSSD,'Value',1)
        set(handles.mean_EDR,'Value',1)
        set(handles.EDR_SD,'Value',1)
        
    case 'Health Tracking'
        set(handles.Mean_RR,'Value',1)
        set(handles.SD,'Value',1)
        set(handles.SDSD,'Value',1)
        set(handles.NN50,'Value',1)
        set(handles.pNN50,'Value',1)
        set(handles.RMSSD,'Value',1)
        set(handles.mean_EDR,'Value',1)
        set(handles.EDR_SD,'Value',1)
        
    case 'Emotion'
        set(handles.Mean_RR,'Value',1)
        set(handles.SD,'Value',1)
        set(handles.SDSD,'Value',1)
        set(handles.NN50,'Value',1)
        set(handles.pNN50,'Value',1)
        set(handles.RMSSD,'Value',1)
        set(handles.mean_EDR,'Value',1)
        set(handles.EDR_SD,'Value',1)
end


% --- Executes during object creation, after setting all properties.
function featureTypeSelection_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to featureTypeSelection_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)
% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output,'Visible','off');
ECG_page;

% --- Executes on button press in Next_botton.
function Next_botton_Callback(hObject, eventdata, handles)
% hObject    handle to Next_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mean_RR_help_botton.
function mean_RR_help_botton_Callback(hObject, eventdata, handles)
% hObject    handle to mean_RR_help_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%s='This feature is calculation of mean of all RR intervals [1]. J.Pan, W.Tompkins ,“A real-time QRS detection algorithm,”IEEE Trans. Eng. Biomed. Eng.';
Mean_RR_interval_help;
% s=sprintf('This feature is calculation of mean of all RR intervals [1].\n[1] J.Pan, W.Tompkins ,“A real-time QRS detection algorithm,”IEEE Trans. Eng. Biomed. Eng.');
% set(handles.mean_RR_text,'String',s);
% set(handles.mean_RR_help_panel,'Visible','On');


% --- Executes on button press in SD_RR_help_botton.
function SD_RR_help_botton_Callback(hObject, eventdata, handles)
% hObject    handle to SD_RR_help_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Standard_deviation_RR;


% --- Executes on button press in SDSD_help_botton.
function SDSD_help_botton_Callback(hObject, eventdata, handles)
% hObject    handle to SDSD_help_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SDSD_help;



function RMSSD_help_botton_Callback(hObject, eventdata, handles)
RMSSD_help;
% s=sprintf(['RMSSD measure is defined as the square root of the mean of the sum of the squares of differences between adjacent',...
% ' RR-intervals[3].\n[3] P. De Chazal,et. al.“Automated processing of the single-lead electrocardiogram',...
% 'for the detection of obstructive sleep apnoea,” Biomedical Engineering, IEEE, 2003.']);


% --- Executes on button press in EDR_help_botton.
function EDR_help_botton_Callback(hObject, eventdata, handles)
% hObject    handle to EDR_help_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EDR_help;

% --- Executes on button press in mean_RR_close_botton.
function mean_RR_close_botton_Callback(hObject, eventdata, handles)
% hObject    handle to mean_RR_close_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.mean_RR_help_panel,'Visible','Off');


% --- Executes on button press in SD_RR_close_botton.
function SD_RR_close_botton_Callback(hObject, eventdata, handles)
% hObject    handle to SD_RR_close_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.SD_RR_panel,'Visible','Off');


% --- Executes on button press in SDSD_help_close_botton.
function SDSD_help_close_botton_Callback(hObject, eventdata, handles)
% hObject    handle to SDSD_help_close_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.SDSD_panel,'Visible','Off');


% --- Executes on button press in RMSSD_close_botton.
function RMSSD_close_botton_Callback(hObject, eventdata, handles)
% hObject    handle to RMSSD_close_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.RMSSD_panel,'Visible','Off');


% --- Executes on button press in NN50_help_botton.
function NN50_help_botton_Callback(hObject, eventdata, handles)
% hObject    handle to NN50_help_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NN50_help;

% --- Executes on button press in pNN50_help_botton.
function pNN50_help_botton_Callback(hObject, eventdata, handles)
% hObject    handle to pNN50_help_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pNN50_help;

% --- Executes on button press in P_T_help_botton.
function P_T_help_botton_Callback(hObject, eventdata, handles)
% hObject    handle to P_T_help_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
P_T_help;

% --- Executes on button press in Q_S_help.
function Q_S_help_Callback(hObject, eventdata, handles)
% hObject    handle to Q_S_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Q_S_help;

% --- Executes on button press in QRtoQS_RStoQS_text.
function QRtoQS_RStoQS_text_Callback(hObject, eventdata, handles)
% hObject    handle to QRtoQS_RStoQS_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
QRtoQS_RStoQS_help;


% --- Executes on button press in upload_label.
function upload_label_Callback(hObject, eventdata, handles)
% hObject    handle to upload_label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname]=uigetfile;
[A,delimiterOut,headerlinesOut]=importdata([pathname filename]);
sz = size(importdata('rawdata.mat'));
if  sz(2)==1 
    sz(1)=1;
end
if sz(1)~= length(A)
        msgbox('The size of your label vector does not match your data.');
        set(handles.upload_label_checkbox,'Value',0);
else    
set(handles.upload_label,'String',filename);
label = A;
save('label.mat','label');
set(handles.upload_label_checkbox,'Value',1);
set(handles.upload_label_checkbox,'enable','On');
end



% --- Executes on button press in upload_label_checkbox.
function upload_label_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to upload_label_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of upload_label_checkbox



% --- Executes on button press in open_classifiactionLearner.
function open_classifiactionLearner_Callback(hObject, eventdata, handles)
% hObject    handle to open_classifiactionLearner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
classificationLearner;




% --- Executes on button press in EDR_SD_help.
function EDR_SD_help_Callback(hObject, eventdata, handles)
% hObject    handle to EDR_SD_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Standard_deviation_RR;
