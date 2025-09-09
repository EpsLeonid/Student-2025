function [ output_args ] = Untitled( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%variable input
Ts1=16;
Ts2=5;

t=[1:10];
%math function

Msv = exp(-t/Ts1)-exp(-t/Ts2);
%plot
plot(t,Msv(t));
end

