function varargout = Standard_deviation_RR(varargin)
% STANDARD_DEVIATION_RR MATLAB code for Standard_deviation_RR.fig
%      STANDARD_DEVIATION_RR, by itself, creates a new STANDARD_DEVIATION_RR or raises the existing
%      singleton*.
%
%      H = STANDARD_DEVIATION_RR returns the handle to a new STANDARD_DEVIATION_RR or the handle to
%      the existing singleton*.
%
%      STANDARD_DEVIATION_RR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STANDARD_DEVIATION_RR.M with the given input arguments.
%
%      STANDARD_DEVIATION_RR('Property','Value',...) creates a new STANDARD_DEVIATION_RR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Standard_deviation_RR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Standard_deviation_RR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Standard_deviation_RR

% Last Modified by GUIDE v2.5 30-May-2016 18:48:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Standard_deviation_RR_OpeningFcn, ...
                   'gui_OutputFcn',  @Standard_deviation_RR_OutputFcn, ...
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


% --- Executes just before Standard_deviation_RR is made visible.
function Standard_deviation_RR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Standard_deviation_RR (see VARARGIN)

% Choose default command line output for Standard_deviation_RR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Standard_deviation_RR wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s1=sprintf(['This feature is calculation of standard deviation of RR intervals [2].\n[2] M. Bsoul, et. al. “Real-time',...
'sleep quality assessment using single-lead ecg and multi-stage svm classifier,” (EMBC),',...
' IEEE, 2010, pp.1178–1181.']);

set(handles.SD_RR_text,'String',s1);

% --- Outputs from this function are returned to the command line.
function varargout = Standard_deviation_RR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
