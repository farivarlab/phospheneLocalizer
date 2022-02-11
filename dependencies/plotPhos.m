function fig = plotPhos(p)

%% Open figure
if ~isfield(p,'fig')
    fig.handle = figure('WindowStyle','docked');
else
    figure(p.fig.handle)
end
hold off



%% Plot phos
if isfield(p,'allPhos') && isfield(p.allPhos,'contour') && ~isempty(p.allPhos.contour) && ~isempty(p.allPhos.contour{1})
%     if ~isfield(p.allPhos,'probMap')
%         [X,Y] = meshgrid(1:p.display.winRect(3),1:p.display.winRect(4));
%         p.allPhos.probMap = zeros(size(X));
%         for i = 1:length(p.allPhos.contour)
%             [in,on] = inpolygon(X,Y,p.allPhos.hull{i}(:,1),p.allPhos.hull{i}(:,2));
%             p.allPhos.probMap = p.allPhos.probMap + (in | on);
%         end
%     end
    
    if isfield(p.allPhos,'probMap') && ~isempty(p.allPhos.probMap)
        for i = 1:size(p.allPhos.probMap,2)
            if i==1
                probMap = p.allPhos.probMap{i};
            else
                probMap = probMap + p.allPhos.probMap{i};
            end
        end
        
        if size(p.allPhos.contour,2)==1; cLim = [0 size(p.allPhos.contour,2)]; else; cLim = [1 size(p.allPhos.contour,2)]; end
        imagesc(probMap,'AlphaData',probMap~=0,cLim); colorbar
        hold on
    end
    
% %     %Plot all countour
% %     for i = 1:length(p.allPhos.contour)
% %         plot(p.allPhos.hull{i}(:,1),p.allPhos.hull{i}(:,2),'b')
% %     end
%     %Plot current contour
%     if ~isempty(p.curPhos.contour)
%         plot(p.curPhos.contour(:,1),p.curPhos.contour(:,2),'r')
%     end
else
    colorbar;
end

% %% Plot phos cent
% if isfield(p,'allPhos') && isfield(p.allPhos,'center') && ~isempty(p.allPhos.center)&& ~isempty(p.allPhos.center{1})
% %     %Plot all phos
% %     for i = 1:length(p.allPhos.center)
% %         plot(p.allPhos.center{i}(1),p.allPhos.center{i}(2),'xb')
% %     end
%     %Plot current phos
%     if ~isempty(p.curPhos.center)
%         plot(p.curPhos.center(1),p.curPhos.center(2),'xr')
%     end
% end


%% Plot psychophysics stimulus landmarks
plotStim(p)


%% Adjust plot to fov
xlim(p.display.fovRect([1 3]))
ylim(p.display.fovRect([2 4]))
set(gca,'Ydir','reverse')
drawnow update
drawnow expose