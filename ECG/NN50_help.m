function varargout = NN50_help(varargin)
% NN50_TEXT MATLAB code for NN50_text.fig
%      NN50_TEXT, by itself, creates a new NN50_TEXT or raises the existing
%      singleton*.
%
%      H = NN50_TEXT returns the handle to a new NN50_TEXT or the handle to
%      the existing singleton*.
%
%      NN50_TEXT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NN50_TEXT.M with the given input arguments.
%
%      NN50_TEXT('Property','Value',...) creates a new NN50_TEXT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NN50_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NN50_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NN50_text

% Last Modified by GUIDE v2.5 30-May-2016 19:34:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NN50_help_OpeningFcn, ...
                   'gui_OutputFcn',  @NN50_help_OutputFcn, ...
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


% --- Executes just before NN50_text is made visible.
function NN50_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NN50_text (see VARARGIN)

% Choose default command line output for NN50_text
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NN50_text wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['NN50 measure is defined as the number of pairs of adjacent RR-intervals where the first RR-interval exceeds the ',...
'second RR-interval by more than 50 ms [2].\n[2] M. Bsoul, et. al. “Real-time',...
'sleep quality assessment using single-lead ecg and multi-stage svm classifier,” (EMBC), IEEE, 2010.']);
set(handles.NN50_text,'String',s);

% --- Outputs from this function are returned to the command line.
function varargout = NN50_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
