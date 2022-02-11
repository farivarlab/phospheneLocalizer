function p = removeLastPhos(p)

ind = size(p.allPhos.contour,2);
if isfield(p.allPhos,'contour')
    p.allPhos.contour(:,ind) = [];
end
if isfield(p.allPhos,'hull')
    p.allPhos.hull(:,ind) = [];
end
if isfield(p.allPhos,'center')
    p.allPhos.center(:,ind) = [];
end
if isfield(p.allPhos,'probMap')
    p.allPhos.probMap(:,ind) = [];
end


if isfield(p.curPhos,'contour')
    p.curPhos.contour = [];
end
if isfield(p.curPhos,'hull')
    p.curPhos.hull = [];
end
if isfield(p.curPhos,'center')
    p.curPhos.center = [];
end
if isfield(p.curPhos,'done')
    p.curPhos.done = 0;
end
if isfield(p.curPhos,'aborted')
    p.curPhos.aborted = 0;
end