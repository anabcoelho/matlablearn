function varargout = EMG_features(varargin)
% EMG_FEATURES MATLAB code for EMG_features.fig
%      EMG_FEATURES, by itself, creates a new EMG_FEATURES or raises the existing
%      singleton*.
%
%      H = EMG_FEATURES returns the handle to a new EMG_FEATURES or the handle to
%      the existing singleton*.
%
%      EMG_FEATURES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EMG_FEATURES.M with the given input arguments.
%
%      EMG_FEATURES('Property','Value',...) creates a new EMG_FEATURES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EMG_features_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EMG_features_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EMG_features

% Last Modified by GUIDE v2.5 02-Mar-2017 11:19:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EMG_features_OpeningFcn, ...
                   'gui_OutputFcn',  @EMG_features_OutputFcn, ...
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


% --- Executes just before EMG_features is made visible.
function EMG_features_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EMG_features (see VARARGIN)

% Choose default command line output for EMG_features
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EMG_features wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EMG_features_OutputFcn(hObject, eventdata, handles) 
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
set(handles.zeroCrossing_checkbox,'Value',1)
set(handles. SD_checkbox,'Value',1)
set(handles.RMS_checkbox,'Value',1)
set(handles.MAV_checkbox,'Value',1)
set(handles.slopSign_checkbox,'Value',1)
set(handles.logDetector_checkbox,'Value',1)
set(handles.waveformLength_checkbox,'Value',1)

% --- Executes on button press in upload_label.
function upload_label_Callback(hObject, eventdata, handles)
% hObject    handle to upload_label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname]=uigetfile;
[A,delimiterOut,headerlinesOut]=importdata([pathname filename]);
sz = size(importdata('rawData.mat'));
if  sz(2)==1 
    sz(1)=1;
end

if sz(1)~= length(A)
        msgbox('The size of your label vactor does not match your data.');
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


% --- Executes on button press in zeroCrossing_checkbox.
function zeroCrossing_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to zeroCrossing_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of zeroCrossing_checkbox


% --- Executes on button press in SD_checkbox.
function SD_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to SD_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SD_checkbox


% --- Executes on button press in RMS_checkbox.
function RMS_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to RMS_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RMS_checkbox


% --- Executes on button press in MAV_checkbox.
function MAV_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to MAV_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MAV_checkbox


% --- Executes on button press in slopSign_checkbox.
function slopSign_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to slopSign_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of slopSign_checkbox


% --- Executes on button press in logDetector_checkbox.
function logDetector_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to logDetector_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of logDetector_checkbox


% --- Executes on button press in waveformLength_checkbox.
function waveformLength_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to waveformLength_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of waveformLength_checkbox


% --- Executes on button press in zerCrossing_help_button.
function zerCrossing_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to zerCrossing_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zeroCrossingEMG_help;

% --- Executes on button press in MAV_help_button.
function MAV_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to MAV_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
MAV_help;

% --- Executes on button press in slopSign_help_button.
function slopSign_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to slopSign_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
slopSign_help;

% --- Executes on button press in SD_help_button.
function SD_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to SD_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
standardDeviation_help;

% --- Executes on button press in RMS_help_button.
function RMS_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to RMS_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RMS_help;

% --- Executes on button press in logDetector_help_button.
function logDetector_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to logDetector_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
logDetector_help;

% --- Executes on button press in wavefromLength_help_button.
function wavefromLength_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to wavefromLength_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
waveformLength_help;

% --- Executes on button press in back_botton.
function back_botton_Callback(hObject, eventdata, handles)
% hObject    handle to back_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output,'Visible','off');
EMG_page;

% --- Executes on button press in open_classifiactionLearner.
function open_classifiactionLearner_Callback(hObject, eventdata, handles)
% hObject    handle to open_classifiactionLearner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
classificationLearner;

% --- Executes on button press in apply_botton.
function apply_botton_Callback(hObject, eventdata, handles)
% hObject    handle to apply_botton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

feature_Matrix=[];
load('segments_cell.mat')
Fs=importdata('Fs.mat');

MAV_features=[];
if (get(handles.MAV_checkbox,'Value')==1)
    %L= round(Fs*0.1);
    sz = size(segments_cell);
    for i=1:sz(1)   
        MAV=find_MAV(segments_cell(i,:),length(segments_cell(i,:)));   
        MAV_features=[MAV_features;MAV];
    end
    feature_Matrix=[feature_Matrix MAV_features ];
end

zeroCrossing_features=[];
if (get(handles.zeroCrossing_checkbox,'Value')==1)
    sz = size(segments_cell);
    for i=1:sz(1)        
        zc_count=find_zerocerossing(segments_cell(i,:),0.015);
        zeroCrossing_features=[zeroCrossing_features;zc_count];
    end
    feature_Matrix=[feature_Matrix zeroCrossing_features ];
end

slopSign_features=[];
if (get(handles.slopSign_checkbox,'Value')==1)
    sz = size(segments_cell);
    for i=1:sz(1)      
        slpSgn_count = find_slopSign(segments_cell(i,:),0.015);
        slopSign_features=[slopSign_features;slpSgn_count];
    end
    feature_Matrix=[feature_Matrix slopSign_features ];
end

waveLength_features=[];
if (get(handles. waveformLength_checkbox,'Value')==1)
    sz = size(segments_cell);
    for i=1:sz(1)     
        waveLen = find_waveform_length(segments_cell(i,:));
        waveLength_features=[waveLength_features;waveLen];
    end
    feature_Matrix=[feature_Matrix waveLength_features ];
end

standardDeviation_features=[];
if (get(handles.SD_checkbox,'Value')==1)
    sz = size(segments_cell);
    for i=1:sz(1)         
        sd = std(segments_cell(i,:));
        standardDeviation_features=[standardDeviation_features;sd];
    end
    feature_Matrix=[feature_Matrix standardDeviation_features ];
end

rms_features=[];
if (get(handles.RMS_checkbox,'Value')==1)
    sz = size(segments_cell);
    for i=1:sz(1)        
        RMS = rms(segments_cell(i,:));
        rms_features=[rms_features;RMS];
    end
    feature_Matrix=[feature_Matrix rms_features ];
end

logDetect_features=[];
if (get(handles.logDetector_checkbox,'Value')==1)
    sz = size(segments_cell);
    for i=1:sz(1)         
       logDetect = find_log_detector(segments_cell(i,:));
        logDetect_features=[logDetect_features;logDetect];
    end
    feature_Matrix=[feature_Matrix logDetect_features ];
end

if((get(handles.upload_label_checkbox,'Value'))==1)
  labelName=get(handles.upload_label,'String');
  label = importdata('label.mat');
  num_segment_each_row=importdata('numberOfSegmentsEachRow.mat');
  segments=importdata('segments_cell.mat');
  sz = size(segments);
  label_column=ones(sz(1),1);
  %label_column=ones(length(segments),1);
  for k=1:length(label)
    label_column((k-1)*num_segment_each_row+(1:num_segment_each_row))=label(k);
  end
  save('label_column.mat','label_column');
  feature_Matrix=[feature_Matrix importdata('label_column.mat')];
end

save('feature_Matrix.mat','feature_Matrix');
