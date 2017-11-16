function [P1, P2, P3] = plotPoints(x, XYZn)

P1 = [];
P2 = [];
P3 = [];
figure
    for i = 1: size(x, 1)
        %a =subplot(2, 1, 1);
%         plot3(XYZn(i, 1), XYZn(i, 2), XYZn(i, 3), 'rx', 'MarkerSize', 10);
%         hold on
%         plot3(XYZn(i, 4), XYZn(i, 5), XYZn(i, 6), 'ko', 'MarkerSize', 10);
%         plot3(XYZn(i, 7), XYZn(i, 8), XYZn(i, 9), 'g*', 'MarkerSize', 10);
%         title(['Camera points ' num2str(i)])
%         pause
        [Tp1, Tp2, Tp3] = angles2position(x(i, 4:5), x(i, 6:7), x(i, 8:9));
        P1 = [P1;Tp1'];
        P2 = [P2;Tp2'];
        P3 = [P3;Tp3'];
        %b =subplot(2, 1, 2);
        %axis equal
        plot3([0 Tp1(1)], [0 Tp1(2)], [0 Tp1(3)], 'r', 'LineWidth', 2);
        hold on
        plot3([Tp1(1) Tp2(1)], [Tp1(2) Tp2(2)], [Tp1(3) Tp2(3)], 'g', 'LineWidth', 2);
        plot3([Tp2(1) Tp3(1)], [Tp2(2) Tp3(2)], [Tp2(3) Tp3(3)], 'b', 'LineWidth', 2);
        title(['Points from states ' num2str(i)])
        xlabel('x (mm)');
        ylabel('y (mm)');
        zlabel('z (mm)');
        view([-66,  11.9999999999999]);
        zlim([-100 800]);
        ylim([-100 600]);
        xlim([0, 900]);
        grid on
        pause(0.2)
        
        
        hold off
        
    end
    hold off
   
    %plot3(P1(:, 1), P1(:, 2), P1(:, 3), 'rx')
 
