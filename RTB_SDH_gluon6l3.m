clear,clc,close all;
%% ����������DH����,��ʼ��̬Ϊ��ֱ��
L1=Link('d',105.03,'a',0,'alpha',pi/2,'standard'); 
L2=Link('d',0,'a',-174.42,'alpha',0,'offset',-pi/2,'standard');
L3=Link('d',0,'a',-174.42,'alpha',0,'standard');
L4=Link('d',75.66,'a',0,'alpha',pi/2,'offset',-pi/2,'standard');
L5=Link('d',80.09,'a',0,'alpha',-pi/2,'standard');
L6=Link('d',44.36,'a',0,'alpha',0,'standard');  
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','Gluon_6L3', 'manufacturer','innfos')
%% ���⣬�����ؽڽǣ���ĩ��λ��
% Theta = [0 0 0 0 0 0];  %����6���ؽڽǶ�ֵ
Theta=[30 30 30 30 30 30];
%% ��֤�����Ľ��
Theta=Theta/180*pi;                         %����ɻ���
T=robot.fkine(Theta)             %���������α任����
W=[-800,+800,-800,+800,-800,+800];
robot.plot(Theta,'tilesize',150,'workspace',W);  %��ʾ��ά����
q1=robot.ikine(T)*180/pi      %�������֤�ؽڽ�
rpy=tr2rpy(T, 'xyz')*180/pi    %��ĩ����̬�����߷���Ϊ��XYZ����ת
robot.teach(T,'rpy' )              %��ʾroll/pitch/yaw angles��GUI�ɵ�����