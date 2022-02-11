function p = setAttendedField(p)

if isempty(p.allPhos.contour)
    p.allPhos.attendedField = {'L'};
    disp('*******')
    disp(['Attend ' p.allPhos.attendedField{end}])
    numPhos = sum(ismember(p.allPhos.attendedField,p.allPhos.attendedField(end)));
    disp(['Zap ' '#' num2str(size(p.allPhos.contour,2)+1,'%02.0f')])
    disp('*******')
else
    ind = size(p.allPhos.contour,2)+1;
    switch p.allPhos.attendedField{ind-1}
        case 'L'
            p.allPhos.attendedField(ind) = {'R'};
        case 'R'
            p.allPhos.attendedField(ind) = {'L'};
    end
    disp('*******')
    disp(['Attend ' p.allPhos.attendedField{end}])
    numPhos = sum(ismember(p.allPhos.attendedField,p.allPhos.attendedField(end)));
    disp(['Zap ' '#' num2str(numPhos,'%02.0f')])
    disp('*******')
end
p.stim.attend.cur = p.stim.attend.(p.allPhos.attendedField{end});


for i = 1:3
    drawClearBackground(p);
    drawFixation(p);
    drawAttendField(p);
    Screen('Flip', p.display.myWin);
    WaitSecs(0.2);
    drawClearBackground(p);
    drawFixation(p);
    Screen('Flip', p.display.myWin);
    WaitSecs(0.2);
end


waitTillClear


