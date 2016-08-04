%Fancy GP Visualization 
particles = randn(1000,50); %The number of particles.
x         = (1:50)'; %X is the size of the matrix.
inc = 0.001; 
conf = 0.95; %95 confidence intervals
%%
%Increase the confidence bounds.
close all;
bands = 0.95/inc; 
t =  (1 - 0.95)/2; 

upper = 1 - t;     %Upper quantile
q = 0.5:inc:0.975; %Quantiles of the plot.

quant = quantile(particles,q)';
col = (1:size(quant,2))*(1/size(q,2));
col = col.^2;

for i = 2:size(quant,2)
   h = fill([x;flip(x,1)],[quant(:,i-1);flip(quant(:,i))],col(i)*ones(1,3));
   set(h,'EdgeColor','none')
    hold on;
end
%hold on;
%plot(x,quant(:,i),'k--');

q = 0.5:-inc:0.025; %Quantiles of the plot.
quant = quantile(particles,q)';

for i = 2:size(quant,2)
   h = fill([x;flip(x,1)],[quant(:,i-1);flip(quant(:,i))],col(i)*ones(1,3));
   set(h,'EdgeColor','none')
    hold on;
end

%hold on;
%plot(x,quant(:,i),'k--');
%hold on;
plot(x,mean(particles,1),'r-','linewidth',2)
