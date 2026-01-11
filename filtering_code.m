%Import the audio file
[y, fs] = audioread('voice_noisy.wav');

%Creating the time vector
time = (0:length(y)-1)/fs;

%Plot the time domain waveform
figure;
plot(time,y);
xlabel('Time');
ylabel('Amplitude');
title('Original Voice Signal - Time Domain');
grid on;

%Apply fft to convert the signal into frequency domain
N1 = length(y); %Length of the signal
D = fft(y); %Apply discrete fourier transform
F1 = fs*(0:(N1/2))/N1; %Define the frequency domain
P2 = abs(D/N1); %Two sided spectrum
P1 = P2(1:N1/2+1); %Single sided spectrum

%Plot the frequency domain waveform
figure;
plot(F1,P1); %Plot the single sided spectrum
xlabel('Frequency');
ylabel('Amplitude');
title('Original Voice Signal - Frequency Domain');
grid on;

Fn = fs/2;  % Nyquist frequency
Fstop1 = 180; % Lower stopband frequency (Hz)
Fstop2 = 1500; % Upper stopband frequency (Hz)
filterOrder = 350; % Filter order (must be even for bandstop)

% Normalize frequencies to Nyquist frequency
Wn = [Fstop1/Fn, Fstop2/Fn]; 

% Design the FIR bandstop filter using a Hamming window
b = fir1(filterOrder, Wn, 'stop',hamming(filterOrder+1));

y_filtered = filter(b, 1, y); % Apply the designed IIR filter

%Plot Filtered Signal in Time Domain
figure;
plot(time, y_filtered);
title('Filtered Voice Signal - Time Domain');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot the filtered signal's frequency response
N2 = length(y_filtered);%Length of the filtered signal.
Y_filtered_fft = fft(y_filtered); %Apply FFT to the filtered signal
P2_F = abs(Y_filtered_fft/N2); %Two-sided amplitude spectrum
P1_F = P2_F(1:N2/2+1); %Single-sided spectrum.
F2 = fs*(0:(N2/2))/N2; %Define the frequency vector

%Plot the single-sided amplitude spectrum of the filtered signal.
figure;
plot(F2,P1_F);
title('Filtered Voice Signal - Frequency Spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

%Write the filtered audio signal to a new WAV file.
audiowrite('voice_filtered.wav', y_filtered, fs);

%SNR
snr_before = snr(y); %SNR of the original signal
snr_after = snr(y_filtered); %SNR of the filtered signal
disp(['SNR Before: ', num2str(snr_before)]);
disp(['SNR After: ', num2str(snr_after)]);