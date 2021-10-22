function varargout = SDSD_help(varargin)
% SDSD_HELP MATLAB code for SDSD_help.fig
%      SDSD_HELP, by itself, creates a new SDSD_HELP or raises the existing
%      singleton*.
%
%      H = SDSD_HELP returns the handle to a new SDSD_HELP or the handle to
%      the existing singleton*.
%
%      SDSD_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SDSD_HELP.M with the given input arguments.
%
%      SDSD_HELP('Property','Value',...) creates a new SDSD_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SDSD_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SDSD_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SDSD_help

% Last Modified by GUIDE v2.5 30-May-2016 18:51:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SDSD_help_OpeningFcn, ...
                   'gui_OutputFcn',  @SDSD_help_OutputFcn, ...
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


% --- Executes just before SDSD_help is made visible.
function SDSD_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SDSD_help (see VARARGIN)

% Choose default command line output for SDSD_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SDSD_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['SDSD measure is defined as the standard deviation of the differences between adjacent RR-intervals [2].\n[2] M. Bsoul, et. al. “Real-time',...
'sleep quality assessment using single-lead ecg and multi-stage svm classifier,” (EMBC),IEEE, 2010.']);
 
set(handles.SDSD_text,'String',s);

% --- Outputs from this function are returned to the command line.
function varargout = SDSD_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
