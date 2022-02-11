function drawCurPhosCenter(p)

if isfield(p,'curPhos') && isfield(p.curPhos,'center') && ~isempty(p.curPhos.center)
    dxy = [p.stim.center.size; p.stim.center.size]/2;
    xy1 = [p.curPhos.center'+dxy p.curPhos.center'-dxy];
    dxy = [p.stim.center.size; -p.stim.center.size]/2;
    xy2 = [p.curPhos.center'+dxy p.curPhos.center'-dxy];
    % xy2 = [fliplr(p.curPhos.center-p.stim.center.size/2)' p.curPhos.center'+p.stim.center.size/2];
    xy = [xy1 xy2];
    
%     Screen('SelectStereoDrawBuffer', p.display.myWin, 0);
    Screen(p.display.myWin,'DrawLines',xy,p.stim.center.width,p.stim.center.lum);
    
%     Screen('SelectStereoDrawBuffer', p.display.myWin, 1);
%     Screen(p.display.myWin,'DrawLines',xy,p.stim.center.width,p.stim.center.lum)
end