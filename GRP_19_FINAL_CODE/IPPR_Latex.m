function varargout = IPPR_Latex(varargin)

% IPPR_LATEX MATLAB code for IPPR_Latex.fig
%      IPPR_LATEX, by itself, creates a new IPPR_LATEX or raises the existing
%      singleton*.
%
%      H = IPPR_LATEX returns the handle to a new IPPR_LATEX or the handle to
%      the existing singleton*.
%
%      IPPR_LATEX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IPPR_LATEX.M with the given input arguments.
%
%      IPPR_LATEX('Property','Value',...) creates a new IPPR_LATEX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IPPR_Latex_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IPPR_Latex_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IPPR_Latex

% Last Modified by GUIDE v2.5 22-Mar-2023 15:26:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IPPR_Latex_OpeningFcn, ...
                   'gui_OutputFcn',  @IPPR_Latex_OutputFcn, ...
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


% --- Executes just before IPPR_Latex is made visible.
function IPPR_Latex_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IPPR_Latex (see VARARGIN)

% Choose default command line output for IPPR_Latex
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IPPR_Latex wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IPPR_Latex_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnInsertLatex.
function btnInsertLatex_Callback(hObject, eventdata, handles)
% hObject    handle to btnInsertLatex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[File_Name, Path_Name] = uigetfile('PATHNAME')
I_name = append(Path_Name,File_Name);
I = imread(I_name);
imshow(I);

handles.I=I;
guidata(hObject,handles)

% --- Executes on button press in btnDetectLatex.
function btnDetectLatex_Callback(hObject, eventdata, handles)
% hObject    handle to btnDetectLatex (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=handles.I;

popup_items = get(handles.popThreshold, 'String');
% Get the index of the selected option
selected_item_index = get(handles.popThreshold, 'Value');
% Get the value of the selected option
thresholdValue = popup_items{selected_item_index};

main(I,thresholdValue);
%%1,2 - 475; 3 - 55; 4 - 50; 5 - 63; 6 - 82; 7 - 83

% --- Executes on button press in btnMainMenu.
function btnMainMenu_Callback(hObject, eventdata, handles)
% hObject    handle to btnMainMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popThreshold.
function popThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to popThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popThreshold contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popThreshold


% --- Executes during object creation, after setting all properties.
function popThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% get the current value of the popup menu
val = get(hObject, 'Value');

% set the values for the popup menu
popup_items = {'0.475', '0.50','0.55','0.63','0.82','0.83'};
set(hObject, 'String', popup_items);

% set the selected value
set(hObject, 'Value', val);

handles.popup_items=popup_items;
handles.val=val;
guidata(hObject,handles)
