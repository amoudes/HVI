clc; close all; clear all;
%%
plot_figs = 'yes';
run_LS    = 'no';

%%
Lx  = 15;            % Horizontal length of one strut
Ly  = 15;
hmax = 0.25;
t = 2*hmax;
% t   = 0.025*Lx;    % Wall thickness
% hmax = 0.2;        % max element size

ny  = 5;             % Number of vertical repeating cells

dx = 100;            % horizontal position wall

TOL_g = 1e-4;        % geometric tolerance
%%
%      1 2  3  4    5    6  7      8
Cds = [0 0  Lx 2*Lx 2*Lx Lx 0.5*Lx 1.5*Lx 
       0 Ly Ly Ly   0    0  0.5*Ly 0.5*Ly];

% Determine node type
% 0 = free
% 1 = fix x
% 2 = fix y
% 3 = fix xy
%        1 2 3 4 5 6 7 8   
Ctype = [0 0 0 0 0 0 0 0]; 
Plottype = [3 1 0 1 3 2 0 0];

Lines = [1 2 3 6 6 3 4 5 1 4
         7 7 7 7 8 8 8 8 2 5];
     
nCds   = length(Cds);
nLines = length(Lines);
%%
for n = 1:ny-1
    cd = [0             Lx            2*Lx          0.5*Lx        1.5*Lx
          Cds(2,2)+n*Ly Cds(2,3)+n*Ly Cds(2,4)+n*Ly Cds(2,7)+n*Ly Cds(2,8)+n*Ly];
    %              1 2 3 4 5
    Ctype = [Ctype 0 0 0 0 0];
    Plottype = [Plottype 1 0 1 0 0];
    
    nCds = nCds + 5;
    Cds = [Cds cd];
    
    if n == 1  
        line = [2  9  10 3  3  10 11 4  9 11
                12 12 12 12 13 13 13 13 2 4];
    else
        line = [nCds-9 nCds-4 nCds-3 nCds-8 nCds-8 nCds-3 nCds-2 nCds-7 nCds-9 nCds-2
                nCds-1 nCds-1 nCds-1 nCds-1 nCds   nCds   nCds   nCds   nCds-4 nCds-7];
    end
    Lines  = [Lines line];
    nLines = nLines + 10; 
end

perimeterLines = [8 5 4 1 9];
for i = 1:ny-1
    perimeterLines = [perimeterLines 9+10*i];
end
perimeterLines = [perimeterLines nLines-8 nLines-7 nLines-4 nLines-3 nLines];
for i = 1:ny-1
   perimeterLines = [perimeterLines nLines-i*10]; 
end

%% Alter node types
Ctype(end-4) = 0;
Ctype(end-2) = 0;
Ctype(end-3) = 0;

Plottype(end-4) = 3;
Plottype(end-2) = 2;
Plottype(end-3) = 3;

Plottype(17) = 2;
Plottype(18) = 2;
%% Determine triangles
nTri = ny*2;
nSqu = ny + (ny-1)*2;


Tri = [2 8
       1 7
       9 10];
   
Sq = [4
      3
      6
      5];
  
for n = 1:ny-1
   % Triangles
   tri = Tri(:,1:2) + n*10;
   Tri = [Tri tri];
   
   if n == 1
       sq = [ 3  7
             14 18
             11 15
              2  6];
       Sq = [Sq sq Sq(:,1)+10];
       
   else
       Sq = [Sq Sq(:,2:4) + (n-1)*10];
   end
end

% if Lx > 1.5 || Ly > 1.5
%     Tri = flip(Tri);
%     Sq = flip(Sq);
% end

%% repostion coordinates around origin
ytop = max(Cds(2,:));
ybot = min(Cds(2,:));

dy = (ytop + ybot)/2;
Cds(2,:) = Cds(2,:) - dy;

Cds(1,:) = Cds(1,:) + dx + t;
     
%% Plot shape
if strcmp(plot_figs,'yes')
    figure(10);
    for i = 1:length(Lines)
        node1 = Lines(1,i);
        node2 = Lines(2,i);
        
        cd1 = Cds(:,node1);
        cd2 = Cds(:,node2);
        
        x = [cd1(1) cd2(1)];
        y = [cd1(2) cd2(2)];
        
        plot(x,y,'k-');
        hold on; axis equal;
        
        %         text(mean(x),mean(y),num2str(i),'color','r','Fontsize',7.5);
    end
    
    for i = 1:length(Cds)
        if ismember(i,1:13)|| i == 17 || i == 18
            if Plottype(i) == 1
                plot(Cds(1,i),Cds(2,i),'b.','MarkerSize',15);
            elseif Plottype(i) == 2
                plot(Cds(1,i),Cds(2,i),'r.','MarkerSize',15);
            elseif Plottype(i) == 3
                plot(Cds(1,i),Cds(2,i),'g.','MarkerSize',15);
            else
                plot(Cds(1,i),Cds(2,i),'m.','MarkerSize',15);
            end
        else
            plot(Cds(1,i),Cds(2,i),'k.','MarkerSize',15);
        end
        
        text(Cds(1,i)+1,Cds(2,i),num2str(i));
    end
    axis off
    %
    plot([95 135],[0 0],'k--');
