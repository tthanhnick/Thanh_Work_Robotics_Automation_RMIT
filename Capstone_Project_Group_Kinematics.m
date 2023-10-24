clearvars
close all
clc

% Input the theta angles in radian
theta1 = -1.34;
theta2 = 1.57;
theta3 = 0; % theta3 is always 0 since joint 3 is a prismatic joint
theta4 = -1.34;

% syms theta1 theta2 theta3 theta4 d1 d2 d3 d4 L1 L2 L
% Parameter of IRB 920T SCARA robot in meters
d1 = 0.2405;
d2 = 0;
d3 = -0.066;
d4 = 0; 
L1 = 0.29;
L2 = 0.26;
L = 0.05; % Length of the gripper - assumption

T01 = [cos(theta1) -sin(theta1) 0 0; sin(theta1) cos(theta1) 0 0; 0 0 1 d1; 0 0 0 1];
T12 = [cos(theta2) -sin(theta2) 0 L1; sin(theta2) cos(theta2) 0 0; 0 0 1 d2; 0 0 0 1];
T23 = [1 0 0 L2; 0 1 0 0; 0 0 1 d3; 0 0 0 1];
T34 = [cos(theta4) -sin(theta4) 0 0; sin(theta4) cos(theta4) 0 0; 0 0 1 d4; 0 0 0 1];
T04 = T01*T12*T23*T34;
disp('Transformation Matrix =');
disp(T04);
% T = simplify(T04) % Function to simplify the kinematics equation with symbol

% Calculation of transformation matrix including gripper
P4 = [L; 0; 0; 1];
P0 = T04*P4;
disp('Position of the robor manipulator with the end effector =');
disp(P0);



