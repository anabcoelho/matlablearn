function y = elliptic_filter_highpass(signal,cutoff_F,Fs)


Fstop = cutoff_F-1;       % Stopband Frequency
Fpass = cutoff_F+1;       % Passband Frequency
Astop = 80;      % Stopband Attenuation (dB)
Apass = 1;       % Passband Ripple (dB)
match = 'both';  % Band to match exactly

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.highpass(Fstop, Fpass, Astop, Apass, Fs);
Hd = design(h, 'ellip', 'MatchExactly', match);
    y=filtfilt(Hd.sosMatrix,Hd.ScaleValues,signal);
    