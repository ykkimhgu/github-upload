%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% ODE  2nd order syste Demo - Y.K.Kim 2016  %%%%%%%%%%%%%%%

clear, clc
tspan = [0:0.001:5];
xini = [0 0.2];
[Time x] = ode45(@mckFunc1,tspan,xini);


yINI = 0;
zINI = 0.2;
a=0;
b=5;
h=0.001;
[Time, y, z] = sys2RK2(@mckFunc,a,b,h,yINI,zINI);

subplot(2,1,1)
plot(Time,x(:,1),'--b', Time,y,'k')
xlabel('Time (s)')
ylabel('Position (m)')
subplot(2,1,2)
plot(Time,x(:,2),'--b', Time,z,'k')
xlabel('Time (s)')
ylabel('Velocity (m/s)')