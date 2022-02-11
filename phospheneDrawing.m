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


disp('Press any button to start'); while ~KbCheck; end; while KbCheck; end
playSound(p,3)
% p = setAttendedField(p);
showPhosNum(p)
while ~done
    setPointerAtCenter(p);
    
    [keyIsDown, ~, keyCode, ~] = KbCheck;
    [theX,theY,buttons] = getNsetMouse(p);
    
    if any(buttons)
        if buttons(1)
            playSound(p,1)
            disp('No')
            p = logNullPhos(p);
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
                    disp('Phos discarded')
            end
            playSound(p,3)
            
            
%             p = setAttendedField(p);
showPhosNum(p)
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
            saveData(p)
            playSound(p,3)
            
%             p = setAttendedField(p);
showPhosNum(p)
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



