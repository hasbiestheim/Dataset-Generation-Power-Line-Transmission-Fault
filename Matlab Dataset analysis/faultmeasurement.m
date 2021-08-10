%conver out.mat from fault type file to 1232 fault

% fault distance line1+line2=300km
line1=[20 40 60 80 100 120 140 160 180 200 220 240 260 280]
line2=300 -line1
% fault resistance
faultres = [0.01 5 15 20 30 40 50 100]  
faulttype = ["A_G", "B_G","C_G", "A_B","A_C","B_C","AB_G","AC_G","BC_G","ABC_G","NON_fault"]
tic
for k = 1:length(faulttype)
    file = sprintf('%s.mat',faulttype(k))
    load(file)
    for i = 1:length(line1)
        for j = 1:length(faultres)
            V= out(i,j).Sig_B1.signals(1).values;
            I= out(i,j).Sig_B1.signals(2).values;
            faultfile = sprintf('allmeasure/%s_%d_%0.2f.mat',faulttype(k),line1(i),faultres(j))
            Vnew = V(1:1667,1:3) % get voltage fault data only
            Inew = I(1:1667,1:3) % get current fault data only
            VI = [Vnew,Inew]
            %save(faultfile,'V','I'); % save all measurement
            save(faultfile,'VI');
            
           
        end    
    end
end
toc