function drawCurPhos(p)

if isfield(p,'curPhos') && isfield(p,'curPhos') && (size(p.curPhos.contour,1)>2)
    xy = zeros(size(p.curPhos.contour).*[2 1]-[2 0]);
    xy(1:2:end,:) = p.curPhos.contour(1:end-1,:);
    xy(2:2:end,:) = p.curPhos.contour(2:end,:);
    xy = xy';
    
    
%     Screen('SelectStereoDrawBuffer', p.display.myWin, 0);
    Screen(p.display.myWin,'DrawLines',xy,[],p.stim.countour.lum);
    
%     Screen('SelectStereoDrawBuffer', p.display.myWin, 1);
%     Screen(p.display.myWin,'DrawLines',xy,[],p.stim.countour.lum);
end
% Screen('Flip', p.display.myWin);