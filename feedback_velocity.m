%% Converting struct to table to plot position data during feedback pilots
filename = load('C:\Users\Glove\Downloads\data\P001_14kgvar0001.mat');
pos = num2cell(filename.P001_14kgvar0001.Trajectories.Labeled.Data,[1,2]);

filename = "P001 14kgvar0001";

%Original filename = P002_7kgvar0001.mat

x_pos = []; 
y_pos = [];

xv_pos = [];
yv_pos = [];

for i = 1:length(pos)
    x_pos = [x_pos, pos{i}(1)];
    y_pos = [y_pos, pos{i}(2)];
end

x_pos = x_pos/1000;
y_pos = y_pos/1000;

figure()
plot(x_pos,y_pos)
fontsize(16,"points")
title("xy position of walker during " + filename)
xlabel("X Positions (m)")
ylabel("Y Positions (m)")


for i = 1:length(pos)
    xv_pos = [xv_pos, pos{i}(1)];
    yv_pos = [yv_pos, pos{i}(2)];
end


   
dx = xv_pos(2:end)-xv_pos(1:end-1);
dy = yv_pos(2:end)-yv_pos(1:end-1);
dt = .01;

x_velocity = dx/dt;

x_velocity = x_velocity/1000;

y_velocity = dy/dt;

y_velocity = x_velocity/1000;

figure()
plot(x_velocity, y_velocity, "o")
fontsize(16,"points")
title("X & Y Velocities for " + filename)
xlabel("X Velocity (m/s)")
ylabel("Y Velocity (m/s)")
xlim([-2,2])
ylim([-2,2])
