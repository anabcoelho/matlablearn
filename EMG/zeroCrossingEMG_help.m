function varargout = zeroCrossingEMG_help(varargin)
% ZEROCROSSINGEMG_HELP MATLAB code for zeroCrossingEMG_help.fig
%      ZEROCROSSINGEMG_HELP, by itself, creates a new ZEROCROSSINGEMG_HELP or raises the existing
%      singleton*.
%
%      H = ZEROCROSSINGEMG_HELP returns the handle to a new ZEROCROSSINGEMG_HELP or the handle to
%      the existing singleton*.
%
%      ZEROCROSSINGEMG_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZEROCROSSINGEMG_HELP.M with the given input arguments.
%
%      ZEROCROSSINGEMG_HELP('Property','Value',...) creates a new ZEROCROSSINGEMG_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zeroCrossingEMG_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zeroCrossingEMG_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zeroCrossingEMG_help

% Last Modified by GUIDE v2.5 03-Oct-2016 18:37:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zeroCrossingEMG_help_OpeningFcn, ...
                   'gui_OutputFcn',  @zeroCrossingEMG_help_OutputFcn, ...
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


% --- Executes just before zeroCrossingEMG_help is made visible.
function zeroCrossingEMG_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zeroCrossingEMG_help (see VARARGIN)

% Choose default command line output for zeroCrossingEMG_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zeroCrossingEMG_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['ZC is the number of times signal x crosses zero within an analysis window; it is a simple measure associated with the frequency of the signal [10].\n',...
' \n[10] D. Tkach,et. al.“Study of stability of time-domain features for electromyographic pattern recognition"',...
'  Journal of NeuroEngineering and Rehabilitation, 2010']);
set(handles.zeroCrossingEMG_text,'String',s);


% --- Outputs from this function are returned to the command line.
function varargout = zeroCrossingEMG_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
