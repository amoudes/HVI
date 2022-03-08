clc; close all; clear all;
%%
plot_figs = 'yes';
%% 
Sheet = 1;

if Sheet == 1
    Sheet_name = 'W700-QS1';
elseif Sheet == 2
    Sheet_name = 'W700-QS2';
elseif Sheet == 3
    Sheet_name = 'W700-QS3';
elseif Sheet == 4
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
t   = DATA(14:end,1);
F   = DATA(14:end,2);
Pos = DATA(14:end,3);
Dx  = DATA(14:end,4);
Dy  = DATA(14:end,5);

t   = cell2mat(t);
F   = cell2mat(F)*1000;
Pos = cell2mat(Pos);
Dx  = cell2mat(Dx);
Dy  = cell2mat(Dy);

Dx0 = DATA{7,2};
Dy0 = DATA{7,2};

%% 2)
dDx = Dx0 - Dx;
dDy = Dy0 - Dy;

if strcmp(plot_figs,'yes')
    figure(2);
    plot(dDx,F,'DisplayName','\DeltaD_x'); hold on;
    plot(dDy,F,'DisplayName','\DeltaD_y'); grid on;
    ylabel('F'); xlabel('\DeltaD_i');
    legend;
end
%% 3)
A = pi.*Dx.*Dy./4;

%% 4)
A0 = pi*Dx0*Dy0/4;

sigmat = F./A;

epsl = log(A0./A);

if strcmp(plot_figs,'yes')
    figure(4);
    plot(epsl,sigmat);
    xlabel('\epsilon_l'); ylabel('\sigma_t'); grid on;
end

%% 5)
Em = (sigmat(2600) - sigmat(5)) / (epsl(2600) - epsl(5));

Ec = 210000;

deps = (Em - Ec)/(Em*Ec).*sigmat;

epsc = epsl + deps;

Em2 = (sigmat(2600) - sigmat(5)) / (epsc(2600) - epsc(5));

%% 6)

epsp = epsc - sigmat./Em2;

epsp   = epsp(2800:end);
sigmat = sigmat(2800:end);

if strcmp(plot_figs,'yes')
   figure(6);
   plot(epsp,sigmat);
   xlabel('\epsilon_p'); ylabel('\sigma_t'); grid on;    
end

%% 7)
[Fmax,col] = max(F);

epspu = epsc(col);

%% 8)
aR = 1.1*(epsp - epspu);

denum = (1 + 2./aR).*log(1 + aR./2);
sigmaeq = sigmat./denum;

p = epsp;

if strcmp(plot_figs,'yes')
   figure(8);
   plot(p,sigmaeq,'displayname','\sigma_{eq}'); hold on;
   plot(epsp,sigmat,'displayname','\sigma_t');
   xlabel('p'); ylabel('\sigma [MPa]'); legend('location','northwest');
   grid on;    
end

%% 9) 
f = fittype('a+b*x^c');
[fit1,gof,fitinfo] = fit(p,sigmaeq,f,'StartPoint',[830 300 1]);

if strcmp(plot_figs,'yes')
   figure(8);
   plot(fit1);
end

fit1

%% 10)

[~,col] = max(sigmat);
pf = epsp(col);
Wc = trapz(epsp(1:col),sigmat(1:col))




