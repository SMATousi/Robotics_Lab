clc 
clear

% theta_m = inv_kinematics(279.3159,324.5987,-30.9658,136.6660,0.2982,66.3218);
% th1 = theta_m(1);
% th2 = theta_m(2);
% th3 = theta_m(3);
% th4 = theta_m(4);
% th5 = theta_m(5);
% th6 = theta_m(6);

th1 = 60;
th2 = 10;
th3 = 40;
th4 = 40;
th5 = 30;
th6 = 40;
% fixed variables for A1 matrix
alpha1 = -90 ;
d1 = 0 ;
a1 = 0 ;          
% fixed variables for A2 matrix
alpha2= 0 ;
d2 = unitsratio ('millimeter', 'inch') * ((2 + 7/8)+(2 + 1/16));
a2 = unitsratio ('millimeter', 'inch') * 8;
% fixed variables for A3 matrix
alpha3= 90 ;
d3 = 0;
a3 = 0;          
% fixed variables for A4 matrix
alpha4= -90 ;
d4 = unitsratio ('millimeter', 'inch') * 8 ;  
a4 = 0;          
% fixed variables for A5 matrix
alpha5= 90 ;
d5 = 0 ;  
a5 = 0;          
% fixed variables for A6 matrix
alpha6= 0 ;
d6 = unitsratio ('millimeter', 'inch') * 2.202 ;      
a6 = 0;  


% theta = 1.57

A1=A_matrix(th1, d1, a1, alpha1);
A2=A_matrix(th2, d2, a2, alpha2);
A3=A_matrix(th3, d3, a3, alpha3);
A4=A_matrix(th4, d4, a4, alpha4);
A5=A_matrix(th5, d5, a5, alpha5);
A6=A_matrix(th6, d6, a6, alpha6);

T = A1 * A2 * A3 * A4 * A5 * A6;

t = atan2d(T(3,2),-T(3,1))

o = atan2d(T(1,3),-T(2,3))

sosast = T(1,2) - cosd(o)*cosd(t);
sa = sosast/(sind(o)*sind(t));
ca = T(3,2)/sind(t);
a = atan2d(sa,ca)

X = T(1,4)
Y = T(2,4)
Z = T(3,4)

XYZOAT = [X,Y,Z,o,a,t];
