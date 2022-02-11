function p = logNullPhos(p)

if isempty(p.allPhos.contour)
    p.allPhos.contour{1,1} = nan;
    p.allPhos.hull{1,1} = nan;
    p.allPhos.center{1,1} = nan;
else
    p.allPhos.contour{1,end+1} = nan;
    p.allPhos.hull{1,end+1} = nan;
    p.allPhos.center{1,end+1} = nan;
end
p = compilePhosProbMap(p);