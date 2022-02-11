function p = clearPhos(p)
% if isfield(p,'curPhos')
%     p = rmfield(p,'curPhos');
    p.curPhos.contour = {};
    p.curPhos.hull = {};
    p.curPhos.center = {};
% end

% if isfield(p,'allPhos')
%     p = rmfield(p,'allPhos');
    p.allPhos.contour = {};
    p.allPhos.hull = {};
    p.allPhos.center = {};
% end
