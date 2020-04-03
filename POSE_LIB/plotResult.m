function plotResult(t,z_true,z_opt)

figure
plot(t,z_true(4,:),t,z_opt(4,:),'.r')
xlabel('Time (s)')
ylabel('X (mm)')
figure
plot(t,z_true(5,:),t,z_opt(5,:),'.r')
xlabel('Time (s)')
ylabel('Y (mm)')
figure
plot(t,z_true(6,:),t,z_opt(6,:),'.r')
xlabel('Time (s)')
ylabel('Z (mm)')
% 
% figure
% plot(t,z_true(1,:)*180/pi,t,z_opt(1,:)*180/pi,'.r')
% hold on
% plot(t,z_true(2,:)*180/pi,t,z_opt(2,:)*180/pi,'.g')
% hold on
% plot(t,z_true(3,:)*180/pi,t,z_opt(3,:)*180/pi,'.b')
% xlabel('Time (s)')
% ylabel('rotation angle (deg)')

figure
plot(t,z_true(1,:)*180/pi,t,z_opt(1,:)*180/pi,'.r')
xlabel('Time (s)')
ylabel('rotation angle1 (deg)')

figure
plot(t,z_true(2,:)*180/pi,t,z_opt(2,:)*180/pi,'.g')
xlabel('Time (s)')
ylabel('rotation angle2 (deg)')

figure
plot(t,z_true(3,:)*180/pi,t,z_opt(3,:)*180/pi,'.b')
xlabel('Time (s)')
ylabel('rotation angle3 (deg)')
