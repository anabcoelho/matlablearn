function varargout = waveformLength_help(varargin)
% WAVEFORMLENGTH_HELP MATLAB code for waveformLength_help.fig
%      WAVEFORMLENGTH_HELP, by itself, creates a new WAVEFORMLENGTH_HELP or raises the existing
%      singleton*.
%
%      H = WAVEFORMLENGTH_HELP returns the handle to a new WAVEFORMLENGTH_HELP or the handle to
%      the existing singleton*.
%
%      WAVEFORMLENGTH_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAVEFORMLENGTH_HELP.M with the given input arguments.
%
%      WAVEFORMLENGTH_HELP('Property','Value',...) creates a new WAVEFORMLENGTH_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before waveformLength_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to waveformLength_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help waveformLength_help

% Last Modified by GUIDE v2.5 03-Oct-2016 18:38:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @waveformLength_help_OpeningFcn, ...
                   'gui_OutputFcn',  @waveformLength_help_OutputFcn, ...
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


% --- Executes just before waveformLength_help is made visible.
function waveformLength_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to waveformLength_help (see VARARGIN)

% Choose default command line output for waveformLength_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes waveformLength_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['This feature provides a measure of the complexity of the signal. It is defined as the cumulative length of the EMG signal within the analysis window [10].\n',...
' \n[10] D. Tkach,et. al.�Study of stability of time-domain features for electromyographic pattern recognition"',...
'  Journal of NeuroEngineering and Rehabilitation, 2010']);
set(handles.waveformLength_text,'String',s);


% --- Outputs from this function are returned to the command line.
function varargout = waveformLength_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
