%% General
p.info.subjID               = 'test';
p.info.phosID               = 'sess01_phos1';
p.info.viewingDistance_mm   = 475; %in mm
p.info.screenWidth_mm       = 510; % in mm
p.info.yOffset              = -3; % in mm
p.info.fov                  = [243 195]; % in mm
p.info.fovGuide             = p.info.fov+75; % in mm
p.info.dataDir              = fullfile(pwd,'data');

%% phospheneThresh.m
p.phosThreshParam.numSeen   = 4;
p.phosThreshParam.numTotal  = 6;

%% phospheneDrawing.m
p.info.numPhos              = 10;