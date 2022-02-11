function p = initiateStimParam(p,outlineFlag)

%% Fixation cross
p.stim.fixation.size = 10; % in pixels
p.stim.fixation.crossWidth = 2; % in pixels
p.stim.fixation.xCoord = [-p.stim.fixation.size, p.stim.fixation.size 0 0];
p.stim.fixation.yCoord = [0 0 -p.stim.fixation.size p.stim.fixation.size];
p.stim.fixation.allCrossCoords = [p.stim.fixation.xCoord; p.stim.fixation.yCoord];
p.stim.fixation.lum = p.display.grey/5;%p.display.grey/6;

%% Phosphene cursor
p.stim.cursor.lum = p.display.grey/2.5;

%% Phosphene center marker
p.stim.center.size = 20;
p.stim.center.width = 4;
p.stim.center.lum = p.display.grey/2.5;

%% Phosphene contour
p.stim.countour.lum = p.display.grey/2.5;

%% Attention field
%full quadrant
curRect = p.display.fovRect;
curRect(2) = p.display.yCent;
curRect(3) = p.display.xCent;
p.stim.attend.L.rect = curRect;
curRect = p.display.fovRect;
curRect(1) = p.display.xCent;
curRect(2) = p.display.yCent;
p.stim.attend.R.rect = curRect;

%stimulus field
pX = initiatePsychoStimParam(p,1.05);
surround = pX.psychoStim.surround; clear pX
curPoly = surround.L;
p.stim.attend.L.poly = curPoly;
curPoly = surround.R;
p.stim.attend.R.poly = curPoly;
% figure('WindowStyle','docked')
% scatter(curPoly(:,1),curPoly(:,2))


%% Draw it
drawClearBackground(p);
drawFixation(p);
if outlineFlag
    drawOutline(p);
end
% flipWin(p)
Screen('Flip', p.display.myWin);

