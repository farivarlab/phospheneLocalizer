function drawCursor(p,theX,theY,type)

% Screen('SelectStereoDrawBuffer', p.display.myWin, 0);
switch type
    case 1
        Screen('DrawDots', p.display.myWin, [theX theY],20,p.stim.cursor.lum,[],2);
        Screen('DrawDots', p.display.myWin, [theX theY],18,p.display.black,[],2);
        Screen('DrawDots', p.display.myWin, [theX theY],2,p.stim.cursor.lum);
    case 2
        Screen('DrawDots', p.display.myWin, [theX theY],20,p.stim.cursor.lum,[]);
        Screen('DrawDots', p.display.myWin, [theX theY],18,p.display.black,[]);
        Screen('DrawDots', p.display.myWin, [theX theY],2,p.stim.cursor.lum);
end