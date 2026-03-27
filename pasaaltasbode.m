clc; clear; close all;

% ==== CAMBIA AQUÍ ====
R = 1000;        
C = 100e-9;       
% =====================

% Función de transferencia (PASA-ALTAS)
num = [R*C 0];
den = [R*C 1];

sys = tf(num, den);

% Frecuencias
w = logspace(1, 6, 1000);

figure;
bode(sys, w)
grid on

% Frecuencia de corte
fc = 1/(2*pi*R*C);
hold on
xline(fc, '--r', 'fc')

title(['Filtro Pasa-Altas | fc = ' num2str(fc) ' Hz'])