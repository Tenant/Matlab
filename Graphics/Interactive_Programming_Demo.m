% Interactive Programming
% ����ʽ���
%% getpts
% Specify points with mouse
% [x, y] = getpts

%% uigetfile
[fileName,pathName] = uigetfile('*.*','Please select an image');
if(fileName)  
    fileName = strcat(pathName,fileName);  
    fileName = lower(fileName);
else   
    J = 0;%��¼�����������ָ�õ�������  
    msgbox('Please select an image');  
    return; %�˳�����  
end
