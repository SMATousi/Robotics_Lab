function M = Dreconstruction(qr, ql, cr, cl)

ur = cr(1);
vr = cr(2);

ul = cl(1);
vl = cl(2);

b(1,1) = ur*qr(3,4) - qr(1,4);
b(1,2) = vr*qr(3,4) - qr(2,4);
b(1,3) = ul*ql(3,4) - ql(1,4);
b(1,4) = vl*ql(3,4) - ql(2,4);

size(b)

A = zeros(4,3);

A(1,:) = qr(1,1:3)' - ur * qr(3,1:3)';
A(2,:) = qr(2,1:3)' - vr * qr(3,1:3)';
A(3,:) = ql(1,1:3)' - ul * ql(3,1:3)';
A(4,:) = ql(2,1:3)' - vl * ql(3,1:3)';

size(A)

M = pinv(A)*b';



end