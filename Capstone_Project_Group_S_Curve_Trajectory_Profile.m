clearvars
close all
clc

% S Curve trajectory profile 
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
jmax = 2500;   % change jmax value to match with acceleration and velocity
amax = 143;    % max acceleraton = 43 m/s2 = 143 rad/s^2
vmax = 9.3;    % max velo = 2.8 m/s = 9.8 rad/s

q0 = 0.295;    % j1 = -79.8 deg, j2 = 96.7 deg, j4 = 16.9 deg
qf = 1.53;     % j1 = -1.94 deg, j2 = 89.7 deg, j4 = 65.6 deg
dis = qf-q0;   % distance

%% Calculate each section of the S Curve Profile
T = abs(amax/jmax + vmax/amax + dis/vmax); 

t1 = amax/jmax;
t3 = vmax/amax+t1;
t2 = t3 - t1;
t4 = T - t3;
t5 = T - t2;
t6 = T - t1;

a1 = jmax;
a2 = 0;
a3 = -jmax;
a4 = 0;
a5 = -jmax;
a6 = 0;
a7 = jmax;

b1 = 0;
b2 = amax;
b3 = amax+jmax*t2;
b4 = 0;
b5 = jmax*t4;
b6 = -amax;
b7 = -amax-jmax*t6;

c1 = 0;
c2 = ((a1*t1^2)/2+b1*t1+c1) - ((a2*t1^2)/2+b2*t1);
c3 = ((a2*t2^2)/2+b2*t2+c2) - ((a3*t2^2)/2+b3*t2);
c4 = ((a3*t3^2)/2+b3*t3+c3) - ((a4*t3^2)/2+b4*t3);
c5 = ((a4*t4^2)/2+b4*t4+c4) - ((a5*t4^2)/2+b5*t4);
c6 = ((a5*t5^2)/2+b5*t5+c5) - ((a6*t5^2)/2+b6*t5);
c7 = ((a6*t6^2)/2+b6*t6+c6) - ((a7*t6^2)/2+b7*t6);

d1 = 0;
d2 = ((a1*t1^3)/6+(b1*t1^2)/2+c1*t1+d1)-((a2*t1^3)/6+(b2*t1^2)/2+c2*t1);
d3 = ((a2*t2^3)/6+(b2*t2^2)/2+c2*t2+d2)-((a3*t2^3)/6+(b3*t2^2)/2+c3*t2);
d4 = ((a3*t3^3)/6+(b3*t3^2)/2+c3*t3+d3)-((a4*t3^3)/6+(b4*t3^2)/2+c4*t3);
d5 = ((a4*t4^3)/6+(b4*t4^2)/2+c4*t4+d4)-((a5*t4^3)/6+(b5*t4^2)/2+c5*t4);
d6 = ((a5*t5^3)/6+(b5*t5^2)/2+c5*t5+d5)-((a6*t5^3)/6+(b6*t5^2)/2+c6*t5);
d7 = ((a6*t6^3)/6+(b6*t6^2)/2+c6*t6+d6)-((a7*t6^3)/6+(b7*t6^2)/2+c7*t6);

N = 100;
t = linspace(0,T,N);

ind1 = find((0<=t) & (t<=t1));
ind2 = find((t1<t) & (t<=t2));
ind3 = find((t2<t) & (t<=t3));
ind4 = find((t3<t) & (t<=t4));
ind5 = find((t4<t) & (t<=t5));
ind6 = find((t5<t) & (t<=t6));
ind7 = find((t6<t) & (t<=T));

q1 = a1*t.^3/6+b1*t.^2/2+c1*t+d1;
q2 = a2*t.^3/6+b2*t.^2/2+c2*t+d2;
q3 = a3*t.^3/6+b3*t.^2/2+c3*t+d3;
q4 = a4*t.^3/6+b4*t.^2/2+c4*t+d4;
q5 = a5*t.^3/6+b5*t.^2/2+c5*t+d5;
q6 = a6*t.^3/6+b6*t.^2/2+c6*t+d6;
q7 = a7*t.^3/6+b7*t.^2/2+c7*t+d7;
q = [q1(ind1) q2(ind2) q3(ind3) q4(ind4) q5(ind5) q6(ind6) q7(ind7)];

v1 = a1*t.^2/2+b1*t+c1;
v2 = a2*t.^2/2+b2*t+c2;
v3 = a3*t.^2/2+b3*t+c3;
v4 = a4*t.^2/2+b4*t+c4;
v5 = a5*t.^2/2+b5*t+c5;
v6 = a6*t.^2/2+b6*t+c6;
v7 = a7*t.^2/2+b7*t+c7;
v = [v1(ind1) v2(ind2) v3(ind3) v4(ind4) v5(ind5) v6(ind6) v7(ind7)];

acc1 = a1*t+b1;
acc2 = a2*t+b2;
acc3 = a3*t+b3;
acc4 = a4*t+b4;
acc5 = a5*t+b5;
acc6 = a6*t+b6;
acc7 = a7*t+b7;
acc = [acc1(ind1) acc2(ind2) acc3(ind3) acc4(ind4) acc5(ind5) acc6(ind6) acc7(ind7)];

j1 = a1*ones(1, length(t));
j2 = a2*ones(1, length(t));
j3 = a3*ones(1, length(t));
j4 = a4*ones(1, length(t));
j5 = a5*ones(1, length(t));
j6 = a6*ones(1, length(t));
j7 = a7*ones(1, length(t));
j = [j1(ind1) j2(ind2) j3(ind3) j4(ind4) j5(ind5) j6(ind6) j7(ind7)];

%% Plot the postion graph
figure(4);
subplot(4,1,1);
plot(t,q+q0,'b','LineWidth',2);
legend('Pos');
xlim([0 T]);
xlabel('time (sec)'); 
ylabel('q(t) (rad)');
grid on
title('S-Curve (7 segments)');
title('Position')

%% Plot the velocity graph
subplot(4,1,2);
plot(t,v,'g','LineWidth',2);
legend('Vel');
xlim([0 T]);
xlabel('time (sec)'); 
ylabel('dq/dt(t) (rad/s)');
grid on
title('Velocity')

%% Plot the acceleration graph
subplot(4,1,3);
plot(t,acc,'r','LineWidth',2);
legend('Acc');
xlim([0 T]);
xlabel('time (sec)'); 
ylabel('d^{2}q/dt(t) (rad/s^{2})');
grid on
title('Acceleration')

%% Plot the angular jerk graph
subplot(4,1,4);
plot(t,j,'k','LineWidth',2);
legend('Angular Jerk');
xlim([0 T]);
xlabel('t(sec)');
ylabel('jerk(t) (rad/s^{3})');
grid on
title('Angular Jerk')





