clc; close all; clear all;
%%
DIR = dir;
%%
text = ' Element deleted due';
%%

iPart = 0;
for i = 1:length(DIR)
    file = DIR(i).name;
    
    if contains(file,'mes')
       file
             
       fid = fopen(file,'r');    
       
       tline = fgetl(fid);
       while ischar(tline)
%            disp(tline)
           if contains(tline, text)
               iPart = iPart + 1;
           end
           % Read next line
           tline = fgetl(fid);
       end

       fclose(fid);
    end    
end
fprintf('\n');
fprintf('-------------------------------------------------\n');
fprintf(['      # of converted particles: ',num2str(iPart),'\n']);
fprintf('-------------------------------------------------\n');