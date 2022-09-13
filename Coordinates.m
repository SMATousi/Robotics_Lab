clear 
clc

[al, cl, ol] = myobjectdetection('leftimage_d1.ppm')

[ar, cr, or] = myobjectdetection('rightimage_d1.ppm')

calib_right = load('Calib_Results_right.mat');
calib_left = load('Calib_Results_left.mat');

l_kk = calib_left.KK;
r_kk = calib_right.KK;

l_rc1 = calib_left.Rc_1;
r_rc1 = calib_right.Rc_1;

l_tc1 = calib_left.Tc_1;
r_tc1 = calib_right.Tc_1;

%%


I_l = l_kk;
I_r = r_kk;

E_l = [l_rc1, l_tc1];
E_r = [r_rc1, r_tc1];


ql = I_l*E_l;
qr = I_r*E_r;


%% 

M1 = Dreconstruction(qr, ql, cr(1,:), cl(1,:))
M2 = Dreconstruction(qr, ql, cr(2,:), cl(2,:))
M3 = Dreconstruction(qr, ql, cr(3,:), cl(3,:))
M4 = Dreconstruction(qr, ql, cr(4,:), cl(4,:))




