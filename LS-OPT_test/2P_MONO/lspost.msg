openc command "create_mesh_ball_target.cfile" nodialog
meshing cylindersolid create 2.500000 0.25 64 1 -5.000000 0.000000,0.000000,0.000000,0.000000,1.000000,0,0.000000
ac
meshing cylindersolid accept 3 1 1 ball
No duplicated nodes found!
ac
meshing boxsolid create -2.000000 -10.000000 0.000000 0.000000 10.000000 0.25 8 80 1 0.000000
ac
meshing boxsolid accept 1 5000 10000 boxsolid
genselect clear
ac
meshing boxsolid create 102.000000 -40.000000 0.000000 109.7 40.000000 0.250000 15 160 1 0.000000
ac
meshing boxsolid accept 2 11000 16000 monobackplate
genselect clear
ac
skip
endskip

endskip

Invalid command endskip
!
genselect target node
genselect clear
genselect clear
pan -16.374174 2.950011;
genselect node add part 3/0 
genselect node add part 1/0 
genselect node add part 2/0 
setnode createset 1 1 0 0 0 0 "all" 
genselect clear
genselect clear all
selectentity All
selectentity None
loadstate 1;
loadquat 0.000000 0.000000 0.000000 1.000000;
loadgrot 1.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 1.000000 ;
loadzoom 0.077310;
loadpan -48.200077 9.380099;
loadeyepos 0.000000 0.000000 0.000000;
loadupvect 0.000000 1.000000 0.000000;
genselect node add region in 0.148434 0.555184 0.820246 0.629877
setnode createset 2 1 0 0 0 0 "top" 
genselect clear
loadstate 1;
loadquat 0.000000 0.000000 0.000000 1.000000;
loadgrot 1.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 1.000000 0.000000 0.000000 0.000000 0.000000 1.000000 ;
loadzoom 0.096638;
loadpan -49.355724 -7.707903;
loadeyepos 0.000000 0.000000 0.000000;
loadupvect 0.000000 1.000000 0.000000;
genselect node add region in 0.132327 0.318841 0.554251 0.283166
setnode createset 3 1 0 0 0 0 "bottom" 
genselect clear
entlistset operationtype 5 2
spcdata operationtype 2
genselect target node
genselect clear
genselect node add node 18576/0 
Coincident nodes found. Select node ID
Invalid command coincident!
Coincident nodes found. Select node ID
Invalid command coincident!
genselect node add node 18560/0 
spcdata createnodeset 4 1 NODESET(SPC) 4
genselect clear
spcdata create set 4 0 1 1 0 0 0 0
genselect clear
KEYWORD INPUT 1
keyword updatekind
KEYWORD INPUT 2
keyword updatekind
KEYWORD INPUT 3
save keyword "mesh_ball_target.key"
Finished reading command file!
Save Config. parameters to file C:\Users\Kayleigh\AppData\Roaming\LSTC\LS-PrePost4.8\lsppconf
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           d. Select node ID
Coincident nodes found. Select node ID
genselect node add node 18560/0 
quat 0.063085 0.111659 -0.018677 0.991566;
spcdata createnodeset 4 1 NODESET(SPC) 4
genselect clear
spcdata create set 4 0 1 1 0 0 0 0
Save Config. parameters to file C:\Users\Kayleigh\AppData\Roaming\LSTC\LS-PrePost4.8\lsppconf
