function plotStates(x_n, sAvail)
figure
position = [0, 500, 1500, 2200];
set(0, 'DefaultFigurePosition', position);

subplot(2, 4, 1)
plot([rad2deg(x_n(:, 1)), rad2deg(x_n(:, 2)), rad2deg(x_n(:, 3))],'LineWidth',2)
xlabel('Samples','FontSize',12);
ylabel({'Degrees',''},'FontSize',12);
title('Attitude beam 1','FontSize',14);
legend('Roll', 'Pitch', 'Yaw')
grid on

subplot(2, 4, 2)
plot([rad2deg(x_n(:, 4)), rad2deg(x_n(:, 5))], 'LineWidth',2)
xlabel('Samples','FontSize',12);
ylabel({'Degrees',''},'FontSize',12);
title('Attitude beam 2','FontSize',14);
legend('Pitch', 'Yaw')
grid on

subplot(2, 4, 3)
plot([rad2deg(x_n(:, 6)), rad2deg(x_n(:, 7))], 'LineWidth',2)
xlabel('Samples','FontSize',12);
ylabel({'Degrees',''},'FontSize',12);
title('Attitude beam 3','FontSize',14);
legend('Pitch', 'Yaw')
grid on

subplot(2, 4, 4)
plot([rad2deg(x_n(:, 8)), rad2deg(x_n(:, 9))], 'LineWidth',2)
xlabel('Samples','FontSize',12);
ylabel({'Degrees',''},'FontSize',12);
title('Attitude beam 4','FontSize',14);
legend('Pitch', 'Yaw')
grid on

subplot(2, 4, 5)
plot([sAvail(:, 2), sAvail(:, 3), sAvail(:, 4)], 'LineWidth',2)
xlabel('Samples','FontSize',12);
ylabel({'Available (boolean)',''},'FontSize',12);
title('Sensors Available','FontSize',14);
legend('P2', 'P3', 'P4')
grid on

subplot(2, 4, 6)
plot([x_n(:, 10), x_n(:, 11), x_n(:, 12)-1250], 'LineWidth',2)
xlabel('Samples','FontSize',12);
ylabel({'Position (m)',''},'FontSize',12);
title('Positions','FontSize',14);
legend('x', 'y', 'z')
grid on

subplot(2, 4, 7)
plot([x_n(:, 13), x_n(:, 14), x_n(:, 15)], 'LineWidth',2)
xlabel('Samples','FontSize',12);
ylabel({'Velocities (m/s)',''},'FontSize',12);
title('Velocities','FontSize',14);
legend('x', 'y', 'z')
grid on

subplot(2, 4, 8)
plot([x_n(:, 16), x_n(:, 17)], 'LineWidth',2)
xlabel('Samples','FontSize',12);
ylabel({'Magnitude',''},'FontSize',12);
title('Sinusoid parameters','FontSize',14);
legend('Amplitude', 'Frequency')
grid on

end