end
%% Write file
fid = fopen('create_mesh_wall.cfile','w');
fid2 = fopen('para01.cfile','w');
%
fprintf(fid,'bgstyle fade\n');
fprintf(fid,'openc command "para01.cfile"\n');
fprintf(fid,'cemptymodel\n');
fprintf(fid,'genselect target edge\n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'//DRAW POINTS AND BASIC GEOMETRY\n');

id = 0;
for i = 1:length(Cds)
   id = id + 1;
   if Ctype(i) == 0
       fprintf(fid,'mesh2d createrpoint %d &x%d &y%d \n',[id,i,i]);
       fprintf(fid2,'parameter x%d %.4f\n',[i,Cds(1,i)]);
       fprintf(fid2,'parameter y%d %.4f\n',[i,Cds(2,i)]);
   else
       fprintf(fid,'mesh2d createrpoint %d %.2f %.2f \n',[id,Cds(1,i),Cds(2,i)]);
   end 
end
fprintf(fid,'mesh2d acen\n');

% fprintf(fid,'skip\n');

for i = 1:length(Lines)
    id = id + 1;
    fprintf(fid,'mesh2d createline %d %d %d\n',[id,Lines(1,i),Lines(2,i)]);    
end
fprintf(fid,'mesh2d sbdown\n');
fprintf(fid,'home\n');
fprintf(fid,'ac\n');
fprintf(fid,'// OFFSET CURVES\n');


for i = 1:length(Tri)
   fprintf(fid,'// %d\n',i);
   fprintf(fid,'genselect target occobject\n');
   fprintf(fid,'occfilter clear\n');
   fprintf(fid,'occfilter add Edge Wire\n');
   fprintf(fid,'undogeom enter\n');
   fprintf(fid,'genselect occobject add occobject  %de\n',Tri(1,i));
   fprintf(fid,'genselect occobject add occobject  %de\n',Tri(2,i));
   fprintf(fid,'genselect occobject add occobject  %de\n',Tri(3,i));
%    fprintf(fid,'offsetgeom  planeedgewire %.3f tags 2 0 0 %de %d %d\n',[t,Tri(1,i),Tri(2,i),Tri(3,i)]);
   fprintf(fid,'offsetgeom  planeedgewire %.3f invert tags 2 0 0 %de %d %d\n',[t,Tri(1,i),Tri(2,i),Tri(3,i)]);
end

% fprintf(fid,'skip\n');



fprintf(fid,'//\n');
fprintf(fid,'// SQUARES\n');
for i = 1:length(Sq)
   fprintf(fid,'// %d\n',i);
   fprintf(fid,'genselect target occobject\n');
   fprintf(fid,'occfilter clear\n');
   fprintf(fid,'occfilter add Edge Wire\n');
   fprintf(fid,'undogeom enter\n');
   fprintf(fid,'genselect occobject add occobject  %de\n',Sq(1,i));
   fprintf(fid,'genselect occobject add occobject  %de\n',Sq(2,i));
   fprintf(fid,'genselect occobject add occobject  %de\n',Sq(3,i));
   fprintf(fid,'genselect occobject add occobject  %de\n',Sq(4,i));
%    fprintf(fid,'offsetgeom  planeedgewire %.3f tags 2 0 0 %de %d %d %d\n',[t,Sq(1,i),Sq(2,i),Sq(3,i),Sq(4,i)]);
   fprintf(fid,'offsetgeom  planeedgewire %.3f invert tags 2 0 0 %de %d %d %d\n',[t,Sq(1,i),Sq(2,i),Sq(3,i),Sq(4,i)]);
end
fprintf(fid,'genselect clear\n');

% fprintf(fid,'skip\n');

fprintf(fid,'//\n');
fprintf(fid,'// OUTER PERIMETER\n');
fprintf(fid,'// %d\n',i);
fprintf(fid,'genselect target occobject\n');
fprintf(fid,'occfilter clear\n');
fprintf(fid,'occfilter add Edge Wire\n');
fprintf(fid,'undogeom enter\n');

for i = 1:length(perimeterLines)
    fprintf(fid,'genselect occobject add occobject  %de\n',perimeterLines(i));    
end
fprintf(fid,'offsetgeom planeedgewire %.3f tags 2 0 0 %de ',[t,perimeterLines(1)]);
for i = 2:length(perimeterLines)
   fprintf(fid,'%d ',perimeterLines(i)); 
end
fprintf(fid,'\ngenselect clear\n');

% fprintf(fid,'skip\n');

fprintf(fid,'// DELETE UNNECESSARY LINEs\n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'geomag del 1e ');
for i = 2:length(Lines)
    fprintf(fid,'%d ',i);
end
fprintf(' \n');
fprintf(fid,'//\n');
fprintf(fid,'//\n');

% fprintf(fid,'skip\n');

% fprintf(fid,'//\n');
% fprintf(fid,'//\n');
% fprintf(fid,'// DRAW OUTER PERIMETER BOX\n');
% fprintf(fid,'genselect target occobject\n');
% fprintf(fid,'occfilter clear\n');
% fprintf(fid,'occfilter add Edge Face Wire RefPlane\n');
% fprintf(fid,'undogeom enter\n');
% fprintf(fid,'sketch loadall\n');
% fprintf(fid,'genselect target occobject\n');
% fprintf(fid,'occfilter add edge vertex RefAxis\n');
% fprintf(fid,'sketch setpln 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 1.00000000 1.00000000 0.00000000 0.00000000\n');
% fprintf(fid,'ac\n');
% fprintf(fid,'sketch line\n');
% fprintf(fid,'change to sketch\n');
% 
% 
theta = atan2(Lx/2,Ly);
ty = 2*t*cos(theta);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,1)-t/2    ,Cds(2,1)-ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,end-4)-t/2,Cds(2,end-4)+ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,end-1)    ,Cds(2,end-1)+ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,end-3)    ,Cds(2,end-3)+ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,end)      ,Cds(2,end)+ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,end-2)+t/2,Cds(2,end-2)+ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,5)+t/2    ,Cds(2,5)-ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,8)        ,Cds(2,8)-ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,6)        ,Cds(2,6)-ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,7)        ,Cds(2,7)-ty]);
% fprintf(fid,'sketch point coord (%.4f, %.4f)\n',[Cds(1,1)-t/2    ,Cds(2,1)-ty]);
% fprintf(fid,'sketch close\n');
% fprintf(fid,'genselect target occobject\n');
% fprintf(fid,'occfilter clear\n');
% fprintf(fid,'occfilter add Edge Face Wire RefPlane\n');
% fprintf(fid,'ac\n');
% fprintf(fid,'//\n');
% fprintf(fid,'//\n');


