clearvars
close all
clc

%{
The inital and final position is the sum of the joint angles of
the current configuration of the SCARA robot in radians. These values can
be calculated using the built-in function CalcJointT() in RobotStudio.
Note: CalcJointT() return the joint angles of each link of the robot in
degrees.
E.g: (-79.8 + 96.7)*(pi/180) = 0.294 radians
     (-1.94 + 89.7)*(pi/180) = 1.53 radians

The start time should be 0. 
The final time should be the time that the useracquire when run the robot 
at the default velocity and acceleration.

The velocity for the robot is the maximum value of velocity that the team 
consider is optimal through the testing with the real robot. The
acceleration will be modified according to the velocity.
Note: The maximum velocity for the robot is: 2500 mm/s
      The maximum acceleration for the robot is: 43000 mm/s^2
E.g: for Velocity: 2000(mm/s) / 300mm = 6.67 rad/s
     for Acceleration: 34000(mm/s2) / 300mm = 116.7 rad/s
The conversion into rad/s need to be done case by case for the current
program. For the example, the working radius is 0.3 meters.
%}

%% Set up variables
tf = 0.245;  % cycle time in second
u0 = 0.295;  % start pos in rad - % j1 = -79.8 deg, j2 = 96.7 deg, j4 = 16.9 deg
uf = 1.53;   % end pos in rad - % j1 = -1.94 deg, j2 = 89.7 deg, j4 = 65.6 deg
udot_0 = 0;  % set 0 to make sure the start velocity is 0
udot_f = 0;  % set 0 to make sure the end velocity is 0
uddot_0 = 0; % set 0 to make sure the start acceleration is 0
uddot_f = 0; % set 0 to make sure the end acceleration is 0

%% Calculate each section of the trajectory profile

[a0, a1, a2, a3, a4, a5] = quintic(tf,u0,uf,udot_0,udot_f,uddot_0,uddot_f);

result = [a0, a1, a2, a3, a4, a5]; 
a0 = result(1);
a1 = result(2);
a2 = result(3);
a3 = result(4);
a4 = result(5);
a5 = result(6);

%% Plot the postion graph of quintic polynominal
% tf = x second, step = 0.01 second
t = 0:0.01:tf;
figure(4);
subplot(4,1,1);
u = a0 + (a3)*(t.^3) + (a4)*(t.^4) + (a5)*(t.^5);
plot(t,u,'r','LineWidth',2)
legend('Pos');
xlim([0 tf]);
xlabel('time (sec)'); 
ylabel('q(t) (rad)');
grid on
title('Position')

%% Plot the velocity graph of quintic polynominal
subplot(4,1,2);
udot = 3*(a3)*(t.^2) + 4*(a4)*(t.^3) + 5*(a5)*(t.^4);
plot(t,udot,'g','LineWidth',2)
legend('Vel');
xlim([0 tf]);
xlabel('time (sec)'); 
ylabel('dq/dt(t) (rad/s)');
grid on
title('Velocity')

%% Plot the acceleration graph of quintic polynominal
subplot(4,1,3);
uddot = 6*(a3)*(t) + 12*(a4)*(t.^2) + 20*(a5)*(t.^3);
plot(t,uddot,'b','LineWidth',2)
legend('Acc');
xlim([0 tf]);
xlabel('time (sec)'); 
ylabel('d^{2}q/dt(t) (rad/s^{2})');
grid on
title('Acceleration')

%% Plot the angular jerk graph of quintic polynominal
subplot(4,1,4);
udddot = 6*(a3) + 24*(a4)*(t) + 60*(a5)*(t.^2);
plot(t,udddot,'k','LineWidth',2)
legend('Angular Jerk');
xlim([0 tf]);
xlabel('t(sec)');
ylabel('jerk(t) (rad/s^{3})');
grid on
title('Angular Jerk')

%% Equations to calculate the quintic polynominal
function [a0, a1, a2, a3, a4, a5] = quintic(tf,u0,uf,udot_0,udot_f,uddot_0,uddot_f)
    a0 = u0;
    a1 = 0;
    a2 = 0;
    a3 = (20*uf - 20*u0 - (8*udot_f + 12*udot_0)*tf - (3*uddot_0 - uddot_f)*(tf^2))/(2*(tf^3));
    a4 = (30*u0 - 30*uf + (14*udot_f + 16*udot_0)*tf + (3*uddot_0 - 2*uddot_f)*(tf^2))/(2*(tf^4));
    a5 = (12*uf - 12*u0 - (6*udot_f + 6*udot_0)*tf - (uddot_0 - uddot_f)*(tf^2))/(2*(tf^5));
end

