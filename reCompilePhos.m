function p = reCompilePhos(p)

if ~isfield(p.allPhos,'probMap') || isempty(p.allPhos.probMap)
    [p.allPhos.X,p.allPhos.Y] = meshgrid(1:p.display.fovRect(3),1:p.display.fovRect(4));
    p.allPhos.probMap = zeros(size(p.allPhos.X));
end


for i = 1:size(p.allPhos.contour,2)
    switch p.allPhos.flag{i}
        case 'good'
            p.allPhos.contour
        case 'bad'
        otherwise
            error('X')
    end
end

if 1
    [in,on] = inpolygon(p.allPhos.X,p.allPhos.Y,p.allPhos.hull{1,1}(:,1),p.allPhos.hull{1,1}(:,2));
else
    [in,on] = inpolygon(p.allPhos.X,p.allPhos.Y,p.allPhos.hull{addInd,end}(:,1),p.allPhos.hull{addInd,end}(:,2));
end
p.allPhos.probMap = p.allPhos.probMap + (in | on);


