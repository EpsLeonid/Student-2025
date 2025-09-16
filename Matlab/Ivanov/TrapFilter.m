function [Trap] = TrapFilter(t,Msv)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%N - number of points in t array
N=numel(t);

d=zeros(1,N);
p=zeros(1,N);
r=zeros(1,N);
Trap=zeros(1,N);
%const define
k=5;
l=8;
M=16;

for n=1:N
   if (t(n)>0)&&(n<l+k)
       d(n) = Msv(n)-Msv(n-k)-Msv(n-l);
       p(n) = p(n-1)+d(n);
       r(n) = p(n)+M*d(n);
       Trap(n) = Trap(n-1)+r(n);
   end
   if (t(n)>0)&&(n>l+k)
       d(n) = Msv(n)-Msv(n-k)-Msv(n-l)+Msv(n-k-l);
       p(n) = p(n-1)+d(n);
       r(n) = p(n)+M*d(n);
       Trap(n) = Trap(n-1)+r(n);
   end
end
end

