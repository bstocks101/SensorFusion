syms ph0 th0 ps0 th1 ps1 th2 ps2 th3 ps3 Px0 Py0 Pz0 Vx0 Vy0 Vz0 Amp1 Freq1
syms Vx0_p Vy0_p Vz0_p delta_t l1 l2 l3

    hx = [];
        a = NED2ECEF1([Py0, Px0, Pz0]);
        hx = [hx; a(2); a(1)];
        hx = [hx; rotateGPSVelocity(Vx0, Vy0)]; 
        hx = [hx; projectP1([ph0, th0, ps0], [th1, ps1], l1)]; 
        hx = [hx; projectP2([ph0, th0, ps0], [th1, ps1], ...
            [th2, ps2], [l1,l2])]; 
        hx = [hx; projectP3([ph0, th0, ps0], [th1, ps1], ...
            [th2, ps2],[th3, ps3], [l1,l2, l3])];
        hx = [hx; sin(ps0)]; %needs work
%     hx = [hx; findAcc([Vx0, Vy0, Vz0], [ph0, th0, ps0], ...
%         [Vx0_p, Vy0_p, Vz0_p], delta_t)];
        hx = [hx; 0; 0; 0];
hx = [hx; alt_to_press(Pz0)]; 
    hx = [hx; att2mag([ph0, th0, ps0])]; 
    
    x_hat = [ph0, th0, ps0, th1, ps1, th2, ps2 ,th3, ps3 ,Px0, Py0 ,Pz0, ...
    Vx0, Vy0, Vz0, Amp1, Freq1].';


    H = jacobian(hx, x_hat);
    
    matlabFunction(H, hx, 'File', 'Submit/generated_hx', 'Vars', [...
        ph0, th0, ps0, th1, ps1, th2, ps2 ,th3, ps3 ,Px0, Py0 ,Pz0, ...
    Vx0, Vy0, Vz0, Amp1, Freq1...
    Vx0_p, Vy0_p, Vz0_p, delta_t, l1, l2, l3]);