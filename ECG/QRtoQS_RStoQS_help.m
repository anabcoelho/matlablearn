function varargout = QRtoQS_RStoQS_help(varargin)
% QRTOQS_RSTOQS_HELP MATLAB code for QRtoQS_RStoQS_help.fig
%      QRTOQS_RSTOQS_HELP, by itself, creates a new QRTOQS_RSTOQS_HELP or raises the existing
%      singleton*.
%
%      H = QRTOQS_RSTOQS_HELP returns the handle to a new QRTOQS_RSTOQS_HELP or the handle to
%      the existing singleton*.
%
%      QRTOQS_RSTOQS_HELP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QRTOQS_RSTOQS_HELP.M with the given input arguments.
%
%      QRTOQS_RSTOQS_HELP('Property','Value',...) creates a new QRTOQS_RSTOQS_HELP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before QRtoQS_RStoQS_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to QRtoQS_RStoQS_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help QRtoQS_RStoQS_help

% Last Modified by GUIDE v2.5 30-May-2016 19:53:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @QRtoQS_RStoQS_help_OpeningFcn, ...
                   'gui_OutputFcn',  @QRtoQS_RStoQS_help_OutputFcn, ...
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


% --- Executes just before QRtoQS_RStoQS_help is made visible.
function QRtoQS_RStoQS_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to QRtoQS_RStoQS_help (see VARARGIN)

% Choose default command line output for QRtoQS_RStoQS_help
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes QRtoQS_RStoQS_help wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['To find these two features we calculate the ratio of QR',...
'interval to QS interval and also the ratio of RS interval and QS interval for each R peak.']);
set(handles.QRtoQS_RS_QS_text,'String',s);

% --- Outputs from this function are returned to the command line.
function varargout = QRtoQS_RStoQS_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
