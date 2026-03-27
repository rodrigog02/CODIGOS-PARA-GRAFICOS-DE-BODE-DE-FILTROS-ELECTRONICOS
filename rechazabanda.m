clc; clear; close all;

% ==== CAMBIA AQUÍ ====
R1 = 3300;      % pasa-altas
C1 = 100e-9;

R2 = 3300;      % pasa-bajas
C2 = 10e-9;
% =====================

% Pasa-altas
H_hp = tf([R1*C1 0],[R1*C1 1]);

% Pasa-bajas
H_lp = tf([1],[R2*C2 1]);

% Paralelo = rechaza-banda
sys = parallel(H_hp, H_lp);

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

title(['Rechaza-Banda | f1=' num2str(fc1) ' Hz, f2=' num2str(fc2) ' Hz'])