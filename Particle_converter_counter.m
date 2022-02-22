clc; close all; clear all;
%%
DIR = dir;
%%
iPart  = 0;
iPartT = 0;
%%
for i = 1:length(DIR)
    file = DIR(i).name;
    
    if contains(file,'mes')
       file
             
       fid = fopen(file,'r');    
       
       tline = fgetl(fid);
       while ischar(tline)
%            disp(tline)
           if contains(tline,'Element deleted due')
               iPart = iPart + 1;
           end
           
           if contains(tline,'Element deleted due to temperature')
               iPartT = iPartT + 1;
           end
           % Read next line
           tline = fgetl(fid);
       end

       fclose(fid);
    end    
end

%% displaying
fprintf('\n');
fprintf('----------------------------------------------------------\n');
fprintf(['  # of converted particles:                    ',num2str(iPart),'\n']);
fprintf(['  # of converted particles due to temperature: ',num2str(iPartT),'\n']);
fprintf(['    perc converted due to temperature:         ',num2str(iPartT/iPart*100,3),'\n']);
fprintf('----------------------------------------------------------\n');