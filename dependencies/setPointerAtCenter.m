function setPointerAtCenter(p)
% if ismac
% %     SetMouse(p.display.xCent, p.display.yCent);
%     SetMouse(p.display.userScreenRes(3), p.display.userScreenRes(4)/2);
% else


% SetMouse(p.display.userScreenRect(3)+theX, p.display.yOffset + theY)    
SetMouse(p.display.userScreenRect(3) + p.display.xCent, p.display.yOffset + p.display.yCent);
end
% SetMouse(p.display.userScreenRes(3)+p.display.xCent, p.display.yCent-p.display.mouseManAdjust);
