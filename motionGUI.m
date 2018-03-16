function varargout = motionGUI(varargin)
% MOTIONGUI M-file for motionGUI.fig
%      MOTIONGUI, by itself, creates a new MOTIONGUI or raises the existing
%      singleton*.
%
%      H = MOTIONGUI returns the handle to a new MOTIONGUI or the handle to
%      the existing singleton*.
%
%      MOTIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOTIONGUI.M with the given input arguments.
%
%      MOTIONGUI('Property','Value',...) creates a new MOTIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before motionGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to motionGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help motionGUI

% Last Modified by GUIDE v2.5 16-Mar-2017 16:17:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @motionGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @motionGUI_OutputFcn, ...
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


% --- Executes just before motionGUI is made visible.
function motionGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to motionGUI (see VARARGIN)

% Choose default command line output for motionGUI
handles.output = hObject;
handles.motion_style_index = get(handles.motion_style, 'Value');
axes(handles.axes1);
ylabel('Velocity [m/s]');
axes(handles.axes2);
ylabel('Position [m]');
axes(handles.axes3);
ylabel('Acceleration [m/s^2]');
axes(handles.axes3);
xlabel('Time [s]');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes motionGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = motionGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function start_point_Callback(hObject, eventdata, handles)
% hObject    handle to start_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start_point as text
%        str2double(get(hObject,'String')) returns contents of start_point as a double
strt = str2double(get(hObject, 'String'));
if isnan(strt)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new volume value
set(handles.start_point, 'Value', strt);

% --- Executes during object creation, after setting all properties.
function start_point_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stop_point_Callback(hObject, eventdata, handles)
% hObject    handle to stop_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stop_point as text
%        str2double(get(hObject,'String')) returns contents of stop_point as a double
stp = str2double(get(hObject, 'String'));
if isnan(stp)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new volume value
set(handles.stop_point, 'Value', stp);

