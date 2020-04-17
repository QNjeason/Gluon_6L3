clear,clc,close all;
%% 建立机器人DH参数,初始姿态为竖直。
L1=Link('d',105.03,'a',0,'alpha',pi/2,'standard'); 
L2=Link('d',0,'a',-174.42,'alpha',0,'offset',-pi/2,'standard');
L3=Link('d',0,'a',-174.42,'alpha',0,'standard');
L4=Link('d',75.66,'a',0,'alpha',pi/2,'offset',-pi/2,'standard');
L5=Link('d',80.09,'a',0,'alpha',-pi/2,'standard');
L6=Link('d',44.36,'a',0,'alpha',0,'standard');  
robot=SerialLink([L1 L2 L3 L4 L5 L6],'name','Gluon_6L3', 'manufacturer','innfos')
%% 正解，给定关节角，求末端位姿
% Theta = [0 0 0 0 0 0];  %给定6个关节角度值
Theta=[30 30 30 30 30 30];
%% 验证正逆解的结果
Theta=Theta/180*pi;                         %换算成弧度
T=robot.fkine(Theta)             %求正解的齐次变换矩阵
W=[-800,+800,-800,+800,-800,+800];
robot.plot(Theta,'tilesize',150,'workspace',W);  %显示三维动画
q1=robot.ikine(T)*180/pi      %求逆解验证关节角
rpy=tr2rpy(T, 'xyz')*180/pi    %求末端姿态，工具法兰为绕XYZ轴旋转
robot.teach(T,'rpy' )              %显示roll/pitch/yaw angles，GUI可调界面