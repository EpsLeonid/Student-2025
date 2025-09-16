function [ Msv ] = MassGen( t, Ts1, Ts2 )
% MassGen function generate array of points of a given math function
% For every point from 1st to end of array of t value of function is set


for n=1:numel(t)
   if t(n)<0  
       Msv(n)=0;
   else
       Msv(n) = exp(-t(n)/Ts1)-exp(-t(n)/Ts2);
   end
end
end

