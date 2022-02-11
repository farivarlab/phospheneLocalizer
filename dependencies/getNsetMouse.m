function [theX,theY,buttons] = getNsetMouse(p)

[theX,theY,buttons] = GetMouse(p.display.myWin);

flag = 0;
if theX < (p.display.fovRect(1)+2)
    theX = p.display.fovRect(1)+2;
    flag = 1;
end
if theX > (p.display.fovRect(3)-2)
    theX = p.display.fovRect(3)-2;
    flag = 1;
end
if theY < (p.display.fovRect(2)+2)
    theY = p.display.fovRect(2)+2;
    flag = 1;
end
if theY > (p.display.fovRect(4)-2)
    theY = p.display.fovRect(4)-2;
    flag = 1;
end

if flag
    SetMouse(p.display.userScreenRect(3)+theX, p.display.yOffset + theY)
    
%     SetMouse(p.display.userScreenRes(3)+theX, theY-p.display.mouseManAdjust);
    
%     if p.display.stereo
%         SetMouse(theX, theY,p.display.myWin);
%         SetMouse(p.display.userScreenRes(3)+theX, theY);
        
        
        
%     else
%         SetMouse(theX, theY,p.display.myWin);
%     end


%     HideCursor;
end

if ismac
    buttons = buttons([1 3 2]);
end