function P1 = projectP1(angles0, angles1, length)

temp = [length; 0; 0];

P1 = rotate_vector(temp', [0, angles1(1:2)]);
%Rotate P1 to inertial
% temp1 = 0 + length*cos(angles1(1))*cos(angles1(2));
% temp2 = 0 + length*cos(angles1(1))*sin(angles1(2));
% temp3 = 0 - length*sin(angles1(1));

angles0(2) = angles0(2) + 0.0;
angles0(3) = 0; 
P1 = rotate_inertial2body(P1(1:3).', angles0(1:3));
%Rotate P1 to P0 frame

end