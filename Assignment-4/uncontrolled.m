clc; clear all;
import runge.*
import limiter.*

% System Parameters
dt = 0.01;
tend = 1;
t0 = 0;
x0 = [0; 0];
U = [100; 0];

% State Space Model
A = [-4, 3; 1, -8];
B = [1, 0; 0, 1];
C = [0, 1];
D = [0];

% Initial Conditions
k = 1;
t = t0:dt:tend;
N = length(t);
x = zeros(2, N);

% System Simulation with Runge-Kutta method
for i = 1:N
    x(:,i) = runge(A, B, U, x0, dt);
    x0 = x(:,i);
end

% Çıktı y(t)
y = C * x;

% Plots
figure;
subplot(211);
plot(t, x(1,:), t, x(2,:));
xlabel('time (s)');
ylabel('x(t)');
legend('x_1(t)', 'x_2(t)');
grid on;

subplot(212);
plot(t, y);
xlabel('time (s)');
ylabel('y(t)');
grid on;