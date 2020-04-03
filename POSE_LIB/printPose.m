function [RotPose, TranPose]=printPose(poseVector)
% Input: rad/m
% Output: deg/m

[rows, cols]=size(poseVector);
if (cols>1)
    poseVector=mean(poseVector,2);
end

disp('Rotation Pose (Roll Pitch Yaw)[deg]');
RotPose=[poseVector(1:3).*180/pi]

disp('Translation (X Y Z)[m]');
TranPose=[poseVector(4:6)]
