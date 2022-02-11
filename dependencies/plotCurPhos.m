function fig = plotCurPhos(p)

%% Open figure
if ~isfield(p,'fig')
    fig.handle = figure('WindowStyle','docked');
else
    figure(p.fig.handle)
end
hold on

if ~isfield(p.allPhos,'hull') || isempty(p.allPhos.hull)
    return
end
%% Plot countours
curHull = p.allPhos.hull(~cellfun('isempty',p.allPhos.hull(:,end)),end);
if ~isnan(curHull{1})
    for i = 1:length(curHull)
        if i==length(curHull)
            plot(curHull{i}(:,1),curHull{i}(:,2),':r','linewidth',2)
        else
            plot(curHull{i}(:,1),curHull{i}(:,2),':b','linewidth',2)
        end
    end
end


%% Plot phos cent
curCenter = p.allPhos.center(~cellfun('isempty',p.allPhos.center(:,end)),end);
if ~isnan(curCenter{1})
    for i = 1:length(curCenter)
        if i==length(curCenter)
            plot(curCenter{i}(1),curCenter{i}(2),'xr')
        else
            plot(curCenter{i}(1),curCenter{i}(2),'xb')
        end
    end
end

drawnow update
drawnow expose