% fprintf(fid,'skip\n');


fprintf(fid,'// MESHING\n');
fprintf(fid,'genselect target occobject\n');
fprintf(fid,'occfilter clear\n');
fprintf(fid,'occfilter add Edge Wire\n');
fprintf(fid,'undogeom enter\n');
fprintf(fid,'nlmesh2 switch 4 1 %.4f\n',hmax);
fprintf(fid,'nlmesh2 sizepara 0 %.5f\n',hmax);
fprintf(fid,'genselect clear\n');
fprintf(fid,'nlmesh2 clearsel\n');
fprintf(fid,'nlmesh2 clearsel\n');
fprintf(fid,'genselect occobject add occobjectcheck  %dw\n',nSqu+nTri+1);
fprintf(fid,'nlmesh2 seledge %dw 0 1\n',nSqu+nTri+1);


fprintf(fid,'genselect clear\n');
fprintf(fid,'nlmesh2 clearsel\n');
fprintf(fid,'nlmesh2 clearsel\n');
fprintf(fid,'genselect occobject add occobjectcheck  1w ');
for i = 2:nSqu+nTri
    fprintf(fid,'%d ',i);
end
fprintf(fid,'%d\n',nSqu+nTri+1);
for i = 1:nSqu+nTri
    fprintf(fid,'nlmesh2 seledge %dw 0 1\n',i);
end
fprintf(fid,'nlmesh2 seledge %dw 0 1\n',nSqu+nTri+1);
    
