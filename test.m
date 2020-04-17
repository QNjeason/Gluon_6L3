clear,clc;
Gluon_6L3=importrobot('gluon_6l3_description.urdf');%导入URDF文件
showdetails(Gluon_6L3)  %显示连杆间的父子关系
show(Gluon_6L3,'Frames','off','Visuals' ,'on')  %figure显示
Gluon_6L3_SM = smimport(Gluon_6L3);