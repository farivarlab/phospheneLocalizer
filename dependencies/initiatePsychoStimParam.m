function p = initiatePsychoStimParam(p,mag)
if ~exist('mag','var')
    mag = 1;
end
%% Target
target_ecc_deg = 1.81;
if isfield(p.info,'viewingDistance_mm')
    target_ecc_mm = tand(target_ecc_deg)*p.info.viewingDistance_mm;
else
    warning('using default viewing distance of 475mm')
    target_ecc_mm = tand(target_ecc_deg)*475;
end
if isfield(p.info,'screenWidth_mm')
    target_ecc_pix = target_ecc_mm*p.display.stimScreenRect(3)/p.info.screenWidth_mm;
else
    warning('using default screen width of 510mm')
    target_ecc_pix = target_ecc_mm*p.display.stimScreenRect(3)/510;
end
target_x_pix = target_ecc_pix/sqrt(2);
target_y_pix = target_ecc_pix/sqrt(2);

target_diam_deg = 1.51;
if isfield(p.info,'viewingDistance_mm')
    target_diam_mm = tand(target_diam_deg)*p.info.viewingDistance_mm;
else
    warning('using default viewing distance of 475mm')
    target_diam_mm = tand(target_diam_deg)*475;
end
if isfield(p.info,'screenWidth_mm')
    target_diam_pix = target_diam_mm*p.display.stimScreenRect(3)/p.info.screenWidth_mm;
else
    warning('using default screen width of 510mm')
    target_diam_pix = target_diam_mm*p.display.stimScreenRect(3)/510;
end
[xunit, yunit] = makeCircle(p.display.stimScreenRect(3)/2 + target_x_pix,p.display.stimScreenRect(4)/2 + target_y_pix,target_diam_pix/2);
p.psychoStim.target.R = [xunit;yunit]';
[xunit, yunit] = makeCircle(p.display.stimScreenRect(3)/2 - target_x_pix,p.display.stimScreenRect(4)/2 + target_y_pix,target_diam_pix/2);
p.psychoStim.target.L = [xunit;yunit]';


%% Surround
surround_diam_deg = 9.78*mag;
if isfield(p.info,'viewingDistance_mm')
    surround_diam_mm = tand(surround_diam_deg)*p.info.viewingDistance_mm;
else
    warning('using default viewing distance of 475mm')
    surround_diam_mm = tand(surround_diam_deg)*475;
end
if isfield(p.info,'screenWidth_mm')
    surround_diam_pix = surround_diam_mm*p.display.stimScreenRect(3)/p.info.screenWidth_mm;
else
    warning('using default screen width of 510mm')
    surround_diam_pix = surround_diam_mm*p.display.stimScreenRect(3)/510;
end

[xunit, yunit] = makeCircle(p.display.stimScreenRect(3)/2 + target_x_pix,p.display.stimScreenRect(4)/2 + target_x_pix,surround_diam_pix/2);
ind = xunit<p.display.stimScreenRect(3)/2;
xunit(ind) = [];
yunit(ind) = [];
% ind = yunit<p.display.stimScreenRect(4)/2;
% xunit(ind) = [];
% yunit(ind) = [];
p.psychoStim.surround.R = [xunit;yunit]';

[xunit, yunit] = makeCircle(p.display.stimScreenRect(3)/2 - target_x_pix,p.display.stimScreenRect(4)/2 + target_x_pix,surround_diam_pix/2);
ind = xunit>p.display.stimScreenRect(3)/2;
xunit(ind) = [];
yunit(ind) = [];
% ind = yunit<p.display.stimScreenRect(4)/2;
% xunit(ind) = [];
% yunit(ind) = [];
p.psychoStim.surround.L = [xunit;yunit]';
% p.psychoStim.surround.L = [circshift(xunit,[round(length(xunit)/2),0]);circshift(yunit,[round(length(yunit)/2),0])]';


