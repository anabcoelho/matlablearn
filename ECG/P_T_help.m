function varargout = P_T_help(varargin)
% P_T_HELP MATLAB code for P_T_help.fig
%      P_T_HELP, by itself, creates a new P_T_HELP or raises the existing
%      singleton*.
%
%      H = P_T_HELP returns the handle to a new P_T_HELP or the handle to
%      the existing singleton*.
%
%      P_T_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in P_T_HELP.M with the given input arguments.
%
%      P_T_HELP('Property','Value',...) creates a new P_T_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before P_T_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to P_T_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help P_T_help

% Last Modified by GUIDE v2.5 30-May-2016 19:44:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @P_T_help_OpeningFcn, ...
                   'gui_OutputFcn',  @P_T_help_OutputFcn, ...
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


% --- Executes just before P_T_help is made visible.
function P_T_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to P_T_help (see VARARGIN)

% Choose default command line output for P_T_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes P_T_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['This feature extracts the locations of P and T waves']);
set(handles.P_T_text,'String',s);



% --- Outputs from this function are returned to the command line.
function varargout = P_T_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
