function varargout = Mean_RR_interval(varargin)
% MEAN_RR_INTERVAL MATLAB code for Mean_RR_interval.fig
%      MEAN_RR_INTERVAL, by itself, creates a new MEAN_RR_INTERVAL or raises the existing
%      singleton*.
%
%      H = MEAN_RR_INTERVAL returns the handle to a new MEAN_RR_INTERVAL or the handle to
%      the existing singleton*.
%
%      MEAN_RR_INTERVAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEAN_RR_INTERVAL.M with the given input arguments.
%
%      MEAN_RR_INTERVAL('Property','Value',...) creates a new MEAN_RR_INTERVAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mean_RR_interval_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mean_RR_interval_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mean_RR_interval

% Last Modified by GUIDE v2.5 31-May-2016 08:54:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mean_RR_interval_OpeningFcn, ...
                   'gui_OutputFcn',  @Mean_RR_interval_OutputFcn, ...
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


% --- Executes just before Mean_RR_interval is made visible.
function Mean_RR_interval_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mean_RR_interval (see VARARGIN)

% Choose default command line output for Mean_RR_interval
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mean_RR_interval wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mean_RR_interval_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
s=sprintf('Mean of RR intervals is calculation of mean of all RR intervals [1].\n[1] J.Pan, W.Tompkins ,“A real-time QRS detection algorithm,”IEEE Trans. Eng. Biomed. Eng.');
set(handles.mean_RR_text,'String',s);
