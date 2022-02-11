function p = getPhosCenter(p)
disp('***doing max brightness');
playSound(p,2);
% ShowCursor(1);

%Prepare screen
waitTillClear;

p.curPhos.done = 0;
p.curPhos.aborted = 0;
p.curPhos.center = [];

%Loop over multiple draws until a good one
while ~p.curPhos.done
    [theX,theY,buttons] = getNsetMouse(p);
%     [theX,theY,buttons] = GetMouse(p.display.myWin);
    [keyIsDown, ~, keyCode, ~] = KbCheck;
    
    drawClearBackground(p);
    drawCursor(p,theX,theY,2);
    drawCurPhos(p);
    drawCurPhosCenter(p);
    drawFixation(p);
    Screen('Flip', p.display.myWin, 0, 1);
    
    if buttons(1)
        p.curPhos.center = [];
        p = getOneDraw(p);
    else
        if keyIsDown
            if keyCode(p.keyboard.escape)
                p.abort = 1;
            end
%             p.curPhos.aborted = 1;
            break
        end
        if buttons(3) && isfield(p,'curPhos') && isfield(p.curPhos,'center') && ~isempty(p.curPhos.center)
            p.curPhos.done = 1;
            break
        end
    end
end
playSound(p,3);
waitTillClear;

end

function p = getOneDraw(p)
drawClearBackground(p);
drawFixation(p);

% Loop and track the mouse, drawing the contour
[theX,theY,~] = getNsetMouse(p);
% [theX,theY,~] = GetMouse(p.display.myWin);
p.curPhos.center = [theX theY];
waitTillClear;

drawCurPhosCenter(p);
drawCurPhos(p);
drawFixation(p);
% ShowCursor(1);
Screen('Flip', p.display.myWin);
end