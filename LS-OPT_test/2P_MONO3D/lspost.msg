open command "C:\Users\Kayleigh\Documents\HVI share\HVI\LS-OPT_test\2P_MONO3D\create_mesh_ball_target.cfile"
skip
endskip

endskip

Invalid command endskip
!
genselect target node
genselect clear
meshing spheresolid create -7 0 0 2.5 15 1 0 0 0 1 0
ac
meshing spheresolid accept 3 1 1 ball
No duplicated nodes found!
No duplicated nodes found!
Invalid command no!
ac
genselect target node
genselect clear
meshing boxsolid create 0.000000 -10.000000 -10.000000 2.000000 10.000000 10.000000 8 80 80 0.000000
ac
meshing boxsolid accept 2 23626 24377 frontplate
genselect clear
genselect clear
ac
meshing boxsolid create 102.000000 -40.000000 -40.000000 109.7 40.000000 40.000000 13 160 160 0.000000
ac
meshing boxsolid accept 1 74826 83426 backplate
genselect clear
genselect clear
ac
skip
endskip

endskip

Invalid command endskip
!
KEYWORD INPUT 1
keyword updatekind
KEYWORD INPUT 2
keyword updatekind
KEYWORD INPUT 3
save keyword "mesh_ball_target.key"
End of command file!
zoomhere 0.149462 0.028986 0.755104;
Nothing picked !
open d3plot "C:\Users\Kayleigh\Documents\HVI share\HVI\LS-OPT_test\2P_MONO3D\results\d3plot"
Reading binary plot files
DES Format: version 2 detected!
Finished reading model
ac
anim forward
home
anim backward
zoomhere 0.177384 -0.096990 0.800000;
zoomhere -0.126386 -0.017837 0.640000;
pan 6.480638 -4.415425;
anim forward
zoomhere 0.307650 -0.065775 0.800000;
zoomhere 0.307650 -0.065775 1.000000;
zoomhere 0.307650 -0.065775 1.250000;
zoomhere 0.307650 -0.065775 1.562500;
pan -10.449196 4.537341;
open d3plot "C:\Users\Kayleigh\Documents\HVI share\HVI\LS-OPT_test\2P_MONO\results\d3plot"
Reading binary plot files
DES Format: version 2 detected!
Finished reading model
ac
home
anim forward
anim backward
anim forward
genselect node add node 24223/2 
open d3plot "C:\Users\Kayleigh\Documents\HVI share\HVI\LS-OPT_test\2P_MONO\results\d3plot"
Reading binary plot files
ac
open d3plot "F:\2plate3dmono\d3plot"
Reading binary plot files
DES Format: version 2 detected!
Finished reading model
ac
home
anim forward
quat -0.060269 -0.389620 -0.022193 0.918734;
zoomhere 0.219512 0.089186 0.800000;
zoomhere 0.217295 0.085842 0.640000;
zoomhere 0.206208 0.070234 0.512000;
zoomhere 0.189579 0.051282 0.409600;
zoomhere 0.177384 0.031215 0.327680;
zoomhere 0.151885 -0.012263 0.262144;
zoomhere 0.151330 -0.012263 0.209715;
zoomhere 0.150776 -0.012263 0.167772;
zoomhere 0.150776 -0.012263 0.134218;
zoomhere 0.150776 -0.012263 0.107374;
zoomhere 0.150776 -0.012263 0.085899;
zoomhere 0.144124 -0.043478 0.068719;
zoomhere 0.143570 -0.043478 0.054975;
zoomhere 0.143570 -0.043478 0.043980;
zoomhere 0.143570 -0.044593 0.035184;
zoomhere 0.142461 -0.047938 0.043980;
zoomhere 0.142461 -0.047938 0.054975;
zoomhere 0.142461 -0.047938 0.068719;
zoomhere 0.142461 -0.047938 0.085899;
zoomhere 0.142461 -0.039019 0.107374;
zoomhere 0.142461 -0.039019 0.134217;
zoomhere 0.142461 -0.039019 0.167771;
zoomhere 0.142461 -0.039019 0.209714;
zoomhere 0.142461 -0.039019 0.262142;
zoomhere 0.144678 -0.041249 0.327678;
zoomhere 0.144678 -0.041249 0.409597;
zoomhere 0.144678 -0.041249 0.511996;
zoomhere 0.144678 -0.041249 0.639995;
zoomhere 0.144678 -0.041249 0.799994;
quat 0.022049 0.068397 -0.060806 0.995559;
quat -0.078337 -0.246722 -0.006933 0.965890;
anim backward
quat -0.082146 -0.186688 -0.021343 0.978746;
anim forward
anim backward
new
new
anim forward
quat -0.010531 -0.135156 -0.008785 0.990729;
anim forward
state 1;
home
anim forward
quat 0.032228 0.295913 0.047848 0.953471;
zoomhere 0.315410 0.018952 1.250000;
zoomhere 0.322616 0.033445 1.562500;
zoomhere 0.326497 0.036789 1.953125;
zoomhere 0.329268 0.039019 2.441406;
zoomhere 0.331486 0.042363 3.051758;
zoomhere 0.351996 0.044593 3.814698;
zoomhere 0.351996 0.044593 4.768372;
zoomhere 0.351996 0.044593 5.960465;
zoomhere 0.351996 0.044593 7.450581;
quat 0.024024 0.463001 -0.005778 0.886013;
zoomhere 0.366408 0.079153 5.960465;
zoomhere 0.367517 0.072464 4.768372;
zoomhere 0.367517 0.071349 3.814698;
zoomhere 0.368071 0.070234 3.051758;
quat 0.040720 0.409220 -0.056494 0.909775;
pan 41.692703 -0.285702;
