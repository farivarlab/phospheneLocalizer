function p = initiateSound(p)

InitializePsychSound;

% sound init
nrchannels=1;
repetitions=1;
freq=48000;
p.audio.pahandle = PsychPortAudio('Open', [], [], 1, freq, nrchannels);

% Fill the audio playback buffer with the audio data 'wavedata':    
soundDur = 0.1;    
t = 0:1/freq:soundDur; % seconds
ampMod = sin(linspace(0,pi,length(t)));

f = 329,63; % Hz
p.audio.s1 = sin(2.*pi.*f.*t).*ampMod;

f = 440; % Hz
p.audio.s2 = sin(2.*pi.*f.*t).*ampMod;

f = 554.37; % Hz
p.audio.s3 = sin(2.*pi.*f.*t).*ampMod;



PsychPortAudio('FillBuffer', p.audio.pahandle, p.audio.s1);
PsychPortAudio('Start', p.audio.pahandle, repetitions, 0, 1);
WaitSecs(0.2);
playSound(p,2);
WaitSecs(0.2);
playSound(p,3);
WaitSecs(0.2);
playSound(p,2);
WaitSecs(0.2);
playSound(p,1);
