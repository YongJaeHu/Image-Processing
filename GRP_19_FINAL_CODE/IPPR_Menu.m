function varargout = IPPR_Menu(varargin)
% IPPR_Menu MATLAB code for IPPR_Menu.fig
%      IPPR_Menu, by itself, creates a new IPPR_Menu or raises the existing
%      singleton*.
%
%      H = IPPR_Menu returns the handle to a new IPPR_Menu or the handle to
%      the existing singleton*.
%
%      IPPR_Menu('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IPPR_Menu.M with the given input arguments.
%
%      IPPR_Menu('Property','Value',...) creates a new IPPR_Menu or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IPPR_Menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IPPR_Menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IPPR_Menu

% Last Modified by GUIDE v2.5 23-Mar-2023 17:45:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IPPR_Menu_OpeningFcn, ...
                   'gui_OutputFcn',  @IPPR_Menu_OutputFcn, ...
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


% --- Executes just before IPPR_Menu is made visible.
function IPPR_Menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IPPR_Menu (see VARARGIN)

% Choose default command line output for IPPR_Menu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IPPR_Menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IPPR_Menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Leather.
function Leather_Callback(hObject, eventdata, handles)
% hObject    handle to Leather (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(IPPR_Menu);
IPPR_Leather;

% --- Executes on button press in Latex.
function Latex_Callback(hObject, eventdata, handles)
% hObject    handle to Latex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(IPPR_Menu);
IPPR_Latex;

% --- Executes on button press in Rubber.
function Rubber_Callback(hObject, eventdata, handles)
% hObject    handle to Rubber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(IPPR_Menu);
IPPR_RubberV1;
