function plotError(t,z_error)

figure
plot(t,z_error(4,:),'r')
xlabel('Time (s)')
ylabel('error_ X (mm)')
figure
plot(t,z_error(5,:),'r')
xlabel('Time (s)')
ylabel('error_ Y (mm)')
figure
plot(t,z_error(6,:),'r')
xlabel('Time (s)')
ylabel('error_ Z (mm)')

figure
plot(t,z_error(1,:)*180/pi,'r')
xlabel('Time (s)')
ylabel('error_ rotation angle1 (deg)')

figure
plot(t,z_error(2,:)*180/pi,'r')
xlabel('Time (s)')
ylabel('error_ rotation angle2 (deg)')

figure
plot(t,z_error(3,:)*180/pi,'r')
xlabel('Time (s)')
ylabel('error_ rotation angle3 (deg)')
