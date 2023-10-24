clearvars
close all
clc

% Input the x, y and z coordinate in m
% x = 300mm, y = -210mm, z = 175mm
x = 0.300;
y = -0.210;
z = 0.175;
phi = 0.59; % rad

% Parameter of IRB 920T SCARA robot in m
L1 = 0.290;
L2 = 0.260;
d1 = 0.2405;
d2 = 0;
d4 = 0;

c2 = ((x^2)+(y^2)-(L1^2)-(L2^2))/2*(L1*L2);
s2 = sqrt(1-(((x^2)+(y^2)-(L1^2)-(L2^2))/2*(L1*L2))^2);

% 2 scenario - pose up and pose down
theta_21 = atan2(s2, c2);
theta_22 = atan2(-s2, c2);
theta_11 = atan2((-L2*sin(theta_21))*x+(L1+L2*cos(theta_21))*y, (L2*sin(theta_21))*y+(L1+L2*cos(theta_21))*x);
theta_12 = atan2((-L2*sin(theta_22))*x+(L1+L2*cos(theta_22))*y, (L2*sin(theta_22))*y+(L1+L2*cos(theta_22))*x);
theta_41 = atan2(sin(phi),cos(phi)) - theta_11 - theta_21;
theta_42 = atan2(sin(phi),cos(phi)) - theta_12 - theta_22;
d3 = z - d1 - d2 - d4;

% The result from the CalcJointT() function in RobotStudio: j1 = -79.8 deg, j2 = 96.7 deg, j4 = 16.9 deg
fprintf('Theta_11 angle in degrees: %f',rad2deg(theta_11));
fprintf("\n");
fprintf('Theta_11 angle in radians: %f',theta_11);
fprintf("\n");
fprintf("\n");

fprintf('Theta_12 angle in degrees: %f',rad2deg(theta_12));
fprintf("\n");
fprintf('Theta_12 angle in radians: %f',theta_12);
fprintf("\n");
fprintf("\n");

fprintf('Theta_21 angle in degrees: %f',rad2deg(theta_21));
fprintf("\n");
fprintf('Theta_21 angle in radians: %f',theta_21);
fprintf("\n");
fprintf("\n");

fprintf('Theta_22 angle in degrees: %f',rad2deg(theta_22));
fprintf("\n");
fprintf('Theta_22 angle in radians: %f',theta_22);
fprintf("\n");
fprintf("\n");

fprintf('Theta_41 angle in degrees: %f',rad2deg(theta_41));
fprintf("\n");
fprintf('Theta_41 angle in radians: %f',theta_11);
fprintf("\n");
fprintf("\n");

fprintf('Theta_42 angle in degrees: %f',rad2deg(theta_42));
fprintf("\n");
fprintf('Theta_42 angle in radians: %f',theta_42);
fprintf("\n");
fprintf("\n");

fprintf('Distance d3 angle: %f',d3);
fprintf("\n");