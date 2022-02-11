commandwindow
clear all
close all
addpath(fullfile(pwd,'dependencies'))


%% Get subject info
setParam
p = initiateDataDir(p,mfilename);

%% Initiate PTB window
p.display = initiatePTB(p);


%% Initiate sound
p = initiateSound(p);

%% Initiate keyboard
p.keyboard.escape = KbName('ESCAPE');

%% Initiate stim
p = initiateStimParam(p,1);

%% Initiate psychophysical param (for display purposes)
p = initiatePsychoStimParam(p);

%% Initiate figure
p.fig = plotPhos(p);

%% Initiate phos
p = clearPhos(p);




waitTillClear;
[theX,theY,buttons] = getNsetMouse(p);
% [~,~,buttons] = GetMouse(p.display.myWin);
[keyIsDown, ~, keyCode, ~] = KbCheck;
done = 0;
HideCursor;

disp('*******')
disp(['Zap ' '#' num2str(size(p.allPhos.contour,2)+1,'%02.0f')])
disp('*******')
while ~done
    setPointerAtCenter(p);
    
    [keyIsDown, ~, keyCode, ~] = KbCheck;
    [theX,theY,buttons] = getNsetMouse(p);
%     [tmpx,tmpy,buttons] = GetMouse(p.display.myWin);
    
    if any(buttons)
        if buttons(1)
            playSound(p,1)
            disp('No')
        elseif buttons(2)
            playSound(p,2)
            disp('Maybe')
        elseif buttons(3)
            playSound(p,3)
            disp('Yes')
            % Record phos
            p = getPhos(p);
            plotPhos(p)
            plotCurPhos(p)
            playSound(p,3)
            disp('*******')
            disp(['Zap ' '#' num2str(size(p.allPhos.contour,2)+1,'%02.0f')])
            disp('*******')
        end
        waitTillClear;
    end
    
    if keyCode(p.keyboard.escape)
        done = 1;
    end
end



%% Save data and exit
endSignal(p)
ShowCursor;
sca
saveData(p)
SetMouse(p.display.userScreenRect(3)/2, p.display.userScreenRect(4)/2);
ShowCursor;



