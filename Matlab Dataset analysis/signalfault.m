function [V I] = signalfault(n,lined,faultres)
    faulttype = ["A_G", "B_G","C_G", "A_B","A_C","B_C","AB_G","AC_G","BC_G","ABC_G","NON_fault"]
    files = sprintf('fault/%s_%d_%0.2f.mat',faulttype(n),lined,faultres)
    load(files);
    V = VI(1:end,1:3);
    I = VI(1:end,4:6);
end

