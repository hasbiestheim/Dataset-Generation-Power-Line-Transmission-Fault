%plot data fault from fault measurement

% fault distance line1+line2=300km
%line1=[20 40 60 80 100 120 140 160 180 200 220 240 260 280]
%line2=300 -line1

% fault resistance
%faultres = [0.01 5 15 20 30 40 50 100]
%[Vf,If] = signalfault(n)

%[Vf,If] = @signalfault;
lined = 100 % set parameter to plot
faultres = 0.01 % set parameter to plot
faulttype = ["AG", "BG","CG", "AB","AC","BC","ABG","ACG","BCG","ABCG","NONfault"]
%load('fault/A_G_40_0.01.mat')

figure('name','Fault Signal');
n=1
[V I] = signalfault(n,lined,faultres)
ax1 = subplot(6,4,1); 
%x = linspace(0,3);
plot(ax1,V)
title(ax1,'Voltage '+faulttype(n))

ax2 = subplot(6,4,5); 
plot(ax2,I)
title(ax2,'Current '+faulttype(n))

n=2
[V I] = signalfault(n,lined,faultres)
ax3 = subplot(6,4,2); 
plot(ax3,V)
title(ax3,'Voltage '+faulttype(n))

ax4 = subplot(6,4,6); 
y = linspace(0,500);
plot(ax4,I)
title(ax4,'Current '+faulttype(n))


n=3
[V I] = signalfault(n,lined,faultres)
ax1 = subplot(6,4,3); 
%x = linspace(0,3);
plot(ax1,V)
title(ax1,'Voltage '+faulttype(n))

ax2 = subplot(6,4,7); 
plot(ax2,I)
y = linspace(0,100);
title(ax2,'Current '+faulttype(n))

n=4
[V I] = signalfault(n,lined,faultres)
ax3 = subplot(6,4,4); 
%x = linspace(0,3);
plot(ax3,V)
title(ax3,'Voltage '+faulttype(n))

ax4 = subplot(6,4,8); 
plot(ax4,I)
title(ax4,'Current '+faulttype(n))


n=5
[V I] = signalfault(n,lined,faultres)
ax1 = subplot(6,4,9); 
%x = linspace(0,3);
plot(ax1,V)
title(ax1,'Voltage '+faulttype(n))

ax2 = subplot(6,4,13); 
plot(ax2,I)
title(ax2,'Current '+faulttype(n))

n=6
[V I] = signalfault(n,lined,faultres)
ax3 = subplot(6,4,10); 
%x = linspace(0,3);
plot(ax3,V)
title(ax3,'Voltage '+faulttype(n))

ax4 = subplot(6,4,14); 
plot(ax4,I)
title(ax4,'Current '+faulttype(n))


n=7
[V I] = signalfault(n,lined,faultres)
ax1 = subplot(6,4,11); 
%x = linspace(0,3);
plot(ax1,V)
title(ax1,'Voltage '+faulttype(n))

ax2 = subplot(6,4,15); 
plot(ax2,I)
title(ax2,'Current '+faulttype(n))

n=8
[V I] = signalfault(n,lined,faultres)
ax3 = subplot(6,4,12); 
%x = linspace(0,3);
plot(ax3,V)
title(ax3,'Voltage '+faulttype(n))

ax4 = subplot(6,4,16); 
plot(ax4,I)
title(ax4,'Current '+faulttype(n))


n=9
[V I] = signalfault(n,lined,faultres)
ax1 = subplot(6,4,17); 
%x = linspace(0,3);
plot(ax1,V)
title(ax1,'Voltage '+faulttype(n))

ax2 = subplot(6,4,21); 
plot(ax2,I)
title(ax2,'Current '+faulttype(n))

n=10
[V I] = signalfault(n,lined,faultres)
ax3 = subplot(6,4,18); 
%x = linspace(0,3);
plot(ax3,V)
title(ax3,'Voltage '+faulttype(n))

ax4 = subplot(6,4,22); 
plot(ax4,I)
title(ax4,'Current '+faulttype(n))


n=11
[V I] = signalfault(n,lined,faultres)
ax1 = subplot(6,4,19); 
%x = linspace(0,3);
plot(ax1,V)
title(ax1,'Voltage '+faulttype(n))

ax2 = subplot(6,4,23); 
plot(ax2,I)
title(ax2,'Current '+faulttype(n))


slined = sprintf('Fault distance %d km',lined)
sfaultres = sprintf('Fault resistance %d ohm',faultres)
ax1 = subplot(6,4,20); 
%x = linspace(0,3);
plot(ax1,1)
title(ax1,slined)

ax2 = subplot(6,4,24); 
plot(ax2,1)
title(ax2,sfaultres)