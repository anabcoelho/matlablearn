function varargout = EDA_features(varargin)
% EDA_FEATURES MATLAB code for EDA_features.fig
%      EDA_FEATURES, by itself, creates a new EDA_FEATURES or raises the existing
%      singleton*.
%
%      H = EDA_FEATURES returns the handle to a new EDA_FEATURES or the handle to
%      the existing singleton*.
%
%      EDA_FEATURES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDA_FEATURES.M with the given input arguments.
%
%      EDA_FEATURES('Property','Value',...) creates a new EDA_FEATURES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EDA_features_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EDA_features_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EDA_features

% Last Modified by GUIDE v2.5 01-Oct-2016 18:19:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EDA_features_OpeningFcn, ...
                   'gui_OutputFcn',  @EDA_features_OutputFcn, ...
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


% --- Executes just before EDA_features is made visible.
function EDA_features_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EDA_features (see VARARGIN)

% Choose default command line output for EDA_features
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EDA_features wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EDA_features_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in mean_duration_checkbox.
function mean_duration_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to mean_duration_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mean_duration_checkbox


% --- Executes on button press in mean_amp_checkbox.
function mean_amp_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to mean_amp_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mean_amp_checkbox


% --- Executes on button press in mean_risetime_checkbox.
function mean_risetime_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to mean_risetime_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mean_risetime_checkbox


% --- Executes on button press in mean_checkbox.
function mean_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to mean_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mean_checkbox


% --- Executes on button press in SCR_count_checkbox.
function SCR_count_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to SCR_count_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SCR_count_checkbox


% --- Executes on button press in select_all_button.
function select_all_button_Callback(hObject, eventdata, handles)
% hObject    handle to select_all_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.mean_duration_checkbox,'Value',1)
set(handles.mean_amp_checkbox,'Value',1)
set(handles.mean_checkbox,'Value',1)
set(handles.mean_risetime_checkbox,'Value',1)
set(handles.SCR_count_checkbox,'Value',1)

% --- Executes on selection change in feature_selection_popup.
function feature_selection_popup_Callback(hObject, eventdata, handles)
% hObject    handle to feature_selection_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns feature_selection_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from feature_selection_popup
contents = cellstr(get(hObject,'String'));
FeatureApplicationChoise = contents{get(hObject,'Value')};
switch FeatureApplicationChoise
    case 'Emotions'
        set(handles.mean_duration_checkbox,'Value',1)
        set(handles.mean_amp_checkbox,'Value',1)
        set(handles.mean_checkbox,'Value',1)
        set(handles.mean_risetime_checkbox,'Value',1)
        set(handles.SCR_count_checkbox,'Value',1)
end

% --- Executes during object creation, after setting all properties.
function feature_selection_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to feature_selection_popup (see GCBO)
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
EDA_page;

% --- Executes on button press in open_classifiactionLearner.
function open_classifiactionLearner_Callback(hObject, eventdata, handles)
% hObject    handle to open_classifiactionLearner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
classificationLearner;

% --- Executes on button press in apply_button.
function apply_button_Callback(hObject, eventdata, handles)
% hObject    handle to apply_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('begins_ends_cells.mat');
%L=length(begins_ends_cells);
feature_Matrix=[];
mean_duration_features=[];
if (get(handles.mean_duration_checkbox,'Value')==1) 
    sz=size(begins_ends);
    %for i=1: length(begins_ends_cells)
    for i=1: sz(1)
    %L=length(begins_ends_cells{i}); 
    nonZero=find(begins_ends(i,:)>0);
    L= length(nonZero);
    %mean_duration=mean(begins_ends_cells{i}(((L/2)+1):end)-begins_ends_cells{i}(1:(L/2)));
    mean_duration=mean(begins_ends(i,(((L/2)+1):L))-begins_ends(i,(1:(L/2))));
    mean_duration_features=[mean_duration_features;mean_duration];
    end
    feature_Matrix=[feature_Matrix mean_duration_features ];
end

mean_amplitude_features=[];
if (get(handles.mean_amp_checkbox,'Value')==1)
    load('SCR_Amplitudes_cells.mat');
    sz=size(SCR_Amplitudes);
