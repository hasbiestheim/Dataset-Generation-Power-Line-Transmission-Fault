%set parameter sweep

% fault distance line1+line2=300km
line1 = [20 40 60 80 100 120 140 160 180 200 220 240 260 280]
line2 = 300 -line1
% fault resistance
faultinception3 = [0 30 60 90 120 150 180 210 240 270 300 330] %for printf
%faultinception = [0,0.08,0.16,0.25,0.33,0.42,0.5,0.59,0.67,0.75,0.84,0.92]
faultinception = [0.017,0.018,0.019,0.02,0.022,0.024,0.025,0.027,0.028,0.029,0.031,0.032] %time fault
faultres = [5 10 15 20 25 30 40 50 60]
faulttype = ["AG", "BG","CG", "AB","AC","BC","ABG","ACG","BCG","ABCG","NONfault"]
%faultinception =  (1+faultinception)/60

tic 
for i = 1:length(line1)
    for j = 1:length(faultres)
        for k = 1:length(faultinception)
            simIn(i,j) = Simulink.SimulationInput('power_3pfault_parametertest');
            simIn(i,j) = setVariable(simIn(i,j),'line1',line1(i));
            simIn(i,j) = setVariable(simIn(i,j),'line2',line2(i));
            simIn(i,j) = setVariable(simIn(i,j),'faultres',faultres(j));
            faultinception2 = [faultinception(k) 6/60]
            simIn(i,j) = setVariable(simIn(i,j),'faultinception',faultinception2);
            out(i,j)   = sim(simIn(i,j));
            V= out(i,j).Sig_B1.signals(1).values;  
            I= out(i,j).Sig_B1.signals(2).values;
            %prefault +10
            Vnew = V(323:656,1:3);
            Inew = I(323:656,1:3);
            VI = [Vnew,Inew];
            faultfile = sprintf('training/train/BG_%d_%0.2f_%d_10.mat',line1(i),faultres(j),faultinception3(k));
            save(faultfile,'VI');
            %prefault +20
            Vnew = V(314:647,1:3);
            Inew = I(314:647,1:3);
            VI = [Vnew,Inew];
            faultfile = sprintf('training/train/BG_%d_%0.2f_%d_20.mat',line1(i),faultres(j),faultinception3(k));
            save(faultfile,'VI');
            %prefault +30
            Vnew = V(305:638,1:3);
            Inew = I(305:638,1:3);
            VI = [Vnew,Inew];
            faultfile = sprintf('training/train/BG_%d_%0.2f_%d_30.mat',line1(i),faultres(j),faultinception3(k));
            save(faultfile,'VI');
        end
    end    
end
toc
%plot voltage
%plot(out(1,1).Sig_B1.signals(1).values)
