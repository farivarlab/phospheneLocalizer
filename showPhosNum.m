function showPhosNum(p)

if isempty(p.allPhos.contour)
    disp('*******')
    disp('Zap #1')
    disp('*******')
else
    disp('*******')
    disp(['Zap ' '#' num2str(size(p.allPhos.contour,2)+1,'%02.0f')])
    disp('*******')
end


