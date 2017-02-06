clear;
pmin = 6000;
Dens = 1060;
dt=.01;
Areatrue = pi()*0.0025^2;
Area = 1.9555296e-05; %Min Feature size 2e-7

vmin = 0.47;
vmax = 0.68;

minm=Dens*Area*vmin;
maxm=Dens*Area*vmax;

minq = minm/Dens;
maxq = maxm/Dens;

Rd_Rp = 1;
Rp = pmin/(minq*(1+Rd_Rp));
Rd = Rd_Rp*Rp;

Rp = 2e+08;
Rd = 6e+08;

decay_ratio = .5;
decay_ratio_time = 0.1;
C = -decay_ratio_time/Rd/log(decay_ratio);

C = 5e-8;  %Rd=Rp decay_ratio_time = 0.1
tau = Rd*C;
decay=exp(-.1/(tau))

pmax = maxq*(Rp+Rd);
pmin = minq*(Rp+Rd);


p0 = pmin;
h0_p0 = C/exp(-dt/(tau))*(p0-(p0-Rp*minq)*exp(-dt/(tau))-Rp*minq)-dt*minq;
p1 = (p0-Rp*minq)*exp(-dt/(tau))+Rp*minq+1/C*exp(-dt/(tau))*(h0_p0+dt*minq);

p1_h0_0 = (p0-Rp*minq)*exp(-dt/(tau))+Rp*minq+1/C*exp(-dt/(tau))*(0+dt*minq);
pdiff1_h0_0 = p1_h0_0 - p0;

h0 = C/exp(-dt/(tau))*(p0-Rp*minq)-dt*minq;
p1_h0 = (p0-Rp*minq)*exp(-dt/(tau))+Rp*minq+1/C*exp(-dt/(tau))*(h0+dt*minq);

%h_inf = exp(-dt/(tau))*dt*FL_q/(1-exp(-dt/(tau)))  %BE
h_inf = (exp(-dt/(tau))*dt*minq+dt*minq)/(2-2*exp(-dt/(tau))) ;  %CN
h_inf1 = exp(-dt/(tau))*(h_inf+dt*.5*minq)+.5*minq*dt;  %CN check
p1_h_inf = Rp*minq+1/C*(exp(-dt/(tau))*(h_inf+dt*.5*minq)+.5*minq*dt);

h_inf = 1.6e-6;
p1_h_1 = Rp*minq+1/C*h_inf; %CN check