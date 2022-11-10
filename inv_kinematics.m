
function theta_mat=inv_kinematics(X, Y, Z,O,A,T)

% fiPxed variables for A1 matriPx
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

SO = sind(O);
CO = cosd(O);
SA = sind(A);
CA = cosd(A);
ST = sind(T);
CT = cosd(T);

Rot_0_to_6 = [-SO*SA*CT + CO*ST, SO*SA*ST + CO*CT, SO*CA;
              CO*SA*CT + SO*ST, -CO*SA*ST + SO*CT, -CO*CA;
              -CA*CT, CA*ST, -SA
              0, 0, 0];

Translation_0_to_6 = [X, Y, Z, 1];

T_6_to_0 = [Rot_0_to_6, Translation_0_to_6'];

P_6_to_4 = [Rot_0_to_6(1,3),Rot_0_to_6(2,3),Rot_0_to_6(3,3)];

Px = X - d6*P_6_to_4(1);
Py = Y - d6*P_6_to_4(2);
Pz = Z - d6*P_6_to_4(3);

sqr1=sqrt(Px^2+Py^2-d2^2);



th1=atand((Py*sqr1-d2*Px)/ (Px*sqr1+d2*Py));

pvalues=Px^2+Py^2+Pz^2-a2^2-a3^2-d2^2-d4^2;

R = Px^2 + Py^2 + Pz^2 - a2^2 - a3^2 - d2^2 - d4^2;

r = 2*a2*sqrt(a3^2 + d4^2);

% r = sqrt(Px^2 + Py^2 + Pz^2 - d2^2)

sqr2=(r^2-R^2);

th3=atand(((2*a2*d4*pvalues)-(2*a2*a3*sqrt(sqr2)))/((2*a2*d4*sqrt(sqr2))+(2*a2*a3*pvalues)));



% R=2*a2*d4*sind(th3)+2*a2*a3*cosd(th3);



test1 = d4*sind(th3)
test2 = d4*(sind(th3))

avalues=(a2+(a3*cosd(th3))+(d4*sind(th3)));
dvalues=(d4*cosd(th3)-a3*sind(th3));

% th2=atand(-((Pz*avalues)+(dvalues*sqr1))/((Pz*dvalues)-(avalues*sqr1)));

th2 = atand((-(Pz*(a2+a3*cosd(th3)+d4*sind(th3)) + (d4*cosd(th3)-a3*sind(th3))*(sqrt(Px^2 + Py^2 - d2^2))))/(Pz*(d4*cosd(th3)-a3*sind(th3)) - (a2+a3*cosd(th3)+d4*sind(th3))*(sqrt(Px^2 + Py^2 - d2^2))));


C1 = cosd(th1);
S1 = sind(th1);
C2 = cosd(th2);
S2 = sind(th2);
C3 = cosd(th3);
S3 = sind(th3);

C23 = cosd(th2 + th3);
S23 = sind(th2 + th3);

T_0_to_3 = [C1*C23, -S1, C1*S23, a2*C1*C2 + a3*C1*C23 - d2*S1;
            S1*C23, C1, S1*S23, a2*S1*C2 + a3*S1*C23 + d2*C1;
            -S23, 0, C23, -a2*S2 - a3*S23;
            0, 0, 0, 1];
        
T_4_to_6 = inv(T_0_to_3) * T_6_to_0;

th6 = atand(-T_4_to_6(3,2)/T_4_to_6(3,1));

th4 = atand(T_4_to_6(2,4)/T_4_to_6(1,4));

th5 = atand((T_4_to_6(2,3)/sind(th4))/T_4_to_6(3,3));

theta_mat = [th1, th2, th3, th4, th5, th6]
end