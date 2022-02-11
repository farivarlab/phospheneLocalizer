function abort = waitForZap(p)
display('*****')
display('Ready to zap !!')
display('*****')
playSound(p,3)

% setPointer(p,'out')
waitTillClear;
[~,~,buttons] = getNsetMouse(p);
[keyIsDown, ~, keyCode, ~] = KbCheck;
go = 0;
abort = 0;
while ~go && ~abort
    [~,~,buttons] = getNsetMouse(p);
    [keyIsDown, ~, keyCode, ~] = KbCheck;
    if any(buttons)
        go = 1;
    end
    if keyIsDown && keyCode(p.keyboard.escape)
        abort = 1;
    end
end
waitTillClear;
