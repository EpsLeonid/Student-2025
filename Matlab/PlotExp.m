%Script puilds a plot of exponentional function which is set by constants
%and value of t. Array of Exp. function is Generated in MassGen function

%const. input
Ts1=16;
Ts2=5;
%x range
t=[-10:100];
%function (y(x))
Msv = MassGen(t,Ts1,Ts2);
%plot
plot(t,Msv);
