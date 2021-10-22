function varargout = mean_SCR_duration_help(varargin)
% MEAN_SCR_DURATION_HELP MATLAB code for mean_SCR_duration_help.fig
%      MEAN_SCR_DURATION_HELP, by itself, creates a new MEAN_SCR_DURATION_HELP or raises the existing
%      singleton*.
%
%      H = MEAN_SCR_DURATION_HELP returns the handle to a new MEAN_SCR_DURATION_HELP or the handle to
%      the existing singleton*.
%
%      MEAN_SCR_DURATION_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEAN_SCR_DURATION_HELP.M with the given input arguments.
%
%      MEAN_SCR_DURATION_HELP('Property','Value',...) creates a new MEAN_SCR_DURATION_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mean_SCR_duration_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mean_SCR_duration_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mean_SCR_duration_help

% Last Modified by GUIDE v2.5 13-Jun-2016 18:46:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mean_SCR_duration_help_OpeningFcn, ...
                   'gui_OutputFcn',  @mean_SCR_duration_help_OutputFcn, ...
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


% --- Executes just before mean_SCR_duration_help is made visible.
function mean_SCR_duration_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mean_SCR_duration_help (see VARARGIN)

% Choose default command line output for mean_SCR_duration_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mean_SCR_duration_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['This feature is calculation of mean of duration of SCRs.\n ',...
'[1] K.H.Kim,et. al. "Emotion recognition system usig short-term monitoring",Medical and biological engineering and computing (2004)']);
set(handles.mean_duration_text,'String',s);


% --- Outputs from this function are returned to the command line.
function varargout = mean_SCR_duration_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in close_button.
function close_button_Callback(hObject, eventdata, handles)
% hObject    handle to close_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
