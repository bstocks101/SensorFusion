function [F,fx] = generated_fx(ph0,th0,ps0,th1,ps1,th2,ps2,th3,ps3,Px0,Py0,Pz0,Vx0,Vy0,Vz0,Amp1,Freq1,dph0,dth0,dps0,dph2,dth2,dps2,dph3,dth3,dps3,delta_t,n)
%GENERATED_FX
%    [F,FX] = GENERATED_FX(PH0,TH0,PS0,TH1,PS1,TH2,PS2,TH3,PS3,PX0,PY0,PZ0,VX0,VY0,VZ0,AMP1,FREQ1,DPH0,DTH0,DPS0,DPH2,DTH2,DPS2,DPH3,DTH3,DPS3,DELTA_T,N)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    28-Nov-2016 14:39:13

t2 = sin(ps0);
t3 = cos(ps0);
t4 = sin(ph0);
t5 = cos(ph0);
t6 = Freq1.*n;
t7 = dth0.*t5.*(1.0./1.0e2);
t8 = dph0.*t3.*(1.0./1.0e2);
t9 = cos(t6);
t10 = cos(ps2);
t11 = sin(ps2);
t12 = dps0.*(1.0./1.0e2);
t13 = dth0.*t4.*(1.0./1.0e2);
t14 = cos(ps3);
t15 = sin(ps3);
F = reshape([dth0.*t2.*t4.*(1.0./1.0e2)+1.0,dth0.*t3.*t4.*(-1.0./1.0e2),t7,0.0,0.0,0.0,-t7,0.0,-t7,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,dph0.*t2.*(-1.0./1.0e2)-dth0.*t3.*t5.*(1.0./1.0e2),t8-dth0.*t2.*t5.*(1.0./1.0e2),1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,dph2.*t10.*(1.0./1.0e2)-dth2.*t11.*(1.0./1.0e2),1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,dph3.*t14.*(1.0./1.0e2)-dth3.*t15.*(1.0./1.0e2),1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,delta_t,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,delta_t,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,delta_t,0.0,0.0,1.0,0.0,0.0,0.0,0.0,0.0,t9,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,-Amp1.*n.*sin(t6),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,1.0],[17,17]);
if nargout > 1
    fx = [ph0+t8-dth0.*t2.*t5.*(1.0./1.0e2);th0+dph0.*t2.*(1.0./1.0e2)+dth0.*t3.*t5.*(1.0./1.0e2);ps0+t12+t13;Amp1.*t9;ps1;th2+dph2.*t11.*(1.0./1.0e2)+dth2.*t10.*(1.0./1.0e2);dps2.*(1.0./1.0e2)+ps2-t12-t13;th3+dph3.*t15.*(1.0./1.0e2)+dth3.*t14.*(1.0./1.0e2);dps3.*(1.0./1.0e2)+ps3-t12-t13;Px0+Vx0.*delta_t;Py0+Vy0.*delta_t;Pz0+Vz0.*delta_t;Vx0;Vy0;Vz0;Amp1;Freq1];
end
