function y = Elliptic_lowpass(signal,cutoff,Fs)
%ELLIPTIC_LOWPASS Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.0 and the DSP System Toolbox 9.2.
% Generated on: 08-Aug-2016 17:42:00

% Elliptic Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.

N     = 10;  % Order
Fpass = cutoff;  % Passband Frequency
Apass = 1;   % Passband Ripple (dB)
Astop = 80;  % Stopband Attenuation (dB)

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.lowpass('N,Fp,Ap,Ast', N, Fpass, Apass, Astop, Fs);
Hd = design(h, 'ellip');
sz=size(signal);
y=zeros(sz);
for i=1:sz(1)
    y(i,:)=filtfilt(Hd.sosMatrix,Hd.ScaleValues,signal(i,:));
end
% [EOF]
