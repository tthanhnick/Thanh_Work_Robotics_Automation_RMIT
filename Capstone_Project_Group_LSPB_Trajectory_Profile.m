clearvars
close all
clc

% Linear Segments with Parabolic Blends (LSPB) 
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
% inital time and joint angle
to = 0; 
qo = 0.295; % j1 = -79.8 deg, j2 = 96.7 deg, j4 = 16.9 deg
% final time and joint angle
tf = 0.245; 
qf = 1.53; % j1 = -1.94 deg, j2 = 89.7 deg, j4 = 65.6 deg
% constant velocity and blend time
V = 6.67; % 1.5*(qf-qo)/tf

%% Calculate each section of the Trapezoidal Velocity Profile
tb = (qo - qf + V*tf)/V;

% Check that V is within limits
Vmin = (qf - qo)/tf;
if (V < Vmin || V > 2*Vmin) % if (V > Vmin || V < 2*Vmin) if V is negative
    disp(['V = ',num2str(V), ' is not within limits','(',num2str(Vmin),', ',num2str(2*Vmin),')']);
    disp('LSPB will not be correct!');
end

a(1) = qo; 
a(2) = 0; 
a(3) = V/(2*tb);
b(1) = qf - (V*tf^2)/(2*tb); 
b(2) = V*tf/tb; 
b(3) = -V/(2*tb);
 
% evaluate lspb at times for plotting
t = linspace(to, tf, 501);
q = (a(1) + a(2)*t + a(3)*t.^2).*(t<=tb) + ((qf + qo - V*tf)/2 + V*t).*((t>tb)-(t>=(tf-tb))) + (b(1) + b(2)*t + b(3)*t.^2).*(t>=(tf-tb));
qdot = (a(2) + 2*a(3)*t).*(t<=tb) + V.*((t>tb)-(t>=(tf-tb))) + (b(2) + 2*b(3)*t).*(t>=(tf-tb));
qddot = 2*a(3)*(t<=tb) + 0*((t>tb)-(t>=(tf-tb))) + 2*b(3)*(t>=(tf-tb));

%% Plot the postion graph
figure(3);
subplot(3,1,1);
plot(t,q,'b-','LineWidth',2);
legend('Pos');
xlabel('time (sec)'); 
ylabel('q(t) (rad)');
title('Trajectory using LSPB');
grid on;
title('Position')

%% Plot the velocity graph
subplot(3,1,2);
plot(t,qdot,'g-','LineWidth',2);
legend('Vel');
xlabel('time (sec)'); 
ylabel('dq/dt(t) (rad/s)');
grid on;
title('Velocity')

%% Plot the acceleration graph
subplot(3,1,3);
plot(t,qddot,'r-.','LineWidth',2);
legend('Acc');
xlabel('time (sec)'); 
ylabel('d^{2}q/dt(t) (rad/s^{2})');
grid on;
title('Acceleration')

%% Find new time value for quintic polynomial
t_new = (qf-qo)/(V/2);
disp('New t value for Quintic Polynomial:');
disp(t_new);
