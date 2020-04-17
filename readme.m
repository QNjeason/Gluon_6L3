%% 可以事先安装机器人工具箱网页：https://github.com/petercorke/robotics-toolbox-matlab
%% 1. 将生成的URDF文件添加到路径中.
%% 2.利用机器人工具箱建立DH参数，参考网页：https://www.universal-robots.com/articles/ur-articles/parameters-for-calculations-of-kinematics-and-dynamics/
%% 3.机器人工具箱自带UR3、5、10的DH参数例程
%% 4.利用importrobot函数导入URDF文件，做可视化显示验证
%% 5.利用smimport函数导出Simscape文件，做可视化仿真
%% 6.Simscape运动仿真，发现关节4、5、6转动方向有问题。可能在rivz验证时没注意方向。后面可以在urdf文件中做处理。
%% 7.修改URDF文件后，可以重新安装上面的步骤操作一次，保证各关节转动方向没问题。