
clear;
close all;

v = VideoReader('videoCompressed.avi');

% while hasFrame(v)
%     video = readFrame(v);
%     image(video, 'Parent')
% end
% whos video


% set(handles.WidthTextbox,'String',num2str(v.Width));

for i=200: frames-1
    vidFrame = read(v, i);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'off';
    pause(1/v.FrameRate);
end