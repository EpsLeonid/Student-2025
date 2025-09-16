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
   if (n<=k)
       d(n) = Msv(n);
   elseif (n>k)&&(n<=l)
       d(n) = Msv(n)-Msv(n-k);
   elseif (n>l)&&(n<=l+k)
       d(n) = Msv(n)-Msv(n-k)-Msv(n-l);
   else
       d(n) = Msv(n)-Msv(n-k)-Msv(n-l)+Msv(n-k-l);
   end
   
   
   if (n>1)
       p(n) = p(n-1)+d(n);
       r(n) = p(n)+M*d(n);
       Trap(n) = Trap(n-1)+r(n);
   else
       p(n) = d(n);
       r(n) = p(n)+M*d(n);
       Trap(n) = r(n);
   end
end
end

