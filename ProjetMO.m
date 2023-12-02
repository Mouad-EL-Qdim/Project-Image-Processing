function varargout = ProjetMO(varargin)
% PROJETMO MATLAB code for ProjetMO.fig
%      PROJETMO, by itself, creates a new PROJETMO or raises the existing
%      singleton*.
%
%      H = PROJETMO returns the handle to a new PROJETMO or the handle to
%      the existing singleton*.
%
%      PROJETMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJETMO.M with the given input arguments.
%
%      PROJETMO('Property','Value',...) creates a new PROJETMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ProjetMO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ProjetMO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% edit2 the above text to modify the response to help ProjetMO

% Last Modified by GUIDE v2.5 31-Jan-2023 15:56:18

% Begin initialization code - DO NOT EDIT2
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ProjetMO_OpeningFcn, ...
                   'gui_OutputFcn',  @ProjetMO_OutputFcn, ...
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
% End initialization code - DO NOT EDIT2


% --- Executes just before ProjetMO is made visible.
function ProjetMO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ProjetMO (see VARARGIN)

% Choose default command line output for ProjetMO
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ProjetMO wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ProjetMO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Import_Callback(hObject, eventdata, handles)
% hObject    handle to Import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1);
global im ;global histo ; global chisto ;
i=imgetfile;
im = imread(i);
imshow(im);
axes(handles.axes3);histo =histogramme(im);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');


