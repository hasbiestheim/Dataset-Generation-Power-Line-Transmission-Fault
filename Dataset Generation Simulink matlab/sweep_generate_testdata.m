%set parameter sweep

%set parameter sweep

% fault distance line1+line2=300km
%line1=[20 40 60 80 100 120 140 160 180]
line1 = [15 115 170]
line2 = 300 -line1
% fault resistance
faultres = [0.1 45 95]
Vn=[]
for i = 1:length(line1)
    for j = 1:length(faultres)
        simIn(i,j) = Simulink.SimulationInput('power_3pfault_generate_testdata');
        simIn(i,j) = setVariable(simIn(i,j),'line1',line1(i));
        simIn(i,j) = setVariable(simIn(i,j),'line2',line2(i));
        simIn(i,j) = setVariable(simIn(i,j),'faultres',faultres(j));
        out(i,j)   = sim(simIn(i,j));
        V= out(i,j).Sig_B1.signals(1).values;  
        I= out(i,j).Sig_B1.signals(2).values;
        %V = V(333:end,1:3) old dataset setting
        %I = I(333:end,1:3)
        Vnew = V(166:499,1:3);
        Inew = I(166:499,1:3);
        VI = [Vnew,Inew];
        %faultfile = sprintf('test2/CG_%d_%0.2f.mat',line1(i),faultres(j));
        %save(faultfile,'VI');
        Vn = [Vn;VI]

        %Vn(i,j) = VI
    end 
end
%plot voltage
%plot(out(1,1).Sig_B1.signals(1).values)

% V = out.Sig_B1.signals(1).values  
% I = out.Sig_B1.signals(2).values 
% VI = [V,I]
% plot(VI)
%plot voltage
%plot(out(1,1).Sig_B1.signals(1).values)
%faulttype = ["A_G", "B_G","C_G", "A_B","A_C","B_C","AB_G","AC_G","BC_G","ABC_G","NON_fault"]