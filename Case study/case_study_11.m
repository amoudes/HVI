clc; close all; clear all;
%%
plot_figs = 'y';
%% 
Sheet = 4;

if Sheet == 4
    Sheet_name = 'W700-SHTB1';
elseif Sheet == 5
    Sheet_name = 'W700-SHTB2';
elseif Sheet == 6
    Sheet_name = 'W700-SHTB3';
else
    error('Sheet name not found\n');
end

%% Read data
copyfile Material_test_data-W700_(2).xlsx Material_test_data-W700_(2)2.xlsx;

DATA = readcell('Material_test_data-W700_(2)2.xlsx','Sheet',Sheet_name);

delete Material_test_data-W700_(2)2.xlsx;
%% Process data
t        = DATA(15:end,1);
sigma_e  = DATA(15:end,2);
eps_e    = DATA(15:end,3);
eps_edot = DATA(15:end,4);


t        = cell2mat(t);
sigma_e  = cell2mat(sigma_e)*1000;
eps_e    = cell2mat(eps_e);
eps_edot = cell2mat(eps_edot);

Dx0 = DATA{7,2};
Dy0 = DATA{7,2};

%% 11)
E = 2.1e5;

eps_ldot = 1./(1 + eps_e).*eps_edot;

pdot = eps_ldot;

eps_l  = log(1 + eps_e);

sigma_t = sigma_e.*(1 + eps_e);

eps_pl = eps_l - E./sigma_t;
eps_pe = eps_e - E./sigma_e;

if strcmp(plot_figs,'y')
   figure(111);
   plot(eps_pe,sigma_e);
   xlabel('\epsilon_e^p'); ylabel('\sigma_e'); grid on;
   
   figure(112);
   plot(eps_pl,sigma_t);
   xlabel('\epsilon_l^p'); ylabel('\sigma_t'); grid on;
end