% --------------------------------------------------------------------
function gril_Callback(hObject, eventdata, handles)
% hObject    handle to gril (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ;global histo ; global chisto ;
imm= rgb2gray(im);
axes(handles.axes2);imshow(imm);
axes(handles.axes3);histo =histogramme(im);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');



% --------------------------------------------------------------------
function Black_white_Callback(hObject, eventdata, handles)
% hObject    handle to Black_white (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global im;
global histo ; global chisto ;
b=im2bw(im);
imshow(b);

axes(handles.axes3);histo =histogramme(b);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');


% --------------------------------------------------------------------
function Fourier_Callback(hObject, eventdata, handles)
% hObject    handle to Fourier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global im;global histo ; global chisto ;


FS = fft2(double(im));
module = abs(fftshift(FS));
Max = max(max(max(abs(module))));
imshow(module/100000);colormap gray

axes(handles.axes3);histo =histogramme(im);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');


% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global histo ; global chisto ;
axes(handles.axes2);
imshow(im);
axes(handles.axes3);histo =histogramme(im);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');
 
% --------------------------------------------------------------------
function bruit_Callback(hObject, eventdata, handles)
% hObject    handle to bruit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function gauissian_Callback(hObject, eventdata, handles)
% hObject    handle to gauissian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ;
global imn ;
global histo ; global chisto ;


 imn = imnoise(im,'gaussian',0.1,0.1)
  axes(handles.axes2);
imshow(imn);
axes(handles.axes3);histo =histogramme(imn);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');


% --------------------------------------------------------------------
function salt_paper_Callback(hObject, eventdata, handles)
% hObject    handle to salt_paper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ;
global imp ;

global histo ; global chisto ;
imn=imnoise(im,'salt & pepper',0.5);
axes(handles.axes2)
imshow(imn);
axes(handles.axes3);histo =histogramme(imp);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');

% --------------------------------------------------------------------
function Miroir_Callback(hObject, eventdata, handles)
% hObject    handle to Miroir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Vertical_Callback(hObject, eventdata, handles)
% hObject    handle to Vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ; global histo ; global chisto ; global a;
             a = miroire(im) ;
             axes(handles.axes2);imshow(a);
axes(handles.axes3);histo =histogramme(a);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');
 
% --------------------------------------------------------------------
function Horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to Horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ;global histo ; global chisto ; global h;
             h= miroireH(im) ;
             axes(handles.axes2);imshow(h);
axes(handles.axes3);histo =histogramme(h);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');



% --------------------------------------------------------------------
function Moyen_Callback(hObject, eventdata, handles)
% hObject    handle to Moyen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ;
vr = str2double( get(handles.edit5,'String'));
im= filtre_moyen(im , vr);
axes(handles.axes2);
imshow(im);

% --------------------------------------------------------------------
function gaussien_Callback(hObject, eventdata, handles)
% hObject    handle to gaussien (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Median_Callback(hObject, eventdata, handles)
% hObject    handle to Median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function detection_Callback(hObject, eventdata, handles)
% hObject    handle to detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Robert_Callback(hObject, eventdata, handles)
% hObject    handle to Robert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global im ;
global imp;
 global histo ; global chisto ;
imp= contour(im,0);
imshow(imp);
 axes(handles.axes3);histo =histogramme(imp);plot(histo,'b');
 axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');
% --------------------------------------------------------------------
function Perwitt_Callback(hObject, eventdata, handles)
% hObject    handle to Perwitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global im ;
global imp;
 global histo ; global chisto ;
 imp= contour(im,1);
 imshow(imp);
axes(handles.axes3);histo =histogramme(imp);plot(histo,'b');
 axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');





% --------------------------------------------------------------------
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global im ;
global imp;
imp= contour(im,2);
imshow(imp);
 

% --- Executes on button press in Exit.
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'edit2') and get(hObject,'Max') to determine range of slider







% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



% --- Executes on button press in Rotation.
function Rotation_Callback(hObject, eventdata, handles)
% hObject    handle to Rotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global histo;
global chisto;
global im ;
global imr ;
s = str2double( get(handles.edit2,'String'));
imr=rotation(im,s);
imshow(imr);
axes(handles.axes3);histo =histogramme(imr);plot(histo,'b');
 axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');

% --- Executes on button press in suillage.
function suillage_Callback(hObject, eventdata, handles)
% hObject    handle to suillage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global histo;
global chisto;
global im ;
global ims ;
s = str2double( get(handles.edit5,'String'));
ims = seuillage(im,s);
imshow(ims);
axes(handles.axes3);histo =histogramme(ims);plot(histo,'b');
 axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes on button press in LUT.
function LUT_Callback(hObject, eventdata, handles)
% hObject    handle to LUT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2);
global im ;
global imlut ;
global histo; 
global chisto;
Min = str2double( get(handles.edit3,'String'));
Max = str2double( get(handles.edit1,'String'));
imlut = LUT(im,Min,Max);
imshow(imlut);
axes(handles.axes3);histo =histogramme(imlut);plot(histo,'b');
 axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --------------------------------------------------------------------
function Morphologie_Callback(hObject, eventdata, handles)
% hObject    handle to Morphologie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Erosion_Callback(hObject, eventdata, handles)
% hObject    handle to Erosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ime;
global im;
global histo;
global chisto;
se = strel('line',11,90);
ime = imerode(im,se);
axes(handles.axes2);
imshow(ime);
axes(handles.axes3);histo =histogramme(ime);plot(histo,'b');
 axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');

% --------------------------------------------------------------------
function Dialation_Callback(hObject, eventdata, handles)
% hObject    handle to Dialation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im; global histo; global chisto; global imd;

se = strel('line',11,90);
imd = imdilate(im,se);
axes(handles.axes2);
imshow(imd);
axes(handles.axes3);histo =histogramme(imd);plot(histo,'b');
 axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');


% --- Executes on button press in Enrgistrer.
function Enrgistrer_Callback(hObject, eventdata, handles)
% hObject    handle to Enrgistrer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ;
dir=imputfile;
imwrite(im,dir);



function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double





function fil_Callback(hObject, eventdata, handles)
% hObject    handle to fil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fil as text
%        str2double(get(hObject,'String')) returns contents of fil as a double


% --- Executes on button press in importI.
function importI_Callback(hObject, eventdata, handles)
% hObject    handle to importI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
global im ;global histo ; global chisto ;
i=imgetfile;
im = imread(i);
imshow(im);
axes(handles.axes3);histo =histogramme(im);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');


% --------------------------------------------------------------------
function egalisation_Callback(hObject, eventdata, handles)
% hObject    handle to egalisation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ; global histo ; global chisto ; global img;
img= eqHisto(im,chisto);
axes(handles.axes2);imshow(img);
axes(handles.axes3);histo =histogramme(img);plot(histo,'b');
axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');



function edit_Callback(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit as text
%        str2double(get(hObject,'String')) returns contents of edit as a double


% --- Executes during object creation, after setting all properties.
function edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit01_Callback(hObject, eventdata, handles)
% hObject    handle to edit01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit01 as text
%        str2double(get(hObject,'String')) returns contents of edit01 as a double


% --- Executes during object creation, after setting all properties.
function edit01_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit01 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function fil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in filt.
function filt_Callback(hObject, eventdata, handles)
% hObject    handle to filt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im ; global histo ; global chisto ;global imf;
fil = str2double( get(handles.fil,'String'));
vr = str2double( get(handles.edit,'String'));
sg = str2double( get(handles.edit01,'String'));
switch fil
             case 1
             imf= filtre_moyen(im , vr);
             axes(handles.axes2);imshow(imf);
             axes(handles.axes3);histo =histogramme(imf);plot(histo,'b');
             axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');        
             case 2
             imf= filtre_median(im , vr);
             axes(handles.axes2);imshow(imf);
             axes(handles.axes3);histo =histogramme(imf);plot(histo,'b');
             axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r'); 
             case 3;
             imf= Fgaussien(im,vr,sg);
             axes(handles.axes2);imshow(imf);
             axes(handles.axes3);histo =histogramme(imf);plot(histo,'b');
             axes(handles.axes4);chisto = hCumule(histo);plot(chisto,'r');             
end
set(handles.uipanel2,'visible','Off');
set(handles.edit,'enable','Off');
set(handles.edit01,'enable','Off');


% --------------------------------------------------------------------
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function moyen_Callback(hObject, eventdata, handles)
% hObject    handle to moyen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.fil,'string',num2str(1));
set(handles.uipanel2,'visible','On');
set(handles.edit,'enable','On');
set(handles.edit01,'enable','Off');

% --------------------------------------------------------------------
function gauss_Callback(hObject, eventdata, handles)
% hObject    handle to gauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.fil,'string',num2str(2));
set(handles.uipanel2,'visible','On');
set(handles.edit,'enable','On');
set(handles.edit01,'enable','Off');

% --------------------------------------------------------------------
function median_Callback(hObject, eventdata, handles)
% hObject    handle to median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.fil,'string',num2str(3));
set(handles.uipanel2,'visible','On');
set(handles.edit,'enable','On');
set(handles.edit01,'enable','Off');
