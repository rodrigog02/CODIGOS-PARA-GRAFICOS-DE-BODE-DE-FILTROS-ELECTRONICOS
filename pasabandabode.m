clc; clear; close all;

% ==== CAMBIA AQUÍ ====
R1 = 3300;      % pasa-altas
C1 = 100e-9;

R2 = 3300;      % pasa-bajas
C2 = 10e-9;
% =====================

% Pasa-altas
num1 = [R1*C1 0];
den1 = [R1*C1 1];
H1 = tf(num1, den1);

% Pasa-bajas
num2 = [1];
den2 = [R2*C2 1];
H2 = tf(num2, den2);

% Cascada = pasa-banda
sys = series(H1, H2);

% Frecuencias
w = logspace(1, 6, 1000);

figure;
bode(sys, w)
grid on

% Frecuencias de corte
fc1 = 1/(2*pi*R1*C1);
fc2 = 1/(2*pi*R2*C2);

hold on
xline(fc1, '--r', 'f1')
xline(fc2, '--g', 'f2')

title(['Pasa-Banda | f1=' num2str(fc1) ' Hz, f2=' num2str(fc2) ' Hz'])