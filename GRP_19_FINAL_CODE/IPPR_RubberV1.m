function varargout = IPPR_RubberV1(varargin)
% IPPR_RUBBERV1 MATLAB code for IPPR_RubberV1.fig
%      IPPR_RUBBERV1, by itself, creates a new IPPR_RUBBERV1 or raises the existing
%      singleton*.
%
%      H = IPPR_RUBBERV1 returns the handle to a new IPPR_RUBBERV1 or the handle to
%      the existing singleton*.
%
%      IPPR_RUBBERV1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IPPR_RUBBERV1.M with the given input arguments.
%
%      IPPR_RUBBERV1('Property','Value',...) creates a new IPPR_RUBBERV1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IPPR_RubberV1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IPPR_RubberV1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IPPR_RubberV1

% Last Modified by GUIDE v2.5 23-Mar-2023 04:10:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IPPR_RubberV1_OpeningFcn, ...
                   'gui_OutputFcn',  @IPPR_RubberV1_OutputFcn, ...
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


% --- Executes just before IPPR_RubberV1 is made visible.
function IPPR_RubberV1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IPPR_RubberV1 (see VARARGIN)

% Choose default command line output for IPPR_RubberV1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IPPR_RubberV1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IPPR_RubberV1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in InsertImage.
function InsertImage_Callback(hObject, eventdata, handles)
% hObject    handle to InsertImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[File_Name, Path_Name] = uigetfile('PATHNAME')
I_name = append(Path_Name, File_Name);
glove = imread(char(I_name));
imshow(glove);

handles.glove=glove;
guidata(hObject,handles)

% --- Executes on button press in DetectDefect.
function DetectDefect_Callback(hObject, eventdata, handles)
% hObject    handle to DetectDefect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
glove=handles.glove;

RubberSkinDetection(glove);

% --- Executes on button press in MainMenu.
function MainMenu_Callback(hObject, eventdata, handles)
% hObject    handle to MainMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(IPPR_RubberV1);
IPPR_Menu;

