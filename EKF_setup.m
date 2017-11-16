%EKF setup and run
load('./phoneData.mat')
load('./MW1data.mat')
load('./MW2data.mat')
load('./MW3data.mat')
%load('./videoData.mat')
load('./Camera_boolXYZ.mat')
load('./Camera_XYZ.mat')

%build measurements vector and availability
Z = [GPSlon, GPSlat, GPSspeed, XYZ,...
    GPSbearing, AccX, AccY, AccZ,...
    Pressure, MagX, MagX, MagX];
sAvail = [GPSavailable, boolXYZ];


%build system input vector
U = [GyroX, GyroY, GyroZ, ...
    GyroX, GyroY, GyroZ,...
    GyroX, GyroY, GyroZ];

n = size(U, 1);

%Initial state covariance
%[1: ph0, 2: th0, 3: ps0, 4: th1, 5: ps1, 6: th2, 7: ps2, 8: th3, 9:ps3, 
%10: Px0, 11: Py0, 12: Pz0, 13: Vx0, 14: Vy0, 15: Vz0, 16: Amp1, 17: Freq1]
P = ones(17, 1);
%make any changes to initial state covariances below
P(1) = 1;
P(2) = 1;
P(3) = 1;
P(4) = 1;
P(5) = 1;
P(6) = 2;
P(7) = 2;
P(8) = 2;
P(9) = 2;
P(16) = 1;
P(17) = 1;

%Process covariances
Q = struct;
Q.ph0_var = 0.05^2;
Q.th0_var = 0.05^2;
Q.ps0_var = 0.3^2;
Q.th1_var = 0.01^2;
Q.ps1_var = 0.01^2;
Q.th2_var = 0.02^2;
Q.ps2_var = 0.02^2;
Q.th3_var = 0.06^2;
Q.ps3_var = 0.06^2;
Q.Px0_var = 1e-10;
Q.Py0_var = 1e-10;
Q.Pz0_var = 1e-10;
Q.Vx0_var = 1;
Q.Vy0_var = 1;
Q.Vz0_var = 1;
Q.Amp1_var = 1e-5;
Q.Freq1_var = 1e-5;

%Measurement covariances
R = struct;
R.GPS_lat_var = 1e-8;
R.GPS_long_var = 1e-8;
R.GPS_vel_var = 2.3;
R.GPSbear_var = 4.2;
R.P1_x_var = 35^2; %mm
R.P1_y_var = 10^2;
R.P1_z_var = 10^2;
R.P2_x_var = 35^2;
R.P2_y_var = 10^2;
R.P2_z_var = 10^2;
R.P3_x_var = 35^2;
R.P3_y_var = 10^2;
R.P3_z_var = 10^2;
R.Acc_x_var = 2e-12;
R.Acc_y_var = 9e-13;
R.Acc_z_var = 4e-12;
R.Baro_var = 5.9e-5;
R.Mag_x_var = 0.0398;
R.Mag_y_var = 0.0145;
R.Mag_z_var = 0.2577;

%Initial states
%[1: ph0, 2: th0, 3: ps0, 4: th1, 5: ps1, 6: th2, 7: ps2, 8: th3, 9:ps3, 
%10: Px0, 11: Py0, 12: Pz0, 13: Vx0, 14: Vy0, 15: Vz0, 16: Amp1, 17: Freq1]
x_0 = [0, 0, 0.3020, 0, 0, 0.3, 0.1, 0.3,  0.1, 0, 0,...
    1251, -4.24, 13.6151, 0.5, 0, 0.01];

%Lengths
lengths = [480, 350, 320];

[x_n, P_n, x_pred, y_err] = ExtendedKF(x_0, U, Z, n, sAvail, P, Q, R, lengths);