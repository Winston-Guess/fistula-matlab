clear;
pmaxA = 8000;
pmaxV = 7700;
Dens = 1060;
Areatrue = pi()*0.0025^2;
Area = 1.9555296e-05; %Min Feature size 2e-7

m_minA=0.009742448*.3;
m_maxA=0.009742448*.3*(.65/.5);
m_minV=0.009742448*.7;
m_maxV=0.009742448*.7*(.65/.5);

q_maxA = m_maxA/Dens;
q_maxV = m_maxV/Dens;

q_minA = 2.6234911092757857e-06;
q_minV = 6.5674925992847828e-06;

Rp_A = pmaxA/q_maxA;
Rp_V = pmaxV/q_maxV;

pminA = q_minA*(Rp_A);
pminV = q_minV*(Rp_V);