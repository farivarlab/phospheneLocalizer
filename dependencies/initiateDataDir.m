function p = initiateDataDir(p,filename)
if ~exist(p.info.dataDir,'dir')
    if isempty(p.info.dataDir)
        p.info.dataDir = pwd;
    else
        mkdir(p.info.dataDir)
    end
end
p.info.fileName = [p.info.subjID '_' p.info.phosID '__' datestr(now,'yyyymmdd_HHMM') '__' filename];
% if isempty(p.info.session)
%     p.info.fileName = [p.info.subjID '__' p.info.brainsightTargetName '__' datestr(now,'yyyymmdd_HHMM')];
% else
%     p.info.fileName = [p.info.subjID '__' p.info.brainsightTargetName '__' p.info.session '__' datestr(now,'yyyymmdd_HHMM')];
% end

p.info

display('******************************')
display(['Data will be saved as: ' p.info.fileName])
display(['in: ' p.info.dataDir])
display('******************************')

