function varargout = ECG_page(varargin)
% ECG_PAGE MATLAB code for ECG_page.fig
%      ECG_PAGE, by itself, creates a new ECG_PAGE or raises the existing
%      singleton*.
%
%      H = ECG_PAGE returns the handle to a new ECG_PAGE or the handle to
%      the existing singleton*.
%
%      ECG_PAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECG_PAGE.M with the given input arguments.
%
%      ECG_PAGE('Property','Value',...) creates a new ECG_PAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ECG_page_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ECG_page_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ECG_page

% Last Modified by GUIDE v2.5 18-Sep-2016 16:38:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ECG_page_OpeningFcn, ...
                   'gui_OutputFcn',  @ECG_page_OutputFcn, ...
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


% --- Executes just before ECG_page is made visible.
function ECG_page_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ECG_page (see VARARGIN)

% Choose default command line output for ECG_page
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ECG_page wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ECG_page_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
%saveas(handles.output,'ECG Page.jpg')
varargout{1} = handles.output;


% --- Executes on button press in uploadECG_button.
function uploadECG_button_Callback(hObject, eventdata, handles)
% hObject    handle to uploadECG_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile;
[A,delimiterOut,headerlinesOut]=importdata([pathname filename]);
rawData = A;

set(handles.uploadECG_button,'String',filename);
set(handles.plotRawData_button,'enable','on');
set(handles.bandpassFilterSelection_Menu,'enable','on');
set(handles. plotFilteredData_button,'enable','off');
set(handles.apply_filter_button,'enable','on');

%fileName = get(handles.uploadECG_button,'String');
sz=size(rawData);
if sz(1)>1 && sz(2)>1
    set(handles.row_selection_panel,'Visible','On');
else
    set(handles.row_number,'String','1');
    set(handles.row_selection_panel,'Visible','Off');
end

set(handles.dataset_size_panel,'Visible','On');
st=['The size of your data is ',num2str(sz(1)),' by ',num2str(sz(2))];
set(handles.size_info_text,'String',st);
save('rawdata.mat','rawData');
samplingRate = str2double(get(handles.samplingRateEdit_text,'String'));
save('Fs.mat','samplingRate');




% --- Executes on button press in plotRawData_button.
function plotRawData_button_Callback(hObject, eventdata, handles)
% hObject    handle to plotRawData_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fileName = get(handles.uploadECG_button,'String');
rawData = importdata('rawdata.mat');
Fs=str2double(get(handles.samplingRateEdit_text,'String'));
t= (1:length(rawData))/Fs;
rowNumber=str2double(get(handles.row_number,'String'));
sz=size(rawData);
figure
if sz(1)>1 && sz(2)>1
plot(t,rawData(rowNumber,:))
elseif(sz(2)==1)      
    plot(t,rawData')
else
    plot(t,rawData)    
end
title(['Raw data, ',fileName,', dataset number ',get(handles.row_number,'String')]);
xlabel('Time (s)');
ylabel('Amplitude');



% --- Executes on selection change in bandpassFilterSelection_Menu.
function bandpassFilterSelection_Menu_Callback(hObject, eventdata, handles)
% hObject    handle to bandpassFilterSelection_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns bandpassFilterSelection_Menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from bandpassFilterSelection_Menu
contents = cellstr(get(hObject,'String'));
filterType = contents{get(hObject,'Value')};
if strcmp(filterType, 'Gaussian ')   
      set(handles.lowcut,'String','Length:');
      set(handles.highcut,'String','Sigma:');
      set(handles.lowcut_length_edit_text,'String','35');
      set(handles.highcut_sigma_edit_text,'String','3500');      
      set(handles.points_Hz_text,'String','points');
      set(handles.ms_Hz_text,'String','ms');
      
else
      set(handles.lowcut,'String','Low cutoff F:');
      set(handles.highcut,'String','High cutoff F:');
      set(handles.lowcut_length_edit_text,'String','5');
      set(handles.highcut_sigma_edit_text,'String','30');
      set(handles.points_Hz_text,'String','Hz');
      set(handles.ms_Hz_text,'String','Hz');
        
end


% --- Executes during object creation, after setting all properties.
function bandpassFilterSelection_Menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandpassFilterSelection_Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plotFilteredData_button.
function plotFilteredData_button_Callback(hObject, eventdata, handles)
% hObject    handle to plotFilteredData_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 

contents = cellstr(get(handles.bandpassFilterSelection_Menu,'String'));
filterType = contents{get(handles.bandpassFilterSelection_Menu,'Value')};
data = importdata('MyGUI_filteredData.mat');
Fs=str2double(get(handles.samplingRateEdit_text,'String'));
t= (1:length(data))/Fs;
rowNumber=str2double(get(handles.row_number,'String'));
sz=size(data);
figure
if sz(1)>1 && sz(2)>1
plot(t,data(rowNumber,:))
else
    plot(data)
end
title(['Filtered, ',get(handles.uploadECG_button,'String'),', row number ',get(handles.row_number,'String'),', ',filterType,', ',get(handles.lowcut_length_edit_text,'String'),'-',get(handles.highcut_sigma_edit_text,'String')]);
xlabel('Time (s)');
ylabel('Amplitude');



function samplingRateEdit_text_Callback(hObject, eventdata, handles)
% hObject    handle to samplingRateEdit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingRateEdit_text as text
%        str2double(get(hObject,'String')) returns contents of samplingRateEdit_text as a double
 samplingRate = str2double(get(hObject,'String'));
 save('Fs.mat','samplingRate');


% --- Executes during object creation, after setting all properties.
function samplingRateEdit_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to samplingRateEdit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in feature_selection_button.
function feature_selection_button_Callback(hObject, eventdata, handles)
% hObject    handle to feature_selection_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output,'Visible','off');
ECG_features;


% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)
% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output,'Visible','off');
cd ..
MyGUI;



function lowcut_length_edit_text_Callback(hObject, eventdata, handles)
% hObject    handle to lowcut_length_edit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowcut_length_edit_text as text
%        str2double(get(hObject,'String')) returns contents of lowcut_length_edit_text as a double


% --- Executes during object creation, after setting all properties.
function lowcut_length_edit_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowcut_length_edit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function highcut_sigma_edit_text_Callback(hObject, eventdata, handles)
% hObject    handle to highcut_sigma_edit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of highcut_sigma_edit_text as text
%        str2double(get(hObject,'String')) returns contents of highcut_sigma_edit_text as a double


% --- Executes during object creation, after setting all properties.
function highcut_sigma_edit_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to highcut_sigma_edit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in apply_filter_button.
function apply_filter_button_Callback(hObject, eventdata, handles)
% hObject    handle to apply_filter_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(handles.bandpassFilterSelection_Menu,'String'));
filterType = contents{get(handles.bandpassFilterSelection_Menu,'Value')};
lowF_length= str2double(get(handles.lowcut_length_edit_text,'String'));
highF_sigma= str2double(get(handles.highcut_sigma_edit_text,'String'));

alpha = (lowF_length-1)/(2*(highF_sigma/1000));
Fs = str2double(get(handles.samplingRateEdit_text,'String'));
set(handles.plotFilteredData_button,'enable','On');
fileName = get(handles.uploadECG_button,'String');
data = importdata('rawdata.mat');
switch filterType
    case 'Elliptic' 
        sz=size(data); 
        if(sz(2)==1)
          data=data';  
        end
        samplingRate = str2double(get(handles.samplingRateEdit_text,'String'));
        if (lowF_length >= (samplingRate/2)|| highF_sigma >= (samplingRate/2))
         msgbox('Cutoff frequencies must be less than half of sampling rate.')
        else
          filteredBandpass = elliptic_filter(data,lowF_length,highF_sigma,Fs);        
          save('MyGUI_filteredData.mat','filteredBandpass');
          sz=size(filteredBandpass); 
          segments= zeros(sz);
          %segments = NET.createArray('System.Double[]',sz(1));
          for k=1:sz(1)
            segments(k,:)=filteredBandpass(k,:);
          end
          
          %segments_cell=cell(segments);
          %save('segments_cell','segments_cell');
          save('segments_cell','segments');
          numberOfSegmentsEachRow=1;
          save('numberOfSegmentsEachRow.mat','numberOfSegmentsEachRow');
          save('LowF.mat','lowF_length');
          save('HighF.mat','highF_sigma');
          sigma=3500;
          gaus_length=35;
          save('Sigma.mat','sigma');
          save('Gaus_length.Mat','gaus_length');
          current_path=pwd;
          pathname=[current_path,'\filtered_data\',filterType,'_',get(handles.lowcut_length_edit_text,'String'),'_',get(handles.highcut_sigma_edit_text,'String'),'.mat'];
          save(pathname, 'filteredBandpass');
        end
        
    case 'Butterworth'
         sz=size(data); 
        if(sz(2)==1)
          data=data';  
        end
        samplingRate = str2double(get(handles.samplingRateEdit_text,'String'));
        if (lowF_length >= (samplingRate/2)|| highF_sigma >= (samplingRate/2))
         msgbox('Cutoff frequencies must be less than half of sampling rate.')
        else
         filteredBandpass = butterworth_filter(data,lowF_length,highF_sigma,Fs);
         save('MyGUI_filteredData.mat','filteredBandpass');
         sz=size(filteredBandpass);  
         %segments = NET.createArray('System.Double[]',sz(1));
         segments = zeros(sz);
         for k=1:sz(1)
            segments(k,:)=filteredBandpass(k,:);
         end
         %segments_cell=cell(segments);
         %save('segments_cell','segments_cell');
         save('segments_cell','segments');
         numberOfSegmentsEachRow=1;
         save('numberOfSegmentsEachRow.mat','numberOfSegmentsEachRow');
         save('LowF.mat','lowF_length');
         save('HighF.mat','highF_sigma');
         sigma=3500;
         gaus_length=35;
         save('Sigma.mat','sigma');
         save('Gaus_length.Mat','gaus_length');
         current_path=pwd;
         pathname=[current_path,'\filtered_data\',filterType,'_',get(handles.lowcut_length_edit_text,'String'),'_',get(handles.highcut_sigma_edit_text,'String'),'.mat'];
         save(pathname, 'filteredBandpass');
        end
    case 'Gaussian '
        load('Elptic_hi_4_6_SOS.mat');
        load('Elptic_hi_4_6_G.mat');
       
        sz=size(data); 
        if(sz(2)==1)
          data=data';  
        end
        sz=size(data);
        filteredHighpass=zeros(sz);
        for i=1:sz(1)
            filteredHighpass(i,:)=filtfilt(Elptic_hi_4_6_SOS,Elptic_hi_4_6_G,data(i,:));
        end
        filteredBandpass = guassian_filter(filteredHighpass,lowF_length,alpha);
        save('MyGUI_filteredData.mat','filteredBandpass');  
        sz=size(filteredBandpass); 
        %segments = NET.createArray('System.Double[]',sz(1));
        segments = zeros(sz);
        for k=1:sz(1)
            segments(k,:)=filteredBandpass(k,:);
        end
        %segments_cell=cell(segments);
        %save('segments_cell','segments_cell');
        save('segments_cell','segments');
        numberOfSegmentsEachRow=1;
        save('numberOfSegmentsEachRow.mat','numberOfSegmentsEachRow');
        save('Sigma.mat','highF_sigma');
        save('Gaus_length.Mat','lowF_length');
        lowF=5;
        highF=35;
        save('LowF.mat','lowF');
        save('HighF.mat','highF');  
        current_path=pwd;
        pathname=[current_path,'\filtered_data\',filterType,'_',get(handles.lowcut_length_edit_text,'String'),'_',get(handles.highcut_sigma_edit_text,'String'),'.mat'];
        save(pathname, 'filteredBandpass');
        
end
set(handles.visualization_menu,'enable','on');
samplingRate = str2double(get(handles.samplingRateEdit_text,'String'));
save('Fs.mat','samplingRate');


function overlap_windowSize_text_Callback(hObject, eventdata, handles)
% hObject    handle to overlap_windowSize_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of overlap_windowSize_text as text
%        str2double(get(hObject,'String')) returns contents of overlap_windowSize_text as a double


% --- Executes during object creation, after setting all properties.
function overlap_windowSize_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to overlap_windowSize_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function overlap_percent_text_Callback(hObject, eventdata, handles)
% hObject    handle to overlap_percent_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of overlap_percent_text as text
%        str2double(get(hObject,'String')) returns contents of overlap_percent_text as a double


% --- Executes during object creation, after setting all properties.
function overlap_percent_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to overlap_percent_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in apply_overlap_window_button.
function apply_overlap_window_button_Callback(hObject, eventdata, handles)
% hObject    handle to apply_overlap_window_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 filteredData = importdata('MyGUI_filteredData.mat');
 rawData = importdata('rawData.mat');
 Fs = str2double(get(handles.samplingRateEdit_text,'String'));
 window_size=round(str2double(get(handles.overlap_windowSize_text,'String'))/1000*Fs);
 overlap=round((str2double(get(handles.overlap_percent_text,'String'))/100)*str2double(get(handles.overlap_windowSize_text,'String'))/1000*Fs);
 rowNumber=str2double(get(handles.row_number,'String'));
 segments_cell = overlap_window_segmentation(filteredData,window_size,overlap,Fs,rowNumber,0);
 save('segments_cell','segments_cell');
 raw_segments_cell = overlap_window_segmentation(rawData,window_size,overlap,Fs,rowNumber,1);
 
 save('raw_segments_cell','raw_segments_cell');
 


function row_number_Callback(hObject, eventdata, handles)
% hObject    handle to row_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row_number as text
%        str2double(get(hObject,'String')) returns contents of row_number as a double


% --- Executes during object creation, after setting all properties.
function row_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in visualization_menu.
function visualization_menu_Callback(hObject, eventdata, handles)
% hObject    handle to visualization_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns visualization_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from visualization_menu
fileName = get(handles.uploadECG_button,'String');
rawData = importdata('rawdata.mat');

contents = cellstr(get(hObject,'String'));
visualization = contents{get(hObject,'Value')};
data = importdata('MyGUI_filteredData.mat');
Fs = str2double(get(handles.samplingRateEdit_text,'String'));
contents = cellstr(get(handles.bandpassFilterSelection_Menu,'String'));
filterType = contents{get(handles.bandpassFilterSelection_Menu,'Value')};

if strcmp(filterType, 'Gaussian ')  
    cutoff_F=5;
else
    cutoff_F=str2double(get(handles.lowcut_length_edit_text,'String'));
end

 sz=size(data);
        if sz(2)==1
            data=data';
        end
        sz=size(rawData);
        if sz(2)==1
            rawData=rawData';
        end
switch visualization
    case 'RR window'
        [qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin_revised(data(str2double(get(handles.row_number,'String')),:),Fs,1);
        st=['R to R segmentation, ',fileName,', row number ',get(handles.row_number,'String')];
        RR_segmentation(data(str2double(get(handles.row_number,'String')),:),qrs_i_raw,Fs,st);
        save('qrs_i_raw.mat','qrs_i_raw');
        
    case 'Beat to beat'       
        [qrs_amp_raw,qrs_i_raw,delay]=pan_tompkin_revised(data(str2double(get(handles.row_number,'String')),:),Fs,1);
         st=['Beat to beat segmentation, ',fileName,', row number ',get(handles.row_number,'String')];
         beat2beat_segmentation(rawData(str2double(get(handles.row_number,'String')),:),qrs_i_raw,cutoff_F,Fs,st);  
         save('qrs_i_raw.mat','qrs_i_raw');
end

% --- Executes during object creation, after setting all properties.
function visualization_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to visualization_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in Close_dataset_size_button.
function Close_dataset_size_button_Callback(hObject, eventdata, handles)
% hObject    handle to Close_dataset_size_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.dataset_size_panel,'Visible','Off');