%     for i=1:length(SCR_Amplitudes_cells)
    for i=1:sz(1)
        nonZero = find(SCR_Amplitudes(i,:) > 0);
        L = length (nonZero);
%     mean_amplitude=mean(SCR_Amplitudes_cells{i});
        mean_amplitude=mean(SCR_Amplitudes(i,(1:L)));
        mean_amplitude_features=[mean_amplitude_features; mean_amplitude];
    end
     feature_Matrix=[feature_Matrix mean_amplitude_features ];
end


mean_risetime_features=[];
if (get(handles.mean_risetime_checkbox,'Value')==1)
    load('SCR_Peak_indices_cells.mat');
    sz = size(SCR_Peak_indices);
%     for i=1:length(SCR_Peak_indices_cells)
    for i=1:sz(1)
%         L=length(begins_ends_cells{i});
    L1=length(find(begins_ends(i,:) > 0));
    L2=length(find(SCR_Peak_indices(i,:) > 0));
%     mean_riseTime=mean(SCR_Peak_indices_cells{i}-begins_ends_cells{i}(1:L/2));
    mean_riseTime=mean(SCR_Peak_indices(i,(1:L2))-begins_ends(i,(1:L1/2)));
    mean_risetime_features=[mean_risetime_features; mean_riseTime];
    end
    feature_Matrix=[feature_Matrix mean_risetime_features];
end


mean_signal_features=[];
if (get(handles.mean_checkbox,'Value')==1)
    load('filtered_SCRs.mat');
    sz=size(bartlett_filtered);
    for i=1:sz(1)
    mean_signal=mean(bartlett_filtered(i,:));
    mean_signal_features=[mean_signal_features;mean_signal];  
    end
    feature_Matrix=[feature_Matrix mean_signal_features ];
end



SCR_counts_features=[];

if (get(handles.SCR_count_checkbox,'Value')==1)
    load('SCR_Peak_indices_cells.mat');
    sz = size(SCR_Peak_indices);
%     for i=1:length(SCR_Peak_indices_cells)
    for i=1:sz(1)
%     numberOfSCRs=length(SCR_Peak_indices_cells{i});
    numberOfSCRs = length(find(SCR_Peak_indices(i,:) > 0));
    SCR_counts_features=[SCR_counts_features ; numberOfSCRs];    
    end
    feature_Matrix=[feature_Matrix SCR_counts_features];
end


if((get(handles.upload_label_checkbox,'Value'))==1)
  labelName=get(handles.upload_label,'String');
  label = importdata('label.mat');
  num_segment_each_row=importdata('numberOfSegmentsEachRow.mat');
  segments=importdata('segments_cell.mat');
%   label_column=ones(length(segments),1);
  sz = size(segments);
  label_column=ones(sz(1),1);
  for k=1:length(label)
    label_column((k-1)*num_segment_each_row+(1:num_segment_each_row))=label(k);
  end
  save('label_column.mat','label_column');
  feature_Matrix=[feature_Matrix importdata('label_column.mat')];
end

save('feature_Matrix.mat','feature_Matrix');


% --- Executes on button press in mean_SCR_duration_help_button.
function mean_SCR_duration_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to mean_SCR_duration_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mean_SCR_duration_help;

% --- Executes on button press in mean_SCR_amp_help_button.
function mean_SCR_amp_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to mean_SCR_amp_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mean_SCR_amplitude_help;

% --- Executes on button press in mean_SCR_risetime_help_button.
function mean_SCR_risetime_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to mean_SCR_risetime_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mean_SCR_risetime_help;

% --- Executes on button press in mean_signal_help_button.
function mean_signal_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to mean_signal_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mean_signal_help;

% --- Executes on button press in SCR_count_help_button.
function SCR_count_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to SCR_count_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Number_of_SCRs_help;


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
    msgbox('The size of your label vactor does not match your data.');
    set(handles.upload_label_checkbox,'Value',0);
else    
set(handles.upload_label,'String',filename);
label = A;
save('label.mat','label');
set(handles.upload_label_checkbox,'Value',1);
end


% --- Executes on button press in upload_label_checkbox.
function upload_label_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to upload_label_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of upload_label_checkbox
