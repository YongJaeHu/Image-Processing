function varargout = IPPR_Leather(varargin)
% IPPR_LEATHER MATLAB code for IPPR_Leather.fig
%      IPPR_LEATHER, by itself, creates a new IPPR_LEATHER or raises the existing
%      singleton*.
%
%      H = IPPR_LEATHER returns the handle to a new IPPR_LEATHER or the handle to
%      the existing singleton*.
%
%      IPPR_LEATHER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IPPR_LEATHER.M with the given input arguments.
%
%      IPPR_LEATHER('Property','Value',...) creates a new IPPR_LEATHER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IPPR_Leather_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IPPR_Leather_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IPPR_Leather

% Last Modified by GUIDE v2.5 23-Mar-2023 11:20:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IPPR_Leather_OpeningFcn, ...
                   'gui_OutputFcn',  @IPPR_Leather_OutputFcn, ...
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


% --- Executes just before IPPR_Leather is made visible.
function IPPR_Leather_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IPPR_Leather (see VARARGIN)

% Choose default command line output for IPPR_Leather
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IPPR_Leather wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IPPR_Leather_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[File_Name, Path_Name] = uigetfile('PATHNAME')
I_name = append(Path_Name, File_Name);
glove = imread(char(I_name));
imshow(glove);

handles.glove=glove;
guidata(hObject,handles)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
glove=handles.glove;
lea_defect(glove);

% --- Executes on button press in hole.
function hole_Callback(hObject, eventdata, handles)
% hObject    handle to hole (see GCBO)
% eventdata  reserved - to b
% e defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
glove=handles.glove;
lea_hole_temp1(glove);

% --- Executes on button press in dirty.
function dirty_Callback(hObject, eventdata, handles)
% hObject    handle to dirty (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
glove=handles.glove;
lea_dirty_temp1(glove);

% --- Executes on button press in lossstitch.
function lossstitch_Callback(hObject, eventdata, handles)
% hObject    handle to lossstitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
glove=handles.glove;
lea_stitches_temp1(glove);

% --- Executes on button press in fingertips.
function fingertips_Callback(hObject, eventdata, handles)
% hObject    handle to fingertips (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
glove=handles.glove;
lea_tearfin_temp1(glove);

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(IPPR_Leather);
IPPR_Menu;

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(IPPR_Leather);
IPPR_Leather;
