function varargout = RMSSD_help(varargin)
% RMSSD_HELP MATLAB code for RMSSD_help.fig
%      RMSSD_HELP, by itself, creates a new RMSSD_HELP or raises the existing
%      singleton*.
%
%      H = RMSSD_HELP returns the handle to a new RMSSD_HELP or the handle to
%      the existing singleton*.
%
%      RMSSD_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RMSSD_HELP.M with the given input arguments.
%
%      RMSSD_HELP('Property','Value',...) creates a new RMSSD_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RMSSD_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RMSSD_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RMSSD_help

% Last Modified by GUIDE v2.5 30-May-2016 18:54:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RMSSD_help_OpeningFcn, ...
                   'gui_OutputFcn',  @RMSSD_help_OutputFcn, ...
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


% --- Executes just before RMSSD_help is made visible.
function RMSSD_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RMSSD_help (see VARARGIN)

% Choose default command line output for RMSSD_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RMSSD_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['RMSSD measure is defined as the square root of the mean of the sum of the squares of differences between adjacent',...
' RR-intervals [3].\n[3] P. De Chazal,et. al.“Automated processing of the single-lead electrocardiogram',...
'for the detection of obstructive sleep apnoea,” Biomedical Engineering, IEEE, 2003.']);
set(handles.RMSSD_text,'String',s);


% --- Outputs from this function are returned to the command line.
function varargout = RMSSD_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
