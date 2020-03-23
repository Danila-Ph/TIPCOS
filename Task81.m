clear all; close all; clc;

% F0 = 440.*[2^(-31/12); 2^(-19/12); 2^(-16/12); 2^(-14/12); 2^(-4/12); 1; 2^(3/12); 2^(10/12)];
% gain = [1.2 3.0 1.0 2.2 1.0 1.0 1.0 3.5];

F0 = [440 261.63 293.66 329.63 349.23 392 493.88 523.25];
gain = [1 1 1 1 1 1 1 1];

duration = 5;
Fs = 16000;
n = 1:(1/Fs):duration;
Note = zeros(length(F0),length(n));
chord = zeros(1,length(n));
for i = 1:length(F0)
    % Note(i) = gain(i)*sin(2*pi*F0(i).*n);
    chord = chord + gain(i)*sin(2*pi*F0(i).*n);
end
plot(n,chord);

sound(chord./length(F0),Fs);