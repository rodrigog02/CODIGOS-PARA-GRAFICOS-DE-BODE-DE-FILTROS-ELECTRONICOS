clc; clear; close all;

% ==== CAMBIA AQUÍ ====
R = 1000;        % ohms
C = 100e-9;       % faradios
% =====================

% Función de transferencia
num = [1];
den = [R*C 1];

sys = tf(num, den);

% Frecuencias personalizadas
w = logspace(1, 6, 1000);

figure;
bode(sys, w)
grid on

% Frecuencia de corte
fc = 1/(2*pi*R*C);
hold on
xline(fc, '--r', 'fc')
title(['Filtro Pasa-Bajas | fc = ' num2str(fc) ' Hz'])