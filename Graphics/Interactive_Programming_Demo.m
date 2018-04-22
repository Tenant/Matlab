% Interactive Programming
% 交互式编程
%% getpts
% Specify points with mouse
% [x, y] = getpts

%% uigetfile
[fileName,pathName] = uigetfile('*.*','Please select an image');
if(fileName)  
    fileName = strcat(pathName,fileName);  
    fileName = lower(fileName);
else   
    J = 0;%记录区域生长所分割得到的区域  
    msgbox('Please select an image');  
    return; %退出程序  
end
