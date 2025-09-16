%Script builds a plot of exponentional function which is set by constants
% and value of t. Array of  Exp. function points is Generated in MassGen function

%const. input
Ts1=16;
Ts2=5;
%x range
t=[-15:100];
%function (y(x))
Msv = MassGen(t,Ts1,Ts2);

Trap = TrapFilter(t,Msv);
%plot
subplot(2,1,1);
plot(t,Msv);
subplot(2,1,2);
plot(t,Trap);