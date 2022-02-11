function p = getPhosDrawing2(p,data)
if ~exist('data','var')
    data = 1;
else
    data = 0;
end

display('***Contour');
if data
    playSound(p,1)
end

%Prepare screen
waitTillClear;
drawClearBackground(p);
drawFixation(p);
Screen('Flip', p.display.myWin);
setPointerAtCenter(p);

p.curPhos.done = 0;
p.curPhos.aborted = 0;
p.curPhos.contour = [];

% p.phos.done = 0;
% p.phos.aborted = 0;
% p.phos.cur = [];

%Loop over multiple draws until a good one
while ~p.curPhos.done
%     [theX,theY,buttons] = GetMouse(p.display.myWin);
    [theX,theY,buttons] = getNsetMouse(p);
    [keyIsDown, ~, keyCode, ~] = KbCheck;
    
    drawClearBackground(p);
    drawCursor(p,theX,theY,1);
    drawCurPhos(p);
    drawFixation(p);
    Screen('Flip', p.display.myWin, 0, 1);
    
    if buttons(1)
        p.curPhos.contour = [];
        p = getOneDraw(p);
    else
        if keyIsDown
            p.curPhos.aborted = 1;
            if keyCode(p.keyboard.escape)
                p.abort = 1;
            end
            break
        end
        if buttons(3) && size(p.curPhos.contour,1)>0 && size(unique(p.curPhos.contour,'rows'),1)>3
            p.curPhos.done = 1;
            break
        end
    end
end

% %Check for unrealistically small phosphene
% if size(p.curPhos.contour,1)<=1
%     p.curPhos.aborted = 1;
% end

waitTillClear;

function p = getOneDraw(p)
drawClearBackground(p);
drawFixation(p);

% Loop and track the mouse, drawing the contour
% [theX,theY,buttons] = GetMouse(p.display.myWin);
[theX,theY,buttons] = getNsetMouse(p);
p.curPhos.contour = [theX theY];

while buttons(1)
%     [x,y,buttons] = GetMouse(p.display.myWin);
    [x,y,buttons] = getNsetMouse(p);
    if (x ~= theX || y ~= theY)
        p.curPhos.contour = [p.curPhos.contour ; x y];
        drawClearBackground(p);
        drawCursor(p,theX,theY,1);
        drawCurPhos(p);
        drawFixation(p);
        Screen('Flip', p.display.myWin, 0, 1);
        theX = x; theY = y;
    end
end

