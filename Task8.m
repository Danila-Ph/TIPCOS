clear all; close all; clc;
% Параметры:
%
% -Fs: частота дискретизации
% -F0       : частота ноты, формирующей аккорд
% -gain: усиление отдельных нот в аккорде
% -duration: длительность аккорда в секундах
% -alpha: ослабление в алгоритме Карплуса-Стронга

Fs = 48000;

% D2, A2, D3, F3, G3, F4, A4, C5, G5
F0 = 440*[2^-(31/12); 2^-(19/12); 2^-(16/12); 2^(-14/12); 2^-(4/12); 1; 2^(3/12); 2^(10/12)];
gain = [1.2 3.0 1.0 2.2 1.0 1.0 1.0 3.5];
duration = 4;
alpha = 0.9785;
% Количество отсчетов в аккорде
nbsample_chord = Fs*duration;
first_duration = ceil(nbsample_chord / round(Fs/F0(1)));
% Инициализация
chord = zeros(nbsample_chord, 1);
for i = 1:length(F0)
    current_M = round(Fs/F0(i));
    current_duration = ceil(nbsample_chord/current_M);
    current_alpha = alpha^(first_duration/current_duration);
    % Формирование входного и выходного сигналов алгоритма Карплуса-
    % Стронга
    x= (1/3)*rand(current_M, 1);
    y = ks_synthesis (x, current_alpha, current_duration);
    y = y(1:nbsample_chord);
    % Добавление ноты к аккорду
    chord = chord + gain(i) .* y;
end
% Проигрывание аккорда
sound(chord/1500, Fs);
audiowrite('chord1.wav',chord/1500,Fs);
subplot(3,1,1);
plot(chord/1500);
subplot(3,1,2);
plot(abs(fft(chord/1500)));
subplot(3,1,3);
plot(angle(fft(chord/1500)));