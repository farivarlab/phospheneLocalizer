function p = waitForGo(p)

display('*****')
display('Press any key to proceed')
display('*****')

waitTillClear;
getNsetMouse(p);
[keyIsDown, ~, keyCode, ~] = KbCheck;
while ~keyIsDown
    getNsetMouse(p);
    [keyIsDown, ~, keyCode, ~] = KbCheck;
end
if keyCode(p.keyboard.escape)
    p.abort = 1;
else
    p.abort = 0;
end
waitTillClear;