fprintf(fid,'nlmesh2 mesh 1 4 0\n');
fprintf(fid,'nlmesh2 accept 1\n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'nlmesh2 clearsel\n');
fprintf(fid,'nlmesh2 clearsel\n');
fprintf(fid,'//\n');
fprintf(fid,'//\n');
fprintf(fid,'// EXTRUDE\n');
fprintf(fid,'genselect target edge\n');
fprintf(fid,'genselect target segment\n');
fprintf(fid,'genselect element add part 1/0\n');
fprintf(fid,'elgenerate solid solidfacedrag 2 30000 %.4f 1 0 0 0 0 0 4\n',hmax);
fprintf(fid,'genselect clear\n');
fprintf(fid,'elgenerate accept\n');

fprintf(fid,'//\n');
fprintf(fid,'//\n');
fprintf(fid,'// DELETE SHELL\n');
fprintf(fid,'partdata delete 1\n');
fprintf(fid,'//\n');
fprintf(fid,'//\n');
fprintf(fid,'// DELETE WIRES\n');
fprintf(fid,'geomag delnoundo 1w ');
for i = 2:nSqu+nTri
   fprintf(fid,'%d ',i); 
end
fprintf(fid,'%d\n',nSqu+nTri+1);

fprintf(fid,'//\n');
fprintf(fid,'//\n');
fprintf(fid,'// EDIT PART PARAMETERS\n');
fprintf(fid,'KEYWORD INPUT 1\n');
fprintf(fid,'*PART\n');
fprintf(fid,'$#                                                                         title\n');
fprintf(fid,'Wall\n');
fprintf(fid,'$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid\n');
fprintf(fid,'         2         1         2         2         0         0         0         0\n');
fprintf(fid,'*END\n');


% fprintf(fid,'skip\n');

fprintf(fid,'//\n');
fprintf(fid,'//\n');
fprintf(fid,'// RENUMBER ENTIRE PART\n');
fprintf(fid,'renumber clean\n');
fprintf(fid,'renumber offset 0\n');
fprintf(fid,'renumber setkind NODE 299999\n');
fprintf(fid,'renumber setrange 1 10000 10000\n');
fprintf(fid,'renumber renumkind 170\n');
fprintf(fid,'renumber keyword\n');
fprintf(fid,'renum occupant models\n');
fprintf(fid,'renumber clean\n');
fprintf(fid,'renumber offset 0\n');
fprintf(fid,'renumber setkind SOLID_ELEM 299999\n');
fprintf(fid,'renumber setrange 30000 30000 40000\n');
fprintf(fid,'renumber renumkind 133\n');
fprintf(fid,'renumber keyword\n');
fprintf(fid,'renum occupant models\n');

fprintf(fid,'//\n');
fprintf(fid,'//\n');
fprintf(fid,'//\n');
fprintf(fid,'// CREATE NODE SETTS FOR BOUNDARY CONDITIONS\n');
fprintf(fid,'// FIX Z\n');
fprintf(fid,'setnode\n');
fprintf(fid,'genselect target node\n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'genselect node add part 2/0 \n');
fprintf(fid,'setnode createset 4 1 0 0 0 0 "Fix Z Wall"\n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'setnode none\n');

fprintf(fid,'//\n');
fprintf(fid,'// FIX XY LEFT CORNER NODES\n');
fprintf(fid,'genselect target node\n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'Coincident nodes found. Select node ID\n');


offset = getOffset([Cds(:,1),Cds(:,2),Cds(:,7)],t,'out');
ty = abs(offset(2,1) - Cds(2,1));

p1 = [Cds(1,1)-t+TOL_g     Cds(2,1)+TOL_g-ty -TOL_g];
p2 = [Cds(1,1)-t-TOL_g Cds(2,1)-TOL_g-ty  hmax+TOL_g];
fprintf(fid,'genselect node add box in %.5f %.5f %.5f %.5f %.5f %.5f\n',[p1, p2]);
p1 = [Cds(1,end-4)-t+TOL_g     Cds(2,end-4)+TOL_g+ty     -TOL_g];
p2 = [Cds(1,end-4)-t-TOL_g Cds(2,end-4)-TOL_g+ty      hmax+TOL_g];
fprintf(fid,'genselect node add box in %.5f %.5f %.5f %.5f %.5f %.5f\n',[p1 p2]);
fprintf(fid,'setnode createset 5 1 0 0 0 0 "Fix XY Wall" \n');
fprintf(fid,'genselect clear\n');
fprintf(fid,'//\n');
fprintf(fid,'// SAVE OUTPUT\n');
fprintf(fid,'save keyword "mesh_wall.key"\n');
fprintf(fid,'exit\n');




fclose(fid);
fclose(fid2);
%%
if strcmp(run_LS,'yes')
    command = 'lsprepost4.8_x64 create_mesh_wall.cfile -nographics';
    dos(command);
end