% --- Executes during object creation, after setting all properties.
function stop_point_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stop_point (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vmax_Callback(hObject, eventdata, handles)
% hObject    handle to vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vmax as text
%        str2double(get(hObject,'String')) returns contents of vmax as a double
vm = str2double(get(hObject, 'String'));
if isnan(vm)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new volume value
set(handles.vmax, 'Value', vm);

% --- Executes during object creation, after setting all properties.
function vmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function amax_Callback(hObject, eventdata, handles)
% hObject    handle to amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of amax as text
%        str2double(get(hObject,'String')) returns contents of amax as a double
am = str2double(get(hObject, 'String'));
if isnan(am)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new volume value
set(handles.amax, 'Value', am);

% --- Executes during object creation, after setting all properties.
function amax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to amax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function jmax_Callback(hObject, eventdata, handles)
% hObject    handle to jmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jmax as text
%        str2double(get(hObject,'String')) returns contents of jmax as a double
jm = str2double(get(hObject, 'String'));
if isnan(jm)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new volume value
set(handles.jmax, 'Value', jm);

% --- Executes during object creation, after setting all properties.
function jmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in motion_style.
function motion_style_Callback(hObject, eventdata, handles)
% hObject    handle to motion_style (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns motion_style contents as cell array
%        contents{get(hObject,'Value')} returns selected item from motion_style
handles.motion_style_index = get(handles.motion_style, 'Value');

guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function motion_style_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motion_style (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in update_btn.
function update_btn_Callback(hObject, eventdata, handles)
% hObject    handle to update_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;
ylabel('Velocity [m/s]');
axes(handles.axes2);
cla;
ylabel('Position [m]');
axes(handles.axes3);
cla;
axes(handles.axes1);
ylabel('Velocity [m/s]'); hold on;
axes(handles.axes2);
ylabel('Position [m]'); hold on;
axes(handles.axes3);
ylabel('Acceleration [m/s^2]'); hold on;
axes(handles.axes3); hold on;
xlabel('Time [s]');

am=get(handles.amax, 'Value');
vm=get(handles.vmax, 'Value');
jm=get(handles.jmax, 'Value');
start_p=get(handles.start_point, 'Value');
stop_p=get(handles.stop_point, 'Value');


strt=start_p;
stp=stop_p;
if(start_p<stop_p)
                distance=stop_p-start_p;
                fleg=0;
        
else
                distance=start_p-stop_p;
                stop_p=start_p;
                start_p=stop_p-distance;
                fleg=1;
end

stop_p=stop_p-start_p;





if(handles.motion_style_index==1) %if motion with jerk
if((am^2/vm)>jm)

    errordlg('jm no good','Error');
    guidata(hObject,handles);
    return;
end

AA=jm*vm*am/(am^2+jm*vm);%scaling factor that determines linear segment during acceleration 
if((AA<(am/2)) || (AA>=am))
    
    
    errordlg('AA no good','Error');
    guidata(hObject,handles);
    return;
end
   t1=floor(am/jm);
   a=jm*t1;
   v=jm*t1^2/2;
   s=jm*t1^3/6;
   a1m=a;
   v1m=v;
   s1m=s;
   t1f=t1;
   
   t2=floor(vm/AA-am/jm);
   if(t2<0)
       
       errordlg('t2 no good','Error');
       guidata(hObject,handles);
       return;
   end
   t2f=t2-t1;
   a=a1m;
   v=v1m+a1m*(t2f);
   s=s1m+v1m*(t2f)+a*(t2f)^2/2;
   a2m=a;
   v2m=v;
   s2m=s;
   
   
   
   t3=floor(vm/AA);
   if(t3<t2)
        
        errordlg('t3 no good','Error');
        guidata(hObject,handles);
        return;
   end
   t3f=t3-(t2f+t1f);
   a=a2m-jm*(t3f);
   v=v2m+a2m*(t3f)-jm*(t3f)^2/2;
   s=s2m+v2m*(t3f)+a2m*(t3f)^2/2-jm*(t3f)^3/6;
   a3m=a;
   v3m=v;
   s3m=s;
   
   if((stop_p-2*s3m)<0)
       
       errordlg('steady error','Error');
       guidata(hObject,handles);
       return;
   end
   
   t4=t3+floor((stop_p-2*s3m)/v3m)+1;
   s=stop_p-s3m;
   s4m=s;
   t4f=floor((stop_p-2*s3m)/v3m)+1;
   if(t4<0)
        
        errordlg('t4 no good','Error');
        guidata(hObject,handles);
        return;
   end
%    t4=t3;
   t5=t4+t3-t2;
   if(t5<t4)
        
        errordlg('t5 no good','Error');
        guidata(hObject,handles);
        return;
   end
   t5f=t3f;
   a=a3m-jm*(t5f);
   v=v3m-jm*(t5f)^2/2;
   s=s4m+v3m*(t5f)+a3m*(t5f)^2/2-jm*(t5f)^3/6;
   a5m=a;
   v5m=v;
   s5m=s;
   
   
   t6=t5+t2-t1;
   if(t6<t5)
        
        errordlg('t6 no good','Error');
        guidata(hObject,handles);
        return;
   end
   t6f=t2f;
   a=a5m;
   v=v5m+a5m*(t6f);
   s=s5m+v5m*(t6f)+a5m*(t6f)^2/2;
   a6m=a;
   v6m=v;
   s6m=s;
   
   
   t7=t6+t1;
   if(t7<t6)
        
        errordlg('t7 no good','Error');
        guidata(hObject,handles);
        return;
   end
   t7f=t1f;
   a=a6m+jm*(t7f);
   v=v6m+a6m*(t7f)+jm*(t7f)^2/2;
   s=s6m+v6m*(t7f)+a6m*(t7f)^2/2+jm*(t7f)^3/6;
   a7m=a;
   v7m=v;
   s7m=s;
   
   if((s7m~=stop_p))
       
        errordlg('stop point unreachable','Error');
        guidata(hObject,handles);
        return;
   end
   
   
   t=0;
s=0;
v=0;
a=0;

tf=0;


set(handles.axes1,'Xlim', [0 t7]);
set(handles.axes2,'Xlim', [0 t7]);
set(handles.axes3,'Xlim', [0 t7]);
set(handles.axes1,'Ylim', [0 6*get(handles.vmax, 'Value')/5]);
set(handles.axes2,'Ylim', [start_p stop_p]);
set(handles.axes3,'Ylim', [-get(handles.amax, 'Value') get(handles.amax, 'Value')]);

while(tf<t1f)
    t=t+1;
    tf=tf+1;
    a=jm*t;
    v=jm*t^2/2;
    s=jm*t^3/6;
    
    

    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end

am=a;
vm=v;
sm=s;
tf=0;
while(tf<t2f)
    t=t+1;
    tf=tf+1;
    a=am;
    v=vm+am*(tf);
    s=sm+vm*(tf)+a*(tf)^2/2;

    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end





am=a;
vm=v;
sm=s;
tf=0;
while(tf<t3f)
    t=t+1;
    tf=tf+1;
    a=am-jm*(tf);
    v=vm+am*(tf)-jm*(tf)^2/2;
    s=sm+vm*(tf)+am*(tf)^2/2-jm*(tf)^3/6;

    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end    
    
    
    
    
    
am=a;
vm=v;
sm=s;
tf=0;

while(tf<t4f)
    t=t+1;
    tf=tf+1;
    a=am;
    v=vm;
    s=sm+vm*(tf);
if((s~=s4m)&&(t==t4))%if it "overcomes" bring it slightly back so you can have a clean fall
    s=s4m;
    v=(s-sm)/(t-t3);
end

    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end








sm=s;
tf=0;
while(tf<t5f)
    t=t+1;
    tf=tf+1;
    a=am-jm*(tf);
    v=vm-jm*(tf)^2/2;
    s=sm+vm*(tf)+am*(tf)^2/2-jm*(tf)^3/6;

    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end
    
    
    

am=a;
vm=v;
sm=s;
tf=0;
while(tf<t6f)
    t=t+1;
    tf=tf+1;
    a=am;
    v=vm+am*(tf);
    s=sm+vm*(tf)+am*(tf)^2/2;

    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end
    
    
    
    
am=a;
vm=v;
sm=s;
tf=0;
while(tf<t7f)
    t=t+1;
    tf=tf+1;
    a=am+jm*(tf);
    v=vm+am*(tf)+jm*(tf)^2/2;
    s=sm+vm*(tf)+am*(tf)^2/2+jm*(tf)^3/6;

    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end

hold off;


% if trapezoidal/triangular motion
else
    Tvm=0;
if (distance<vm^2/am) % Triangular velocity profile
    
    Ta=floor(sqrt(distance/am)); % Acceleration time
    
else % Trapezoidal velocity profile
    Ta=floor(vm/am); % Acceleration time
    Tvm=floor((distance-vm^2/am)/vm);
    
end
    
% Elaboration of the limited acceleration profile 

t2=Ta;

        s=0;
        v=0;
        t=0;
        a=am;
        
        


tf=0;
set(handles.axes1,'Xlim', [0 2*t2+Tvm]);
set(handles.axes2,'Xlim', [0 2*t2+Tvm]);
set(handles.axes3,'Xlim', [0 2*t2+Tvm]);
set(handles.axes1,'Ylim', [0 6*get(handles.vmax, 'Value')/5]);
set(handles.axes3,'Ylim', [-get(handles.amax, 'Value') get(handles.amax, 'Value')]);
set(handles.axes2,'Ylim', [start_p stop_p]);

while(t<t2)
t=t+1;    
tf=tf+1;    
        v=am*tf;
        s=v*tf/2;

        a=am;
        
        
    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, '*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;	
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end


tf=0;
sm=s;
vm=v;
ss=s;
vv=v;
while(s<(stop_p-sm))
   t=t+1;
   tf=tf+1;
        s=sm+vm*(tf);

        a=0;
if(s>(stop_p-sm))%if it "overcomes" bring it slightly back so you can have a clean fall
    s=stop_p-sm;
    v=(s-sm)/(tf);
    
end

    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end

v=vv;
sm=s;
t3=t;
tf=0;
while(s<stop_p)
    a=-am;
t=t+1;  
tf=tf+1;
        v=vm-am*(tf);

        s=sm+(tf)*(v+am*(tf)/2);
        
        if(s>stop_p)
            s=stop_p;
            v=(stop_p-sm-am*t^2/2)/tf;
        end
    plot(handles.axes1, t, v, 'r*');
    pause(0.0001);
    hold on;
    

    if(fleg==1)
        plot(handles.axes2, t, stop_p-s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    else
        plot(handles.axes2, t, s+start_p, 'b*');
        pause(0.0001);
        hold on;
        

    end


    plot(handles.axes3, t, a, 'g*');
    pause(0.0001);
    hold on;
end


if(fleg==1)
s=stop_p-s+start_p;
else
s=s+start_p; 
end

hold off;
end


guidata(hObject, handles);


% --- Executes on button press in reset_.
function reset_btn_Callback(hObject, eventdata, handles)
% hObject    handle to reset_ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pos_size = get(handles.figure1,'Position');

% Call modaldlg with the argument 'Position'.
user_response = reset_btn('Title','Confirm Close');
switch user_response
case {'No'}
	% take no action
case 'Yes'
	% Prepare to close application window
	%                  .
	%                  .
	%                  .
	%delete(handles.figure1)
    initialize_gui(gcbf, handles, true);
end


% --------------------------------------------------------------------
function initialize_gui(hObject, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

axes(handles.axes1);
cla;
ylabel('Velocity [m/s]');
axes(handles.axes2);
cla;
ylabel('Position [m]');
cla;
axes(handles.axes3);
cla;
ylabel('Acceleration [m/s^2]');
axes(handles.axes3);
xlabel('Time [s]');
set(handles.vmax, 'Value', 0);
set(handles.amax, 'Value', 0);
set(handles.jmax, 'Value', 0);
set(handles.start_point, 'Value', 0);
set(handles.stop_point, 'Value', 0);
set(handles.motion_style, 'Value', 1);

set(handles.vmax, 'String', '0');
set(handles.amax, 'String', '0');
set(handles.jmax, 'String', '0');
set(handles.start_point, 'String', '0');
set(handles.stop_point, 'String', '0');

set(handles.axes1,'Xlim', [0 1]);
set(handles.axes2,'Xlim', [0 1]);
set(handles.axes3,'Xlim', [0 1]);
set(handles.axes1,'Ylim', [0 1]);
set(handles.axes3,'Ylim', [0 1]);


% Update handles structure
guidata(hObject,handles);

