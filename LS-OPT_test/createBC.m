clc; close all; clear all;
%%
readfile = 'lsppout';
filename = 'bcinfo.k';
%% read lsspout file
fileID = fopen(readfile);


fclose(fileID);

%%
% if isfile(filename)
%     delete(filename)
%     fprintf('file deleted\n');
% end
% 
% edit(filename);

%%