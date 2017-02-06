t = 0:.01:1;
%t = 1;
R = 1e8;
% C = 1e-10:1e-11:1e-4;
C1 = 1e-10;
C2 = 1e-9;
C3 = 1e-8;
C4 = 1e-7;

y1 = exp(-t./(R*C1));
y2 = exp(-t./(R*C2));
y3 = exp(-t./(R*C3));
y4 = exp(-t./(R*C4));
yy1 = -1./(R*C1).*exp(-t./(R*C1));
yy2 = -1./(R*C2).*exp(-t./(R*C2));
yy3 = -1./(R*C3).*exp(-t./(R*C3));
yy4 = -1./(R*C4).*exp(-t./(R*C4));
figure(1)
plot(t,y1,t,y2,t,y3,t,y4)
% figure(2)
% plot(t,yy1,t,yy2,t,yy3,t,yy4)