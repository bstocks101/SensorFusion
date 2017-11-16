syms ph0 th0 ps0 th1 ps1 th2 ps2 th3 ps3 Px0 Py0 Pz0 Vx0 Vy0 Vz0 Amp1 Freq1
syms dph0 dth0 dps0 dph2 dth2 dps2 dph3 dth3 dps3 delta_t n

fx = [updateAttitude([ph0, th0, ps0], [dph0, dth0, dps0]);
    Amp1*cos(n*Freq1);
    ps1;
    updateAttitude2([th2, ps2], [dph2, dth2, dps2], [ph0, th0, ps0], [dph0, dth0, dps0]);
    updateAttitude2([th3, ps3], [dph3, dth3, dps3], [ph0, th0, ps0], [dph0, dth0, dps0]);
    Px0 + delta_t*(Vx0);
    Py0 + delta_t*(Vy0);
    Pz0 + delta_t*(Vz0);
    Vx0; %east
    Vy0; %north
    Vz0; %up
    Amp1;
    Freq1;
    ];

x_vec = [ph0, th0, ps0, th1, ps1, th2, ps2 ,th3, ps3 ,Px0, Py0 ,Pz0, ...
    Vx0, Vy0, Vz0, Amp1, Freq1].';


F = jacobian(fx, x_vec);

matlabFunction(F, fx, 'File', 'Submit/generated_fx', 'Vars', [ph0, th0, ps0...
    ,th1, ps1, th2, ps2 ,th3, ps3 ,Px0, Py0 ,Pz0, Vx0 ...
    ,Vy0, Vz0, Amp1, Freq1, dph0, dth0, dps0, dph2, ...
    dth2, dps2, dph3, dth3, dps3, delta_t, n]);
