function rot_vec = rotate_inertial2body(vec, angles)
rh1 = angles(1);
th1 = angles(2);
ph1 = angles(3);

R = [[ cos(ph1)*cos(th1) - sin(ph1)*sin(rh1)*sin(th1), -cos(rh1)*sin(ph1), cos(ph1)*sin(th1) + cos(th1)*sin(ph1)*sin(rh1)];
[ cos(th1)*sin(ph1) + cos(ph1)*sin(rh1)*sin(th1),  cos(ph1)*cos(rh1), sin(ph1)*sin(th1) - cos(ph1)*cos(th1)*sin(rh1)];
[                             -cos(rh1)*sin(th1),           sin(rh1),                              cos(rh1)*cos(th1)]
];

rot_vec = R'*vec.';
end