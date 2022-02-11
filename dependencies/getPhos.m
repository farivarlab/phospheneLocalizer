function p = getPhos(p)

plotPhos(p)
p = getPhosDrawing(p);
if ~p.curPhos.aborted
    p = getPhosCenter(p);
end
if ~p.curPhos.aborted
    p = compilePhos(p,2);
    plotCurPhos(p)
end
drawClearBackground(p);
drawFixation(p);
Screen('Flip', p.display.myWin);


done = 0;
while ~done
    
    disp('another drawing? (y or n)')
    [~, ~, keyCode, ~] = KbCheck;
    while ~keyCode([KbName('y') KbName('n')])
        [~, ~, keyCode, ~] = KbCheck;
    end
    switch find(keyCode([KbName('y') KbName('n')]))
        case 1
            playSound(p,3)
            p = getPhosDrawing(p);
            if ~p.curPhos.aborted
                p = getPhosCenter(p);
            end
            if ~p.curPhos.aborted
                p = compilePhos(p,1);
                plotCurPhos(p)
            end
            drawClearBackground(p);
            drawFixation(p);
            Screen('Flip', p.display.myWin);

        case 2
            p = compilePhosProbMap(p);
            done = 1;
        otherwise
            disp('invalid response')
    end
    waitTillClear
end

disp('discard this phosphene (y or n)')
[~, ~, keyCode, ~] = KbCheck;
while ~keyCode([KbName('y') KbName('n')])
    [~, ~, keyCode, ~] = KbCheck;
end
switch find(keyCode([KbName('y') KbName('n')]))
    case 2
        disp('Phos logged')
    case 1
        p = removeLastPhos(p);
        plotPhos(p)
        plotCurPhos(p)
        disp('Phos discarded')
%         p = reCompilePhos(p);
end


drawClearBackground(p);
drawFixation(p);
Screen('Flip', p.display.myWin);
waitTillClear