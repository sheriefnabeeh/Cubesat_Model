function varargout = NCS_Library(varargin)
% NCS_LIBRARY M-file for NCS_Library.fig
%      NCS_LIBRARY, by itself, creates a new GUI NCS_LIBRARY or it raises 
%      the existing GUI window to make it visible.
%
%      H = NCS_LIBRARY returns the handle to a new NCS_LIBRARY or the 
%      handle to the existing singleton*.
%
%      NCS_LIBRARY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NCS_LIBRARY.M with the given input arguments.
%
%      NCS_LIBRARY('Property','Value',...) creates a new NCS_LIBRARY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NCS_Library_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NCS_Library_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NCS_Library

% Last Modified by GUIDE v2.5 16-Oct-2007 12:29:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NCS_Library_OpeningFcn, ...
                   'gui_OutputFcn',  @NCS_Library_OutputFcn, ...
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


% --- Executes just before NCS_Library is made visible.
function NCS_Library_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NCS_Library (see VARARGIN)

% Choose default command line output for NCS_Library
handles.output = hObject;

%  Check to see if the "Leaningtower" model exists.  If it does, then the 
%  files have been downloaded and the GUI will work properly

s  = exist('Leaningtower');
if s==4
    load bookcover
    image(book)
    axis('image'); axis('off')
else 
    errordlg('The NCS Library files are not on the MATLAB Path. Navigate to the NCS Library directory and use "Set Path" to put the Library and its subfolders on the MATLAB Path.','NCS Library Error')
    error('Aborting NCS Library GUI')
end

    
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NCS_Library wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NCS_Library_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1 (Selection of Chapter 1).
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH1 = which('Leaningtower');
cd(CH1(1:end-17));
list1 = {'Chapter 1 Simulnk Models' 'Foucault_Pendulum' 'Foucault_Pendulum_Tight_Tolerance' 'Leaningtower' 'Leaningtower2' 'Leaningtower3' 'Clocksim' 'Simplemodel'};  
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'Visible','off')

% --- Executes on button press in pushbutton2 (Selection of Chapter 2).
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH2 = which('Spring_Mass1');
cd(CH2(1:end-17));
list1 = {'Chapter 2 Simulink Models' 'Clock_transfer_functions'...
    'Generic_Control_System' 'PD_Control' 'PID_Control'...
    'PID_Control_Vel_Estimates' 'Rate_Reconstruction'...
    'Spring_Mass1' 'Spring_Mass2' 'Spring_Mass_Control' ...
    'SpringMass_Control_Sensor_Dynamics' 'SpringMass_Vel_Control' ...
    'SpringMass_Vel_Control2' 'State_Space' 'Thermo_NCS' };
list2 = {'Chapter 2 MATLAB m-files' 'c2d_ncs' 'RootLocus1' 'RootLocus2'...
    'Thermdat_NCS'};
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'String',list2)
set(handles.popupmenu2,'Visible','on')

% --- Executes on button press in pushbutton3 (Selection of Chapter 3).
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH3 = which('Weather_data');
cd(CH3(1:end-15));
list1 = {'Chapter 3 Simulink Models' 'Lorenz_1' 'Lorenz_2' 'Lorenz_testing' ...
    'Quaternion2DCM' 'Quaternion2Euler' 'Quaternion_acceleration'...
    'Quaternion_block' 'Reaction_Wheel' 'Reaction_Wheel2'...
    'Spacecraft_Attitude_Control' 'thermo_polynomial'   'thermo_real_data'...
    'thermo_table'};
list2 = {'Chapter 3 MATLAB m-files' 'Lorenz_eigs' 'Maple_CCt_identity'...
    'Maple_CCt_identity2' 'Simulated_Temp_Data' 'Weather_data'};
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'String',list2)
set(handles.popupmenu2,'Visible','on')

% --- Executes on button press in pushbutton4 (Selection of Chapter 4).
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH4 = which('Moving_Avg_FIR');
cd(CH4(1:end-18));
list1 = {'Chapter 4 Simulink Models' 'AnalogFiltersp' 'BP_Filter_Design_Tool'...
    'ButterWorth' 'ButterWorthsp' 'Digital_Filter' 'Digital_Filter1'...
    'FFT_reconstruction' 'Fib_State_Space1' 'Fib_State_Space2' ...
    'Fib_determinant' 'Fibonacci' 'Fibonacci2' ...
    'Moving_Avg_FIR' 'Moving_Avg_FIRsp' 'Phase_Lock_Loop'...
    'Sampling_Theorem' 'dig_sig_playback' 'digital_sig_generator'...
    'precision_testsp' 'precision_testsp1' 'precision_testsp2'};
