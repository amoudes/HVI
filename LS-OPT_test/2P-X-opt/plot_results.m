clc; close all; clear all;
%%
set(0,'defaultTextInterpreter','latex'); % set the default
set(groot,'defaultAxesTickLabelInterpreter','latex');  

DATA = readtable('lsopt_points.csv');
% DATA = table2array(DATA);

sim = table2array(DATA(277:299,68));
simsnr = table2array(DATA(1:276,2:3));
% sim = DATA(277:299,68);

for i = 1:length(sim)
   iter(i) = floor(sim(i));
   
   var(i) = sim(i)*100 - iter(i)*100;
   var(i) = round(var(i));
   
   if mod(var(i),10) == 0
       var(i) = var(i)/10;
   end
   %
   
   row = find(simsnr(:,1) == iter(i) & simsnr(:,2) == var(i),75);
   
   AvgDisp(i) = table2array(DATA(row,65)); 
end

fig = figure(10);
design = 0;
for i = 1:length(sim)
   if i == 1
       design = design + 1;
       plot(i,AvgDisp(i),'r.','MarkerSize',14); hold on;
       text(i,AvgDisp(i)+0.04,num2str(design));
   else
       if AvgDisp(i-1) == AvgDisp(i)
           plot(i,AvgDisp(i),'k.','MarkerSize',10); hold on;
       else
           design = design + 1;
           plot(i,AvgDisp(i),'r.','MarkerSize',14); hold on;
           text(i,AvgDisp(i)+0.04,num2str(design));
       end
   end
    
end



grid on;
xlabel('iteration [-]'); ylabel('Averge Displacement [mm]');
ylim([0 1.5]);
xlim([1 23])