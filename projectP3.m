function P3 = projectP3(angles0, angles1, angles2, angles3, length)
temp = [length(1);0;0];
temp2 = [length(2);0;0];
temp3 = [length(3);0;0];

P1 = rotate_vector(temp', [0, angles1(1:2)]);
P2 = P1 + rotate_vector(temp2', [0, angles2(1:2)]);
P3 = P2 + rotate_vector(temp3', [0, angles3(1:2)]);

%Rotate P1 to inertial
% temp1 = 0 + length(1)*cos(angles1(1))*cos(angles1(2)) + ...
%     length(2)*cos(angles2(1))*cos(angles2(2)) + ...
%     length(3)*cos(angles3(1))*cos(angles3(2));
% temp2 = 0 + length(1)*cos(angles1(1))*sin(angles1(2)) + ...
%     length(2)*cos(angles2(1))*sin(angles2(2)) + ...
%     length(3)*cos(angles3(1))*sin(angles3(2));
% temp3 = 0 - length(1)*sin(angles1(1)) - length(2)*sin(angles2(1)) -...
%     length(3)*sin(angles3(1));

angles0(2) = angles0(2) - 0.1222;
angles0(3) = 0;

P3 = rotate_inertial2body(P3(1:3).', angles0(1:3));
%Rotate P1 to P0 frame

end