function drawAttendField(p)
% Screen('FrameRect', p.display.myWin ,p.display.white, p.display.fovRect);

% Screen('FrameRect', p.display.myWin ,p.stim.fixation.lum, p.stim.attend.cur.rect,p.stim.fixation.crossWidth);
Screen('FramePoly',p.display.myWin ,p.stim.fixation.lum,p.stim.attend.cur.poly,p.stim.fixation.crossWidth)
