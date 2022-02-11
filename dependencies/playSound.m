function playSound(p,sound)

PsychPortAudio('Stop', p.audio.pahandle);

switch sound
    case 1
        PsychPortAudio('FillBuffer', p.audio.pahandle, p.audio.s1);
    case 2
        PsychPortAudio('FillBuffer', p.audio.pahandle, p.audio.s2);
    case 3
        PsychPortAudio('FillBuffer', p.audio.pahandle, p.audio.s3);
end
PsychPortAudio('Start', p.audio.pahandle, 1, 0, 1);




