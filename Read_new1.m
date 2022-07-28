clear all; close all; clc;
tic
fminuncOptions = optimoptions(@fmincon,'PlotFcn',{'optimplotfval',...
    'optimplotx'});
options=optimoptions(@ga,'HybridFcn',{@fmincon,fminuncOptions},'TolCon',...
    0.000001);

[p,b]=ga(@Muskerror_New1,5,[],[],[],[],[0.000,0.0,0.0,0.0,0],...
    [5,5,5,1,5],[], options)


toc

