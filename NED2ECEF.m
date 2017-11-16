function ecef = NED2ECEF(NED)

% NED(1) = NED(1); / 425387;
% NED(2) = NED(2); / 1.0186e5;
lam = deg2rad(27.9245);
phi = deg2rad(-25.6762);

R = [[-sin(phi)*cos(lam), -sin(lam), -cos(phi)*cos(lam)];
    [-sin(phi)*sin(lam), cos(lam), -cos(phi)*sin(lam)];
    [cos(phi), 0, -sin(phi)]
    ];

ecef = R*NED' ;%+ [-25.6762; 27.9245; 1251];

end