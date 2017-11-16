function [H,hx] = generated_hx(ph0,th0,ps0,th1,ps1,th2,ps2,th3,ps3,Px0,Py0,Pz0,Vx0,Vy0,Vz0,Amp1,Freq1,Vx0_p,Vy0_p,Vz0_p,delta_t,l1,l2,l3)
%GENERATED_HX
%    [H,HX] = GENERATED_HX(PH0,TH0,PS0,TH1,PS1,TH2,PS2,TH3,PS3,PX0,PY0,PZ0,VX0,VY0,VZ0,AMP1,FREQ1,VX0_P,VY0_P,VZ0_P,DELTA_T,L1,L2,L3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    28-Nov-2016 14:39:27

t2 = Vx0.^2;
t3 = Vy0.^2;
t4 = t2+t3;
t5 = 1.0./sqrt(t4);
t6 = conj(ph0);
t7 = conj(th0);
t8 = sin(t7);
t9 = conj(l1);
t10 = cos(th1);
t11 = cos(t6);
t12 = sin(th1);
t13 = cos(t7);
t14 = sin(t6);
t15 = sin(ps1);
t16 = cos(ps1);
t17 = t7-1.222e-1;
t18 = sin(t17);
t19 = conj(l2);
t20 = cos(th2);
t21 = t9.*t10.*t15;
t22 = sin(ps2);
t23 = t19.*t20.*t22;
t24 = t21+t23;
t25 = cos(t17);
t26 = t9.*t12;
t27 = sin(th2);
t28 = t19.*t27;
t29 = t26+t28;
t30 = cos(ps2);
t53 = t9.*t10.*t14;
t54 = t9.*t11.*t12.*t15;
t31 = -t53-t54;
t32 = t9.*t10.*t11.*t16;
t33 = t9.*t10.*t16;
t34 = t19.*t20.*t30;
t35 = t33+t34;
t36 = conj(l3);
t37 = cos(th3);
t38 = sin(ps3);
t39 = t36.*t37.*t38;
t40 = t21+t23+t39;
t41 = sin(th3);
t42 = t36.*t41;
t43 = t26+t28+t42;
t44 = t9.*t10.*t11.*t18;
t45 = t44-t9.*t12.*t16.*t25-t9.*t12.*t14.*t15.*t18;
t46 = t9.*t10.*t14.*t16.*t18;
t47 = t46-t9.*t10.*t15.*t25;
t48 = t11.*t18.*t19.*t20;
t49 = t48-t19.*t25.*t27.*t30-t14.*t18.*t19.*t22.*t27;
t50 = t14.*t18.*t19.*t20.*t30;
t51 = t50-t19.*t20.*t22.*t25;
t52 = cos(ps3);
t55 = -t14.*t19.*t20-t11.*t19.*t22.*t27;
t56 = t11.*t19.*t20.*t30;
t57 = t36.*t37.*t52;
t58 = t33+t34+t57;
t59 = t9.*t12.*t14.*t15.*t25;
t60 = t59-t9.*t10.*t11.*t25-t9.*t12.*t16.*t18;
t61 = -t9.*t10.*t15.*t18-t9.*t10.*t14.*t16.*t25;
t62 = t14.*t19.*t22.*t25.*t27;
t63 = t62-t11.*t19.*t20.*t25-t18.*t19.*t27.*t30;
t64 = -t18.*t19.*t20.*t22-t14.*t19.*t20.*t25.*t30;
t68 = pi.*(1.0./4.0);
t65 = ps0-t68;
t66 = sin(t65);
t67 = cos(ph0);
t70 = pi.*(1.0./2.0);
t69 = -t70+th0;
t71 = cos(t69);
t72 = cos(t65);
t73 = sin(t69);
t74 = sin(ph0);
t75 = t9.*t10.*t13.*t16;
t76 = t8.*t9.*t11.*t12;
t77 = t8.*t9.*t10.*t14.*t15;
t78 = t75+t76+t77;
t79 = t9.*t11.*t12.*t13;
t80 = t9.*t10.*t13.*t14.*t15;
t81 = t25.*t35;
t82 = t14.*t18.*t24;
t83 = t11.*t18.*t29;
t84 = t81+t82+t83;
t85 = t14.*t24.*t25;
t86 = t11.*t25.*t29;
t87 = t25.*t58;
t88 = t14.*t18.*t40;
t89 = t11.*t18.*t43;
t90 = t87+t88+t89;
t91 = t14.*t25.*t40;
t92 = t11.*t25.*t43;
t93 = Pz0.*(-2.25694405261388e-5)+1.0;
t94 = t66.*t67.*3.998;
t95 = t71.*t72.*1.2391e1;
t96 = t94+t95-t72.*t73.*2.52151e1-t66.*t71.*t74.*2.52151e1-t66.*t73.*t74.*1.2391e1;
t97 = t67.*t72.*3.998;
t98 = t66.*t73.*2.52151e1;
H = reshape([0.0,0.0,0.0,-t8.*t9.*t12.*t14+t8.*t9.*t10.*t11.*t15,-t9.*t11.*t12-t9.*t10.*t14.*t15,t9.*t12.*t13.*t14-t9.*t10.*t11.*t13.*t15,t11.*t18.*t24-t14.*t18.*t29,-t14.*t24-t11.*t29,-t11.*t24.*t25+t14.*t25.*t29,t11.*t18.*t40-t14.*t18.*t43,-t11.*t43-t14.*t40,-t11.*t25.*t40+t14.*t25.*t43,0.0,0.0,0.0,0.0,0.0,t66.*t74.*(-3.998)-t66.*t67.*t71.*2.52151e1-t66.*t67.*t73.*1.2391e1,t72.*t74.*3.998+t67.*t71.*t72.*2.52151e1+t67.*t72.*t73.*1.2391e1,t67.*(-3.998)+t71.*t74.*2.52151e1+t73.*t74.*1.2391e1,0.0,0.0,0.0,t79+t80-t8.*t9.*t10.*t16,0.0,t78,t85+t86-t18.*t35,0.0,t84,t91+t92-t18.*t58,0.0,t90,0.0,0.0,0.0,0.0,0.0,t71.*t72.*(-2.52151e1)-t72.*t73.*1.2391e1-t66.*t71.*t74.*1.2391e1+t66.*t73.*t74.*2.52151e1,t66.*t71.*(-2.52151e1)-t66.*t73.*1.2391e1+t71.*t72.*t74.*1.2391e1-t72.*t73.*t74.*2.52151e1,t67.*t71.*(-1.2391e1)+t67.*t73.*2.52151e1,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,cos(ps0),0.0,0.0,0.0,0.0,t97+t98-t66.*t71.*1.2391e1-t71.*t72.*t74.*2.52151e1-t72.*t73.*t74.*1.2391e1,t96,0.0,0.0,0.0,0.0,t8.*t9.*t10.*t11-t9.*t12.*t13.*t16-t8.*t9.*t12.*t14.*t15,t31,-t9.*t10.*t11.*t13-t8.*t9.*t12.*t16+t9.*t12.*t13.*t14.*t15,t45,t31,t60,t45,t31,t60,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t9.*t10.*t13.*t15+t8.*t9.*t10.*t14.*t16,t32,-t8.*t9.*t10.*t15-t9.*t10.*t13.*t14.*t16,t47,t32,t61,t47,t32,t61,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t49,t55,t63,t49,t55,t63,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t51,t56,t64,t51,t56,t64,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t11.*t18.*t36.*t37-t25.*t36.*t41.*t52-t14.*t18.*t36.*t38.*t41,-t14.*t36.*t37-t11.*t36.*t38.*t41,-t11.*t25.*t36.*t37-t18.*t36.*t41.*t52+t14.*t25.*t36.*t38.*t41,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t25.*t36.*t37.*t38+t14.*t18.*t36.*t37.*t52,t11.*t36.*t37.*t52,-t18.*t36.*t37.*t38-t14.*t25.*t36.*t37.*t52,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,9.988912307338854e-6,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,9.988912307338854e-6,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t93.^4.257512986057075.*(-1.202313600823859e-1),0.0,0.0,0.0,0.0,0.0,Vx0.*t5.*1.11e5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,Vy0.*t5.*1.11e5,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[20,17]);
if nargout > 1
    hx = [Px0.*9.988912307338854e-6+2.79245e1;Py0.*9.988912307338854e-6-2.56762e1;sqrt(t4).*1.11e5;t78;-t9.*t12.*t14+t9.*t10.*t11.*t15;-t79-t80+t8.*t9.*t10.*t16;t84;t11.*t24-t14.*t29;-t85-t86+t18.*t35;t90;t11.*t40-t14.*t43;-t91-t92+t18.*t58;sin(ps0);0.0;0.0;0.0;t93.^5.257512986057075.*1.01325e3;t96;-t97-t98+t66.*t71.*1.2391e1+t71.*t72.*t74.*2.52151e1+t72.*t73.*t74.*1.2391e1;t74.*(-3.998)-t67.*t71.*2.52151e1-t67.*t73.*1.2391e1];
end