function [x_n, P_n, x_predicted, y_err] = ExtendedKF(x_0, U, z, n, sAvail, P, Q1, R1, l)

x_n = [];
P_n = [];
x_predicted = [];
y_err = [];
l1 = l(1);
l2 = l(2);
l3 = l(3);

delta_t = 1/100;
x_prev = x_0;


P_prev = diag(P);

%build process covariance
Q= [Q1.ph0_var, Q1.th0_var, Q1.ps0_var, Q1.th1_var, Q1.ps1_var, Q1.th2_var,...
    Q1.ps2_var, Q1.th3_var, Q1.ps3_var, Q1.Px0_var, Q1.Py0_var, Q1.Pz0_var,...
    Q1.Vx0_var, Q1.Vy0_var, Q1.Vz0_var, Q1.Amp1_var, Q1.Freq1_var];
 
%values used for Velocity differentiation, start at 0
Velocities = [0, 0, 0];

for i = 1:n
    %Rotate inputs u to body (moved to state transition model)
%     u_rotated = rotate_gyros(u(i, 1:3), x_prev(1:3)); 
%     u_rotated = [u_rotated; rotate_gyros(u(i, 4:6), [0, x_prev(4:5)])];
%     temp = rotate_gyros(u(i, 7:9), [-0.7854, 0, 0]);
%     u_rotated = [u_rotated; rotate_gyros(temp, [0, x_prev(6:7)])]; 
    
    
    %%%%%%%%%%PREDICT%%%%%%%%%%%%%%
    
    stateCell = num2cell(x_prev);
%    inputCell = num2cell(u_rotated);
    
    %update velocities for differentiation on next iteration
    Velocities = [Velocities; x_prev(13:15)];
    
    %generate x_hat and F as jacobian of f and state
    [F, x_hat] = generated_fx(stateCell{:}, U(i, 1), U(i, 2),...
         U(i, 3), U(i, 4), U(i, 5), U(i, 6), U(i, 7), U(i, 8),...
          U(i, 9),delta_t, i);
    P_hat = F*P_prev*F' + diag(Q);
    
    %feedback vector to check value from predict stage
    x_predicted = [x_predicted; x_hat'];
    
    %assign values to variables for easy use
    x_cell = num2cell(x_hat);
    [ph0, th0, ps0, th1, ps1, th2, ps2, th3, ps3, Px0, Py0, Pz0, Vx0, Vy0, Vz0,...
 Amp1, Freq1] = deal(x_cell{:});


    %%%%%%%%%%UPDATE%%%%%%%%%%%%%%%
    %Measurements vector (if all available):
    %[1: GPSlon, 2: GPSlat, 3: GPSv, 4: P1x, 5: P1y, 6: P1z, 7: P2x, 8: P2y,
    %9: P2z, 10: P3x, 11: P3y, 12: P3z, 13: GPSbear14: Accx, 15: Accy, 
    %16: Accz, 17: Baro, 18: Magx, 19: Magy, 20: Magz]
    
    %assign measurements to variables for easy use
    temp_measurements = num2cell(z(i,:));
    [GPSx, GPSy, GPSv, P1x, P1y, P1z, P2x, P2y, P2z, P3x, P3y, P3z,...
    Accx, Accy, Accz, Baro, Magx, Magy, Magz, GPSbear] = deal(temp_measurements{:});
    
    z_use = [];
    hx_use = [];
    H_use = [];
    R =[];
    
    %Generated h(x_hat) and H
    [H, hx] = generated_hx(ph0, th0, ps0, th1, ps1, th2, ps2, th3, ...
        ps3, Px0, Py0, Pz0, Vx0, Vy0, Vz0, Amp1, Freq1,...
        Velocities(i, 1), Velocities(i, 2), Velocities(i, 3), delta_t, l1, l2, l3);
    
    %Is GPS position available
    if(sAvail(i, 1))
        z_use = [z_use; GPSx; GPSy]; %add measurements
        hx_use = [hx_use; hx(1:2)]; %add observation model predictions
        H_use = [H_use; H(1:2, :)]; %add H values
        R = [R, R1.GPS_lat_var, R1.GPS_long_var]; %add covariances
    end
    %Is GPS velocity available
    if(sAvail(i, 1))
        z_use = [z_use; GPSv];
        hx_use = [hx_use; hx(3)];
        H_use = [H_use; H(3, :)];
        R = [R, R1.GPS_vel_var];
    end
    %is P1 available
    if(sAvail(i, 2))
        z_use = [z_use; P1x; P1y; P1z];
       hx_use = [hx_use; hx(4:6)];
        H_use = [H_use; H(4:6, :)];
        R = [R, R1.P1_x_var, R1.P1_y_var, R1.P1_z_var];
    end
    %is P2 available
    if(sAvail(i, 3))
        z_use = [z_use; P2x; P2y; P2z];
        hx_use = [hx_use; hx(7:9)];
        H_use = [H_use; H(7:9, :)];
        R = [R, R1.P2_x_var, R1.P2_y_var, R1.P2_z_var];
    end
    %is P3 available
    if(sAvail(i, 4))
        z_use = [z_use; P3x; P3y; P3z];
        hx_use = [hx_use; hx(10:12)];
        H_use = [H_use; H(10:12, :)];
        R = [R, R1.P3_x_var, R1.P3_y_var, R1.P3_z_var];
    end
    %is GPS available
    if(sAvail(i, 1))
        temp = sind(z(i,5)-360); %convert bearing to some sinusoidal output [-1, 1]
        z_use = [z_use; temp];
        hx_use = [hx_use; hx(13)];
        H_use = [H_use; H(13, :)];
        R = [R, R1.GPSbear_var];
    end
    
    %Add the rest of the always available measurements
    z_use = [z_use; z(i, 14:20)'];
    R = [R, R1.Acc_x_var, R1.Acc_y_var, R1.Acc_z_var, R1.Baro_var, R1.Mag_x_var, ...
        R1.Mag_y_var, R1.Mag_z_var];
    hx_use = [hx_use; hx(14:20)]; 
    H_use = [H_use; H(14:20, :)];  
    
    y = z_use - hx_use; %filter residual
    y_err = [y_err; y' zeros(1, 20-size(y,1))]; %feedback value for testing
    S = H_use*P_hat*H_use' + diag(R); 
    K = P_hat*H_use'*inv(S); %kalman gain
    x_prev = (x_hat + K*y).'; %state estimate
    x_n = [x_n; x_prev];  %add to output vector
    P_prev = (eye(17) - K*H_use)*P_hat; %filter state covariances
    P_n = [P_n ;P_prev]; %add to output vector
end
 
 
 
end
