clc; close all; clear all;
%%
readfile = 'lsppout';
writefile = 'bcinfo.k';
%%
ytop =  20; % upper bound geometry
ybot = -20; % lower bound geometry

TOL_g = 1e-4; % geometric tolerance
%%
nodesz = 1:106;
nodesy = 2:2:137;

nodesz = nodesz';
nodesy = nodesy';

%% Write output file
if isfile(writefile)
    delete(writefile)
%     fprintf('file deleted\n');
end

edit(writefile);

% Write Z node list
nodesz = [nodesz; zeros(8-mod(length(nodesz),8),1)];

fid = fopen(writefile,'w');
fprintf(fid,'*KEYWORD\n');
fprintf(fid,'*SET_NODE_LIST\n');
fprintf(fid,'$#     sid       da1       da2       da3       da4    solver\n');
fprintf(fid,'         1       0.0       0.0       0.0       0.0MECH\n');
fprintf(fid,'$#    nid1      nid2      nid3      nid4      nid5      nid6      nid7      nid8\n');

linenr = 0;
for i = 1:length(nodesz)
    linenr = linenr + 1;
    
    if nodesz(i) < 10
        fprintf(fid,'         %d',nodesz(i));
    elseif nodesz(i) >= 10 && nodesz(i) < 100
        fprintf(fid,'        %d',nodesz(i));
    elseif nodesz(i) >= 100 && nodesz(i) < 1000
        fprintf(fid,'       %d',nodesz(i));
    elseif nodesz(i) >=1000 && nodesz(i) < 10000
        fprintf(fid,'      %d', nodesz(i));
    else
        fprintf(fid,'     %d',nodesz(i));
    end
 
    if linenr == 8
        fprintf(fid,'\n');
        linenr = 0;
    end
end

% Write Y node list
nodesy = [nodesy; zeros(mod(8-length(nodesy),8),1)];
fprintf(fid,'*SET_NODE_LIST\n');
fprintf(fid,'         2       0.0       0.0       0.0       0.0MECH\n');

linenr = 0;
for i = 1:length(nodesy)
    linenr = linenr + 1;
    
    if nodesy(i) < 10
        fprintf(fid,'         %d',nodesy(i));
    elseif nodesy(i) >= 10 && nodesy(i) < 100
        fprintf(fid,'        %d',nodesy(i));
    elseif nodesy(i) >= 100 && nodesy(i) < 1000
        fprintf(fid,'       %d',nodesy(i));
    elseif nodesy(i) >=1000 && nodesy(i) < 10000
        fprintf(fid,'      %d', nodesy(i));
    else
        fprintf(fid,'     %d',nodesy(i));
    end
 
    if linenr == 8
        fprintf(fid,'\n');
        linenr = 0;
    end
end
fprintf(fid,'*END\n');

fclose(fid);
