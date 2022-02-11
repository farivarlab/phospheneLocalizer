function plotStim(p)


%Draw fix
% plot(p.display.xCent, p.display.yCent, 'k+','MarkerSize', 100)
plot([p.display.xCent-p.stim.fixation.size p.display.xCent+p.stim.fixation.size], [p.display.yCent p.display.yCent],'k','linewidth',1); hold on
plot([p.display.xCent p.display.xCent],[p.display.yCent-p.stim.fixation.size p.display.yCent+p.stim.fixation.size],'k','linewidth',1)
%Draw target
plot(p.psychoStim.target.R(:,1),p.psychoStim.target.R(:,2),'k')
plot(p.psychoStim.target.L(:,1),p.psychoStim.target.L(:,2),'k')
%Draw surround
plot(p.psychoStim.surround.R(:,1),p.psychoStim.surround.R(:,2),':k')
plot(p.psychoStim.surround.L(:,1),p.psychoStim.surround.L(:,2),':k')
