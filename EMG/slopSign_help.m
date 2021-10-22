function varargout = slopSign_help(varargin)
% SLOPSIGN_HELP MATLAB code for slopSign_help.fig
%      SLOPSIGN_HELP, by itself, creates a new SLOPSIGN_HELP or raises the existing
%      singleton*.
%
%      H = SLOPSIGN_HELP returns the handle to a new SLOPSIGN_HELP or the handle to
%      the existing singleton*.
%
%      SLOPSIGN_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLOPSIGN_HELP.M with the given input arguments.
%
%      SLOPSIGN_HELP('Property','Value',...) creates a new SLOPSIGN_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before slopSign_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to slopSign_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help slopSign_help

% Last Modified by GUIDE v2.5 03-Oct-2016 18:37:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @slopSign_help_OpeningFcn, ...
                   'gui_OutputFcn',  @slopSign_help_OutputFcn, ...
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


% --- Executes just before slopSign_help is made visible.
function slopSign_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to slopSign_help (see VARARGIN)

% Choose default command line output for slopSign_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes slopSign_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['Slope sign change is related to signal frequency and is defined as the number of times that the slope of the EMG waveform changes sign within an analysis window [10].\n',...
' \n[10] D. Tkach,et. al.“Study of stability of time-domain features for electromyographic pattern recognition"',...
'  Journal of NeuroEngineering and Rehabilitation, 2010']);
set(handles.slopSign_text,'String',s);


% --- Outputs from this function are returned to the command line.
function varargout = slopSign_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
