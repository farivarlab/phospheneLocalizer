function p = compilePhos(p,catDim)
if ~exist('catDim','var')
    catDim = 2;
end

if ~isfield(p,'allPhos') || isempty(p.allPhos.contour)
    p.allPhos.contour = {p.curPhos.contour};
    p.allPhos.hull = {getHull(p.curPhos.contour)};
else
    switch catDim
        case 2
            addInd = 1;
            p.allPhos.contour{addInd,end+1} = p.curPhos.contour;
            p.allPhos.hull{addInd,end+1} = getHull(p.curPhos.contour);
        case 1
            addInd = find(~cellfun('isempty',p.allPhos.contour(:,end)),1,'last')+1;
            p.allPhos.contour{addInd,end} = p.curPhos.contour;
            p.allPhos.hull{addInd,end} = getHull(p.curPhos.contour);
        otherwise
            error('X')
    end
end

if ~isfield(p.allPhos,'center') || isempty(p.allPhos.center)
    p.allPhos.center = {p.curPhos.center};
else
    switch catDim
        case 2
            p.allPhos.center{addInd,end+1} = p.curPhos.center;
        case 1
            p.allPhos.center{addInd,end} = p.curPhos.center;
        otherwise
            error('X')
    end
end

% if ~isfield(p.allPhos,'probMap') || isempty(p.allPhos.probMap)
%     [p.allPhos.X,p.allPhos.Y] = meshgrid(1:p.display.fovRect(3),1:p.display.fovRect(4));
%     p.allPhos.probMap = zeros(size(p.allPhos.X));
%     [in,on] = inpolygon(p.allPhos.X,p.allPhos.Y,p.allPhos.hull{1,1}(:,1),p.allPhos.hull{1,1}(:,2));
% else
%     [in,on] = inpolygon(p.allPhos.X,p.allPhos.Y,p.allPhos.hull{addInd,end}(:,1),p.allPhos.hull{addInd,end}(:,2));
% end
% p.allPhos.probMap = p.allPhos.probMap + (in | on);


