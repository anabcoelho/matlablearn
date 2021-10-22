function varargout = pNN50_help(varargin)
% PNN50_TEXT MATLAB code for pNN50_text.fig
%      PNN50_TEXT, by itself, creates a new PNN50_TEXT or raises the existing
%      singleton*.
%
%      H = PNN50_TEXT returns the handle to a new PNN50_TEXT or the handle to
%      the existing singleton*.
%
%      PNN50_TEXT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PNN50_TEXT.M with the given input arguments.
%
%      PNN50_TEXT('Property','Value',...) creates a new PNN50_TEXT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pNN50_help_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pNN50_help_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pNN50_text

% Last Modified by GUIDE v2.5 30-May-2016 19:41:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pNN50_help_OpeningFcn, ...
                   'gui_OutputFcn',  @pNN50_help_OutputFcn, ...
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


% --- Executes just before pNN50_text is made visible.
function pNN50_help_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pNN50_text (see VARARGIN)

% Choose default command line output for pNN50_text
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pNN50_text wait for user response (see UIRESUME)
% uiwait(handles.figure1);
s=sprintf(['pNN50 measure is defined as the number of pairs of adjacent RR-intervals where the second RR-interval exceeds',...
'the first RR-interval by more than 50 ms [2]\n[2] M. Bsoul, et. al. “Real-time',...
'sleep quality assessment using single-lead ecg and multi-stage svm classifier,” (EMBC),IEEE, 2010.']);
set(handles.pNN50_text,'String',s);

% --- Outputs from this function are returned to the command line.
function varargout = pNN50_help_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
