function varargout = EDA_page(varargin)
% EDA_PAGE MATLAB code for EDA_page.fig
%      EDA_PAGE, by itself, creates a new EDA_PAGE or raises the existing
%      singleton*.
%
%      H = EDA_PAGE returns the handle to a new EDA_PAGE or the handle to
%      the existing singleton*.
%
%      EDA_PAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDA_PAGE.M with the given input arguments.
%
%      EDA_PAGE('Property','Value',...) creates a new EDA_PAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EDA_page_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EDA_page_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EDA_page

% Last Modified by GUIDE v2.5 30-Sep-2016 17:50:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EDA_page_OpeningFcn, ...
                   'gui_OutputFcn',  @EDA_page_OutputFcn, ...
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


% --- Executes just before EDA_page is made visible.
function EDA_page_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EDA_page (see VARARGIN)

% Choose default command line output for EDA_page
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EDA_page wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EDA_page_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upload_EDA_button.
function upload_EDA_button_Callback(hObject, eventdata, handles)
% hObject    handle to upload_EDA_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname]=uigetfile;
[A,delimiterOut,headerlinesOut]=importdata([pathname filename]);
rawData = A;

set(handles.upload_EDA_button,'String',filename);
set(handles.filter_popup,'enable','on');
set(handles.plotRawData_button,'enable','on');
set(handles. plotFilteredData_button,'enable','off');
set(handles. find_SCR_button,'enable','off');
set(handles.filter_apply_button,'enable','on');
set(handles.plotRawData_button,'enable','on');

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
fileName = get(handles. upload_EDA_button,'String');
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
    plot(t,rawData')    
end
title(['Raw data, ',fileName,', row number ',get(handles.row_number,'String')]);
xlabel('Time (s)');
ylabel('Amplitude');



% --- Executes on button press in plotFilteredData_button.
function plotFilteredData_button_Callback(hObject, eventdata, handles)
% hObject    handle to plotFilteredData_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(handles.filter_popup,'String'));
filterType = contents{get(handles.filter_popup,'Value')};
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
title(['Filtered, ',get(handles.upload_EDA_button,'String'),', row number ',get(handles.row_number,'String'),', ',filterType,', ',get(handles.lowcut_length_edit_text,'String'),'-',get(handles.highcut_sigma_edit_text,'String')]);

xlabel('Time (s)');
ylabel('Amplitude');



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in filter_popup.
function filter_popup_Callback(hObject, eventdata, handles)
% hObject    handle to filter_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filter_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filter_popup
contents = cellstr(get(hObject,'String'));
 filterType = contents{get(hObject,'Value')};
if strcmp(filterType, 'Gaussian')   
      set(handles.lowCut,'String','Length:');
      set(handles.highCut,'String','Sigma:');
      set(handles.lowcut_length_edit_text,'String','20');
      set(handles.highcut_sigma_edit_text,'String','200');
      set(handles.points_Hz_text,'String','points');
      set(handles.ms_Hz_text,'String','ms');
      
else
      set(handles.lowCut,'String','Low cutoff F:');
      set(handles.highCut,'String','High cutoff F:');
      set(handles.lowcut_length_edit_text,'String','5');
      set(handles.highcut_sigma_edit_text,'String','30');
      set(handles.points_Hz_text,'String','Hz');
      set(handles.ms_Hz_text,'String','Hz');
        
end

% --- Executes during object creation, after setting all properties.
function filter_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on button press in filter_apply_button.
function filter_apply_button_Callback(hObject, eventdata, handles)
% hObject    handle to filter_apply_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(handles.filter_popup,'String'));
filterType = contents{get(handles.filter_popup,'Value')};
lowF_length= str2double(get(handles.lowcut_length_edit_text,'String'));
highF_sigma= str2double(get(handles.highcut_sigma_edit_text,'String'));
alpha = (lowF_length-1)/(2*(highF_sigma/1000));
Fs = str2double(get(handles.samplingRateEdit_text,'String'));
set(handles.plotFilteredData_button,'enable','On');
set(handles. find_SCR_button,'enable','on');
set(handles.find_SCR_button,'enable','On');
    fileName = get(handles.upload_EDA_button,'String');
    data = importdata('rawdata.mat');
switch filterType    
    case 'Gaussian'
         sz=size(data); 
        if(sz(2)==1)
          data=data';  
        end
        filteredBandpass = guassian_filter(data,lowF_length,alpha);
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
        current_path=pwd;
        pathname=[current_path,'\filtered_data\',filterType,'_',get(handles.lowcut_length_edit_text,'String'),'_',get(handles.highcut_sigma_edit_text,'String'),'.mat'];
        save(pathname, 'filteredBandpass');
    case 'Butterworth'
        sz=size(data); 
        if(sz(2)==1)
          data=data';  
        end
        samplingRate = str2double(get(handles.samplingRateEdit_text,'String'));
        if (lowF_length >= (samplingRate/2)|| highF_sigma >= (samplingRate/2))
         msgbox('Cutoff frequencies must be less than half of sampling rate.')
        else
         filteredBandpass = butterworth_filter_EDA(data,lowF_length,highF_sigma,Fs);
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
         current_path=pwd;
         pathname=[current_path,'\filtered_data\',filterType,'_',get(handles.lowcut_length_edit_text,'String'),'_',get(handles.highcut_sigma_edit_text,'String'),'.mat'];
         save(pathname, 'filteredBandpass');
        end
    case 'Elliptic '
        sz=size(data); 
        if(sz(2)==1)
          data=data';  
        end
        samplingRate = str2double(get(handles.samplingRateEdit_text,'String'));
        if (lowF_length >= (samplingRate/2)|| highF_sigma >= (samplingRate/2))
         msgbox('Cutoff frequencies must be less than half of sampling rate.')
        else
         filteredBandpass = elliptic_filter_EDA(data,lowF_length,highF_sigma,Fs);
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
         current_path=pwd;
         pathname=[current_path,'\filtered_data\',filterType,'_',get(handles.lowcut_length_edit_text,'String'),'_',get(handles.highcut_sigma_edit_text,'String'),'.mat'];
         save(pathname, 'filteredBandpass');
        end
end

samplingRate = str2double(get(handles.samplingRateEdit_text,'String'));
save('Fs.mat','samplingRate');



function samplingRateEdit_text_Callback(hObject, eventdata, handles)
% hObject    handle to samplingRateEdit_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingRateEdit_text as text
%        str2double(get(hObject,'String')) returns contents of samplingRateEdit_text as a double


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


% --- Executes on button press in back_button.
function back_button_Callback(hObject, eventdata, handles)
% hObject    handle to back_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output,'Visible','off');
cd ..
MyGUI;


% --- Executes on button press in next_button.
function next_button_Callback(hObject, eventdata, handles)
% hObject    handle to next_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.output,'Visible','off');
EDA_features;


% --- Executes on button press in find_SCR_button.
function find_SCR_button_Callback(hObject, eventdata, handles)
% hObject    handle to find_SCR_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = importdata('MyGUI_filteredData.mat');
Fs= str2double(get(handles.samplingRateEdit_text,'String'));
rowNumber=str2double(get(handles.row_number,'String'));
find_SCR(data,Fs,rowNumber);


% --- Executes on button press in SCR_help_button.
function SCR_help_button_Callback(hObject, eventdata, handles)
% hObject    handle to SCR_help_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SCR_help;



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


% --- Executes on button press in Close_dataset_size_button.
function Close_dataset_size_button_Callback(hObject, eventdata, handles)
% hObject    handle to Close_dataset_size_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.dataset_size_panel,'Visible','Off');
