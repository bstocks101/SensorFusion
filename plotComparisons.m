function plotComparisons(angles0, angles1, angles2, angles3, XYZn, s)
figure
XYZ = [];
P1 = [];
P2 = [];
P3 = [];
for i = 1:size(angles0, 1)
%     temp  = rotate_vector(XYZn(i, 1:3), [angles0(i, 1:2), 0])';
%     temp = [temp, rotate_vector(XYZn(i, 4:6), [angles0(i, 1:2), 0])'];
%     temp = [temp, rotate_vector(XYZn(i, 7:9), [angles0(i, 1:2), 0])'];
    XYZ = [XYZ; XYZn(i, 1:9)];
%     temp = [];
    [tP1, tP2, tP3] = angles2position(angles1(i, :), angles2(i, :), angles3(i, :));
    P1 = [P1; rotate_inertial2body(tP1', [angles0(i, 1:2), 0])'];
    P2 = [P2; rotate_inertial2body(tP2', [angles0(i, 1:2), 0])'];
    P3 = [P3; rotate_inertial2body(tP3', [angles0(i, 1:2), 0])'];
end

for x = 1:size(angles0, 1)
    subplot(3, 3, 1)
    if(s(x, 1) == 1)
        plot(x, XYZ(x, 3), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P1(:, 3), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'z (mm)',''},'FontSize',12);
    title('Z-Values for marker at P2','FontSize',14);
    grid on
    
    
    
    subplot(3, 3, 2)
    if(s(x, 2) == 1)
        plot(x, XYZ(x, 6), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P2(:, 3), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'z (mm)',''},'FontSize',12);
    title('Z-Values for marker at P3','FontSize',14);
    grid on
    
    subplot(3, 3, 3)
    if(s(x, 3) == 1)
        plot(x, XYZ(x, 9), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P3(:, 3), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'z (mm)',''},'FontSize',12);
    title('Z-Values for marker at P4','FontSize',14);
    grid on
    
    
    subplot(3, 3, 4)
    if(s(x, 1) == 1)
        plot(x, XYZ(x, 2), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P1(:, 2), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'y (mm)',''},'FontSize',12);
    title('Y-Values for marker at P2','FontSize',14);
    grid on
    
    
    subplot(3, 3, 5)
    if(s(x, 2) == 1)
        plot(x, XYZ(x, 5), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P2(:, 2), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'y (mm)',''},'FontSize',12);
    title('Y-Values for marker at P3','FontSize',14);
    grid on
    
    
    
    subplot(3, 3, 6) 
    if(s(x, 3) == 1)
        plot(x, XYZ(x, 8), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P3(:, 2), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'y (mm)',''},'FontSize',12);
    title('Y-Values for marker at P4','FontSize',14);
    grid on
    
    
    subplot(3, 3, 7)
    if(s(x, 1) == 1)
        plot(x, XYZ(x, 1), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P1(:, 1), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'x (mm)',''},'FontSize',12);
    title('X-Values for marker at P2','FontSize',14);
    grid on
    
    
    subplot(3, 3, 8)
    if(s(x, 2) == 1)
        plot(x, XYZ(x, 4), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P2(:, 1), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'x (mm)',''},'FontSize',12);
    title('X-Values for marker at P3','FontSize',14);
    grid on
    
    
    subplot(3, 3, 9)
    if(s(x, 3) == 1)
        plot(x, XYZ(x, 7), 'kx', 'MarkerSize', 10);
        hold on
    end
    hold on
    plot(P3(:, 1), 'b', 'LineWidth', 2)
    %hold off
    xlabel('Samples','FontSize',12);
    ylabel({'x (mm)',''},'FontSize',12);
    title('X-Values for marker at P4','FontSize',14);
    grid on
    
end
end