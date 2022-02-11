commandwindow
clear all
close all
addpath(fullfile(pwd,'dependencies'))

setParam
numSeen = p.phosThreshParam.numSeen;
numTotal = p.phosThreshParam.numTotal;


%% Initiate PTB window
p.display = initiatePTB(p);

% p.display.mouseManAdjust = 30;

%% Initiate sound
p = initiateSound(p);

%% Initiate keyboard
p.keyboard.escape = KbName('ESCAPE');

%% Initiate stim
p = initiateStimParam(p,0);

% %% Initiate figure
% p.fig = plotPhos(p);
% 
% %% Initiate phos
% p = clearPhos(p);




waitTillClear;
[~,~,buttons] = getNsetMouse(p);
[keyIsDown, ~, keyCode, ~] = KbCheck;
HideCursor;
done = 0;
countSeen = 0;
countNotSeen = 0;
while ~done
    setPointerAtCenter(p);
    
    [keyIsDown, ~, keyCode, ~] = KbCheck;
    [~,~,buttons] = getNsetMouse(p);
    
    if any(buttons([1 3]))
        if buttons(1)
            countNotSeen = countNotSeen+1;
            if (numTotal-countNotSeen)<numSeen
                display([num2str(countSeen) '/' num2str(countSeen+countNotSeen)])
%                 done = 1;
                countSeen = 0;
                countNotSeen = 0;
                display('current power is at threshold')
                playSound(p,3); WaitSecs(0.2);playSound(p,3); WaitSecs(0.2);playSound(p,3); WaitSecs(0.2);
            else
                display([num2str(countSeen) '/' num2str(countSeen+countNotSeen)])
                playSound(p,1)
            end
        elseif buttons(3)
            countSeen = countSeen+1;
            if numSeen==countSeen
                playSound(p,2); WaitSecs(0.2);playSound(p,2); WaitSecs(0.2);playSound(p,2); WaitSecs(0.2);
                display([num2str(countSeen) '/' num2str(countSeen+countNotSeen)])
                display('lower power')
                countSeen = 0;
                countNotSeen = 0;
            else
                playSound(p,3)
                display([num2str(countSeen) '/' num2str(countSeen+countNotSeen)])
            end
        end
        waitTillClear;
    end
    
    if keyIsDown
        if keyCode(p.keyboard.escape)
            done = 1;
        else
            countSeen = 0;
            countNotSeen = 0;
            display('count reset')
        end
        waitTillClear;
    end
end
p.phosThresh = input(['Last power seeing ' num2str(p.phosThreshParam.numSeen) '/' num2str(num2str(p.phosThreshParam.numTotal)) ':']);
endSignal(p)
ShowCursor;
sca
SetMouse(p.display.userScreenRect(3)/2, p.display.userScreenRect(4)/2);
ShowCursor;

%save data
p = initiateDataDir(p,mfilename);
save(fullfile(p.info.dataDir,p.info.fileName),'p');


