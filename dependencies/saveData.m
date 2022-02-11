function saveData(p,partialSaveFlag)
if ~exist('partialSaveFlag','var')
    partialSaveFlag = 0;
end
fullFileName = fullfile(p.info.dataDir,p.info.fileName);
if ~partialSaveFlag
    saveas(p.fig.handle,fullFileName,'jpg')
    saveas(p.fig.handle,fullFileName,'fig')
end
p.fig = rmfield(p.fig,'handle');
save([fullFileName '.mat'],'p')


display('******************************')
display(['Data successfuly saved as: ' p.info.fileName])
display(['in: ' p.info.dataDir])
display('******************************')


