clc; close all; clear all;
%%
material = {'A2','S2','T4','M4'};

t = [0.8/3*2, 0.8, 0.8/3*4];

d = 9.58;
td = t./d;

v = [5.5, 6.7, 7.5];
%%
fid = fopen('k_file_names.txt','w');

count = 0;
for i = 1:length(material)
    for j = 1:length(td)
        for k = 1:length(v)
            count = count + 1;
            name = [num2str(count),'_',material{i},'_td',num2str(td(j),3),'_v',num2str(v(k))];
            fprintf('%s\n',name);
            
%             if ~exist(name, 'dir')
%                 mkdir(name)
%             end
    
            fprintf(fid,'"%s" ',name);
        end
    end
end

fclose(fid);
