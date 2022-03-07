clc; close all; clear all;
%% Read excel file
copyfile Results.xlsx Results2.xlsx;

T = readcell('Results2.xlsx','Sheet','mat_param','Range','D7:BB44');

delete Results2.xlsx;
%% Input parameters
Damage_model = 'JC';
Material_card = 'A12';
%% identify column
for i = 1:length(T)
    if strcmp(T{1,i},Material_card)
        matID = i;
    end
end

%% Create txt file
fprintf('Writing file\n');
fid = fopen('matfile.txt','wt');

if strcmp(Damage_model,'JC')
    fprintf(fid,'*MAT_JOHNSON_COOK_TITLE\n');
    fprintf(fid,'%s\n',T{2,matID});
    fprintf(fid,'$#     mid        ro         g         e        pr       dtf        vp    rateop\n');
    fprintf(fid,'         3 %.3E %.3E %.3E %.3E       0.0       1.0       0.0\n',...
        [T{3,matID},T{5,matID},T{7,matID},T{8,matID}]);
    fprintf(fid,'$#       a         b         n         c         m        tm        tr      epso\n');
    fprintf(fid,' %.3E %.3E %.3E %.3E %.3E %.3E %.3E %.3E\n',...
        [T{18,matID},T{19,matID},T{20,matID},T{21,matID},T{22,matID},T{14,matID},T{16,matID},T{12,matID}]);
    fprintf(fid,'$#      cp        pc     spall        it        d1        d2        d3        d4\n');
    fprintf(fid,' %.3E       0.0       2.0       1.0',T{10,matID});
    
    if T{30,matID} < 0 % d1
        fprintf(fid,'%.3E',T{30,matID});
    else
        fprintf(fid,' %.3E',T{30,matID});
    end
    
    if T{31,matID} < 0 % d2
        fprintf(fid,'%.3E',T{31,matID});
    else
        fprintf(fid,' %.3E',T{31,matID});
    end
    
    if T{32,matID} < 0 % d3
        fprintf(fid,'%.3E',T{32,matID});
    else
        fprintf(fid,' %.3E',T{32,matID});
    end
    
    if T{33,matID} < 0 % d4
        fprintf(fid,'%.3E\n',T{33,matID});
    else
        fprintf(fid,' %.3E\n',T{33,matID});
    end
    
    fprintf(fid,'$#      d5      c2/p      erod     efmin    numint\n');
    
    if T{34,matID} < 0 % d5
        fprintf(fid,'%.3E',T{34,matID});
    else
        fprintf(fid,' %.3E',T{34,matID});
    end
    fprintf(fid,'       0.0         01.00000E-6       1.0\n');
    fprintf(fid,'*EOS_LINEAR_POLYNOMIAL_TITLE\n');
    fprintf(fid,'%s\n',T{2,matID});
    fprintf(fid,'$#   eosid        c0        c1        c2        c3        c4        c5        c6\n');
    
    fprintf(fid,'         3       0.0 %.3E       0.0       0.0       0.0       0.0       0.0\n',T{4,matID});
    fprintf(fid,'$#      e0        v0\n');
    fprintf(fid,'       0.0       0.0');
     
else
    warning('MJC not implemented');
end

fclose(fid);
fprintf('Mat file written\n\n');
fprintf('----------------\n');
fprintf('----- Done -----\n');
fprintf('----------------\n');