list2 = {'Chapter 4 MATLAB m-files' 'Fibonacci_Mfile' 'butterworthncs'};
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'String',list2)
set(handles.popupmenu2,'Visible','on')

% --- Executes on button press in pushbutton5 (Selection of Chapter 5).
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH5 = which('Oneonf_discrete');
cd(CH5(1:end-19));
list1 = {'Chapter 5 Simulink Models' 'Continuous_Digital_Noise'...
    'Covariance_Matrix_c2d' 'Discrete_Digital_Noise' ...
    'Discrete_Digital_Noise1' 'Discrete_Digital_Noise2' 'Discrete_Digital_Noise3'...
    'Lyap_uisng_Simulink' 'Monte_Carlo_CentralLimit' 'Oneonf' 'Oneonf_discrete'...
    'Random_Walk' 'Rayleigh_Sim' 'White_Noise' 'test0' 'test1' 'test2' 'test3'};
list2 = {'Chapter 5 MATLAB m-files' 'Test_Noise_Models' 'c2d_ncs' 'oneftest'};
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'String',list2)
set(handles.popupmenu2,'Visible','on')

% --- Executes on button press in pushbutton6 (Selection of Chapter 6).
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH6 = which('TwoRoomHeatingSystem');
cd(CH6(1:end-24));
list1 = {'Chapter 6 Simulink Models' 'TwoRoomHeatingSystem' 'TwoRoomHeatingSystem24'};
list2 = {'Chapter 6 MATLAB m-files' 'TwoRoomHouse' 'TwoRoomHouse24' 'Weather_data'};   
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'String',list2)
set(handles.popupmenu2,'Visible','on')

% --- Executes on button press in pushbutton7 (Selection of Chapter 7).
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH7 = which('Heating_Control_GUI');
cd(CH7(1:end-22));
list1 = {'Chapter 7 Simulink Models' 'FirstStateflowModel' 'SecondStateflowModel'...
    ' Stateflow_Heating_Controller'};
list2 = {'Chapter 7 MATLAB m-files' 'Edited_Weather_data'  'Heating_Control_GUI'...
    'SFTwoRoomHouse' 'Simulated_Temp_Data' 'Weather_data' 'reset_time'...
    'reset_pushbuttons' 'updatesettemps' 'updatetemps' 'updatetime'};   
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'String',list2)
set(handles.popupmenu2,'Visible','on')

% --- Executes on button press in pushbutton8 (Selection of Chapter 8).
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH8 = which('NL_Res_Circuit');
cd(CH8(1:end-18));
list1 = {'Chapter 8 Simulink Models' 'FourRoomHouse' 'NL_Res_Circuit'...
    ' Nonlinear_Resistor' 'SimMechanics_Clock' 'SimMechanics_Pendulum'...
    'SimMechanics_Vibration' 'Simple_Circuit' 'Train_Simulation'};
list2 = {'Chapter 8 MATLAB m-files' 'Train_Data'};
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'String',list2)
set(handles.popupmenu2,'Visible','on')

% --- Executes on button press in pushbutton9 (Selection of Chapter 9).
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CH9 = which('LM_Control_System');
cd(CH9(1:end-21));
list1 = {'Chapter 9 Simulink Models' 'LM_Control_System' 'LMdap3dof'...
    'LMdap_Library_NCS'};
list2 = {'Chapter 9 MATLAB m-files' 'LMdap3dof_data' 'LMdapphaseplane' ...
    'LMphaseplane' 'LMswitchtime' 'TimeOptimal_phaseplot'};
set(handles.popupmenu1,'String',list1)
set(handles.popupmenu1,'Visible','on')
set(handles.popupmenu2,'String',list2)
set(handles.popupmenu2,'Visible','on')

% --- Executes on button press in pushbutton10 (Selection of Index).
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.popupmenu1,'Visible','off')
set(handles.popupmenu2,'Visible','off')
open('ncs_index.pdf')


% --- Executes on button press in pushbutton12 (Selects the SIAM web site)
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.popupmenu1,'Visible','off')
set(handles.popupmenu2,'Visible','off')
web 'http://www.ec-securehost.com/SIAM/OT100.html'


% --- Executes on button press in pushbutton13 (Selects the MAC Web Site)
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.popupmenu1,'Visible','off')
set(handles.popupmenu2,'Visible','off')
web 'http://www.math-analysis.com'


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
str = get(handles.popupmenu1,'String');
val = get(handles.popupmenu1,'Value');
if val ~=1
    evalin('base',str{val})
end
set(handles.popupmenu1,'Value',1)

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
str = get(handles.popupmenu2,'String');
val = get(handles.popupmenu2,'Value');
if val ~=1
    eval(['edit ' str{val}]);
end
set(handles.popupmenu2,'Value',1)

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

