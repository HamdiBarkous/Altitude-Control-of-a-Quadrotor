% asservissement sans correcteur
sys = tf(6.5359,[1 10.784 0 0]);
H = [1];
M  = feedback(sys , H);
step(M);
hold on ;
 %%-----------------------------------------------%% 
% asservissement avec correcteur
num = [6.5359]
denom = [1 10.784 0 0]
Gp = tf(num, denom)
H= [1]
numcor = [9.081 1.938]
denomcor = [ 0.0085 1]
Gpcor = tf(numcor , denomcor )
M = feedback(Gp*Gpcor , H )
step(M)
grid on
hold on
%--------------------------------------------------%
% Retour d'état
C = [6.563 0 0 ]
B = [0;0;1]
A=[0 1 0;
    0 0 1;
    0 0 -10.78]

ob = obsv(A,C)
Ct = ctrb(A,B)
a=rank(ob)
b = rank(Ct);
p=[-3.5+3.57j -3.5-3.57j -0.27 ];

k=place(A,B,p)

%-------------------------------------------------------%
% Commande RST
num = [6.5359];
denom = [1 10.784 0 0];
Gp = tf(num, denom);
Ts = 0.2;
H = c2d(Gp,Ts);

AA=[ 1 0 0 0 0 0;
    -2.116 1 0 0.00549 0 0;
    1.231 -2.116 1 0.01404 0.00549 0;
    0.01157 1.231 -2.116 0.01906 0.01404 0.00549;
    0 0.01157 1.231 0 0.001906 0.01404;
    0 0 0.01157 0 0 0.001906];
pp=[0.986;
    0.160;
    0.0576;
    0.932;
    0.90006];
O=poly(pp)
X=inv(AA)*transpose(O)
R=[ X(4) X(5) X(6)] 
S=[ 1 X(2) X(3)] 
T=46.65*O
