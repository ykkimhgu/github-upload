function plotRMSE(z_error0)

% Plot RMS of error
% modified 2020-02-15

L=length(z_error0);

if L<20
    offset=0;
else    
    offset=4;    
end

% eliminate first offset data which could flunctuate 
m=L-offset;  
z_error=z_error0(:,(1+offset):L);

eR=sqrt(norm(z_error(1,:))^2/m);
eP=sqrt(norm(z_error(2,:))^2/m);
eYaw=sqrt(norm(z_error(3,:))^2/m);

eX=sqrt(norm(z_error(4,:))^2/m);
eY=sqrt(norm(z_error(5,:))^2/m);
eZ=sqrt(norm(z_error(6,:))^2/m);

% 
% eR=sqrt(norm(z_error(1,10:m))^2/m);
% eP=sqrt(norm(z_error(2,10:m))^2/m);
% eYaw=sqrt(norm(z_error(3,10:m))^2/m);
% 
% eX=sqrt(norm(z_error(4,10:m))^2/m);
% eY=sqrt(norm(z_error(5,10:m))^2/m);
% eZ=sqrt(norm(z_error(6,10:m))^2/m);

RMSE=[eR.*180/pi eP.*180/pi eYaw.*180/pi eX eY eZ]
STD=std(z_error(:,1:m),0,2)';
STD(1:3)=STD(1:3).*180/pi;
STD
MEAN=mean(z_error(:,1:m),2)';
MEAN(1:3)=MEAN(1:3).*180/pi;
MEAN


val =['Roll', 'Pitch', 'Yaw'];
figure
plot(RMSE(1:3).*180/pi','.r')
ylabel('Rotation RMSE(deg)')

val =['dX', 'dY', 'dZ'];
figure
plot(RMSE(4:6),'.r')
ylabel('Translation RMSE(m)')

% figure
% plot([RMSE(1:3).*180/pi RMSE(4:6)],'.b')
% ylabel('RMSE(m, deg)')

figure
boxplot([180/pi.*z_error(1,1:m)',180/pi.*z_error(2,1:m)', 180/pi.*z_error(3,1:m)'])
ylabel('Rotation Error [deg]')

figure
%boxplot([eX,eY, eZ],'Notch','on','Labels',{'errorX','errorY','errorZ'})
boxplot([z_error(4,1:m)',z_error(5,1:m)', z_error(6,1:m)'])
ylabel('Translation Error [m]')

% plot(t,z_error(4,:),'r')
% xlabel('Time (s)')
% ylabel('error_X (mm)')
% figure
% plot(t,z_error(5,:),'r')
% xlabel('Time (s)')
% ylabel('error_Y (mm)')
% figure
% plot(t,z_error(6,:),'r')
% xlabel('Time (s)')
% ylabel('error_Z (mm)')
% 
% figure
% plot(t,z_error(1,:)*180/pi,'r')
% xlabel('Time (s)')
% ylabel('error_rotation angle1 (deg)')
% 
% figure
% plot(t,z_error(2,:)*180/pi,'r')
% xlabel('Time (s)')
% ylabel('error_rotation angle2 (deg)')
% 
% figure
% plot(t,z_error(3,:)*180/pi,'r')
% xlabel('Time (s)')
% ylabel('error_rotation angle3 (deg)')
