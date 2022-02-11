function waitTillClear
[~,~,buttons] = GetMouse;
[keyIsDown, ~, ~, ~] = KbCheck;
while any(buttons) || keyIsDown
    [~,~,buttons] = GetMouse;
    [keyIsDown, ~, ~, ~] = KbCheck;
end
