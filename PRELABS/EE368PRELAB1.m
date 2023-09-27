norm_freq = linspace(0,10,100);

% Compute the values of the COMPLEX frequency response at these frequencies 
Hw = (j .* norm_freq) ./ (1 - norm_freq.^2 + j .* 3 .* norm_freq);
% Plot the magnitude and phase responses on a linear freq scale
figure(1)
% Magnitude Response
subplot(2,1,1)
plot(norm_freq, abs(Hw))
grid
xlabel('Normalized Frequency w/wO')
ylabel('Magnitude Response')
title('Frequency Response of Filter')
% Phase Response
subplot(2,1,2)
plot(norm_freq, angle(Hw)./pi); % Normalize by pi radians
grid
xlabel('Normalized Frequency w/wO')
ylabel('Phase Response /pi')

% LOG SCALE FREQUENCY RESPONSE PLOT
% Make a logarithmic normalized frequency variable with 100 points for w/wO=.1-10
log_norm_freq=logspace(-1, 1, 100); % 100 logarithmic points between .1 (10e-1) and 10 (10e+1)

% Compute the values Of the COMPLEX frequency response at these frequencies 
Hw1=(j .* log_norm_freq) ./ (1 - log_norm_freq.^2 + j .* 3 .* log_norm_freq);

figure(2)

% Magnitude Response
subplot(2,1,1)
semilogx(log_norm_freq, abs(Hw1)); % plot linear magnitude
grid
xlabel('Normalized Frequency w/wO')
ylabel('Magnitude Response')
title('Frequency Response of Filter')
% Phase Response
subplot(2,1,2)
semilogx(log_norm_freq, angle(Hw1)./pi); 
grid
xlabel('Normalized Frequency w/wO')
ylabel('Phase Response /pi')

% PLOT MAGNITUDE IN dB (like Bode Plot)
% copy, paste, modify
figure(3)
% Magnitude Response
subplot(2,1,1)
% Change: semilogx(log_norm_freq, abs(Hw1)) to:
semilogx(log_norm_freq, 20. *log10(abs(Hw1))); % plot magnitude in dB
grid
xlabel('Normalized Frequency W/WO')
ylabel('Magnitude Response (-dB)')
title('Frequency Response of Filter')
% Phase Response
subplot(2,1,2)
semilogx(log_norm_freq, angle(Hw1).*(180/pi))
grid
xlabel('Normalized Frequency w/wO')
ylabel('Phase Response (Degrees)')
% Find the peak response and peak response frequency
% WHICH RESPONSE AND FREQUENCY VARIABLES TO USE?? WHY??
% DECREASE THE SAMPLE SPACING??
[peak_response, peak_response_index]=max(abs(Hw1))
% No so answers print to screen
peak_response_freq=log_norm_freq(peak_response_index)
% notes: COPY FIGURES TO A WORD DOCUMENT WHEN DONE
% HOW COULD WE HAVE MADE Hw INTO A FUNCTION SO NOT REPEATING EQUATION?