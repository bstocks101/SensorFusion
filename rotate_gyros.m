function rot_gyros = rotate_gyros(gyros, angles)
rh1 = angles(1);
th1 = angles(2);
ph1 = angles(3);

Rpitch1=[[cos(th1) 0 sin(th1)];[0 1 0];[-sin(th1) 0 cos(th1)]];
Ryaw1=[[cos(ph1) -sin(ph1) 0];[sin(ph1) cos(ph1) 0];[0 0 1]];
Rroll1 = [[1 0 0];[0 cos(rh1) -sin(rh1)]; [0 sin(rh1) cos(rh1)]];

rot_gyros = Ryaw1*Rroll1*[0;gyros(2);0] + Ryaw1*[gyros(1);0;0] + [0; 0; gyros(3)];

end