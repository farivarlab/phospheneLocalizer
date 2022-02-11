function display = initiatePTB(p)
display.stereo = 0;

sca


KbName('UnifyKeyNames');
Screen('Preference', 'SkipSyncTests', 1);


display.whichScreen = max(Screen('Screens'));
display.userScreen = min(Screen('Screens'));
PsychImaging('PrepareConfiguration');

if display.stereo
    [display.myWin, display.winRect] = PsychImaging('OpenWindow', display.whichScreen, 0, [], [], [], 4);
else
    [display.myWin, display.winRect] = PsychImaging('OpenWindow', display.whichScreen, 0, [], [], [], []);
end

% if ismac
%     PsychImaging('AddTask', 'General', 'SideBySideCompressedStereo');
%     [display.myWin, display.winRect] = PsychImaging('OpenWindow', display.whichScreen, 0, [], [], [], 4);
% %     SetCompressedStereoSideBySideParameters(myWin, [0, 0], [0.5, 1], [0.5, 0], [0.5, 1]);
% else
    %     PsychImaging('AddTask', 'General', 'SideBySideCompressedStereo');
%     [display.myWin, display.winRect] = PsychImaging('OpenWindow', display.whichScreen, 0, [], [], [], 4);
    
    
    %     SetCompressedStereoSideBySideParameters(myWin, [0, 0], [0.5, 1], [0.5, 0], [0.5, 1]);
% end

display.white = WhiteIndex(display.myWin);
display.black = BlackIndex(display.myWin);
display.grey = display.white / 2;
display.xCent = display.winRect(3)/2;
display.yCent = display.winRect(4)/2;
display.yCent = display.yCent + round(p.info.yOffset/p.info.screenWidth_mm*display.winRect(3));

% display.userScreenRes = Screen(display.userScreen, 'rect'); % Resolution of user's screen
% if IsWindows
%     display.windowsExtDispDiff = display.userScreenRes - display.winRect;
% elseif ismac
%     error
% else
%     error
% end

% % Henry's laptop
% display.userScreenRect = [0 0 1440 900]; % laptop screen resolution
% display.stimScreenRect = [0 0 1920 1080]; % secondary monitor resolution
% display.yOffset = 0; %-30 adjustment in fixation. Find manually 

% fMRI laptop
tmp = get(groot,'Screensize');
display.userScreenRect = [0 0 tmp(3:4)]; % laptop screen resolution
display.stimScreenRect = display.winRect; % secondary monitor resolution
% display.stimScreenRect = [0 0 1920 1080]; % secondary monitor resolution
% display.stimScreenRect = [0 0 2048 1152]; % secondary monitor resolution
display.yOffset = 0; %-30 adjustment in fixation. Find manually

% tmp = get(0,'MonitorPosition')


%% FOV
display.fovRect = [0 0 round(p.info.fov./p.info.screenWidth_mm.*display.winRect(3))];
display.fovRect = CenterRectOnPoint(display.fovRect,display.xCent,display.yCent);

display.fovGuideRect = [0 0 round(p.info.fovGuide./p.info.screenWidth_mm.*display.winRect(3))];
display.fovGuideRect = CenterRectOnPoint(display.fovGuideRect,display.xCent,display.yCent);


% %% Offscreen window for the fov (actually replace the main win with the offscreen window)
% display.myWin_main = display.myWin;
% display.winRect_main = display.winRect;
% 
% 
% 
% 
% % p.info.screenWidth_mm/display.winRect_main(3) * (1533 - 556)
% % p.info.screenWidth_mm/display.winRect_main(3) * (942 - 194)
% % 
% % p.info.screenWidth_mm       = 510; % in mm
% % p.info.fov                  = [300 250]; %556 to 1533 in x and 197 to 942 in y
% tmpRect = [0 0 round((display.winRect_main(3)/p.info.screenWidth_mm) .* p.info.fov)];
% % tmpRect = CenterRectOnPoint(tmpRect,display.xCent,display.yCent);
% 
% [display.myWin,display.winRect]=Screen('OpenOffscreenWindow',display.myWin_main, 0, tmpRect, [], [], []);
% Screen('FillRect',display.myWin,100)
% 
% % Screen('DrawTexture',display.myWin_main,display.myWin)
% % Screen('Flip',display.myWin_main);
% % Screen('FillRect',display.myWin,100)




Screen('Flip', display.myWin);


