format LONG
p = 8000;
Dens = 1060;
Areatrue = pi()*0.0025^2;
Area = 1.9555296e-05;

divp = pi*(-.5:0.0005:1.5)';
t = [0,(0.4:0.00015:1)]';

 u=[  
 .5 
 .5 + .075*sin(divp)+.075
 ];

u(3)
size(t)
size(u)

m=Dens*Area*u;
maxq = max(m)/Dens;
minq = min(m)/Dens;

rel_R = .5;
Rp = p/(maxq*(1+rel_R));
Rd = rel_R*Rp

t_RC = 2;
C = .1/(Rd*t_RC);
% C=4e-5;
ti=.1;
decay=exp(-ti/(Rd*C));
tau = Rd*C;
E_C = 1/C*exp(-0.02/(Rd*C));

pmax = maxq*(Rp+Rd);
pmin = minq*(Rp+Rd);

dt=0.01;
T_2 = (dt)*(-pmin)/(Rd*C)
T_3 = (dt)*(minq)*(Rp+Rd)/(Rd*C)

figure(1)
plot(t,m)

timedt = [0.4:0.02:1,0:0.02:0.38];
mback = interp1(t,m,timedt)';
plot(timedtt,Vq)

fileID = fopen('inlet_mass_sin.prof','w');
fprintf(fileID,'((inlet_mass transient ');
fprintf(fileID,num2str(max(size(t))));
fprintf(fileID,' 1)\r\n');
fprintf(fileID,'(time\r\n');
fprintf(fileID,'%16.16e\r\n',t);
fprintf(fileID,')\r\n');
fprintf(fileID,'(u\r\n');
fprintf(fileID,'%16.16e\r\n',m);
fprintf(fileID,')\r\n');
fprintf(fileID,')\r\n');
fclose(fileID);