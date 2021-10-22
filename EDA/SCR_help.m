function varargout = SCR_help(varargin)
% SCR_HELP MATLAB code for SCR_help.fig
%      SCR_HELP, by itself, creates a new SCR_HELP or raises the existing
%      singleton*.
%
%      H = SCR_HELP returns the handle to a new SCR_HELP or the handle to
%      the existing singleton*.
%
%      SCR_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCR_HELP.M with the given input arguments.
%
%      SCR_HELP('Property','Value',...) creates a new SCR_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SCR_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SCR_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SCR_help

% Last Modified by GUIDE v2.5 14-Jun-2016 14:03:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SCR_help_OpeningFcn, ...
                   'gui_OutputFcn',  @SCR_help_OutputFcn, ...
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


% --- Executes just before SCR_help is made visible.
function SCR_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SCR_help (see VARARGIN)

% Choose default command line output for SCR_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SCR_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['Skin conductance responses (SCR)s are distinctive short waveforms over DC level of EDA signal. ',...
'SCR is very useful as it signifies a response to internal/external stimuli.\n\n',...
'[1] K.H.Kim,et. al. "Emotion recognition system usig short-term monitoring", Medical and biological engineering and computing (2004)']);
set(handles.SCR_text,'String',s);


% --- Outputs from this function are returned to the command line.
function varargout = SCR_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
