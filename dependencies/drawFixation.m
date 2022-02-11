function drawFixation(p)

% Screen('SelectStereoDrawBuffer', p.display.myWin, 0);
Screen('DrawLines', p.display.myWin, p.stim.fixation.allCrossCoords,...
    p.stim.fixation.crossWidth, p.stim.fixation.lum, [p.display.xCent p.display.yCent], 0);

% Screen('SelectStereoDrawBuffer', p.display.myWin, 1);
% Screen('DrawLines', p.display.myWin, p.stim.fixation.allCrossCoords,...
%     p.stim.fixation.crossWidth, p.stim.fixation.lum, [p.display.xCent p.display.yCent], 0);

% Screen('Flip', p.display.myWin);
