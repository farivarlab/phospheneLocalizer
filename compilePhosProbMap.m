function p = compilePhosProbMap(p)

if ~isfield(p.allPhos,'X') || ~isfield(p.allPhos,'Y')
    [p.allPhos.X,p.allPhos.Y] = meshgrid(1:p.display.fovRect(3),1:p.display.fovRect(4));
end
ind = size(p.allPhos.contour,2);
p.allPhos.probMap{ind} = zeros(size(p.allPhos.X),'uint8');

curHull = p.allPhos.hull(~cellfun('isempty',p.allPhos.hull(:,ind)),ind);
if ~isnan(curHull{1})
    for i = 1:size(curHull,1)
        [in,on] = inpolygon(p.allPhos.X,p.allPhos.Y,curHull{i}(:,1),curHull{i}(:,2));
        p.allPhos.probMap{ind} = p.allPhos.probMap{ind} + uint8(in | on);
    end
end



