openc command "create_mesh.cfile" nodialog
bgstyle fade
openc
parameter x1 5.915
parameter y1 0.7785
parameter t 0.5
parameter hmax 0.25
Finished reading command file!
cemptymodel
genselect target edge
genselect clear
mesh2d createrpoint 1 0.000000 -20.000000
mesh2d createrpoint 2 15.000000 -20.000000
mesh2d createrpoint 3 15.000000 20.000000
mesh2d createrpoint 4 0.000000 20.000000
mesh2d createrpoint 5 5.915 0.7785
mesh2d acen
mesh2d createline 6 1 2
ac
ac
mesh2d createline 7 2 3
mesh2d createline 8 3 4
mesh2d createline 9 4 1
mesh2d createline 10 5 4
mesh2d createline 11 5 3
mesh2d createline 12 5 2
mesh2d createline 13 5 1
mesh2d sbdown
home
ac
genselect target occobject
occfilter clear
occfilter add Edge Wire
undogeom enter
genselect occobject add occobject  5e
genselect occobject add occobject  8e
genselect occobject add occobject  4e
offsetgeom  planeedgewire 0.5 tags 2 0 0 5e 8 4
genselect occobject add occobject  8e
genselect occobject add occobject  7e
genselect occobject add occobject  1e
offsetgeom  planeedgewire 0.5 tags 2 0 0 8e 7 1
genselect occobject add occobject  7e
genselect occobject add occobject  6e
genselect occobject add occobject  2e
offsetgeom  planeedgewire 0.5 tags 2 0 0 7e 6 2
genselect occobject add occobject  6e
genselect occobject add occobject  5e
genselect occobject add occobject  3e
offsetgeom  planeedgewire 0.5 tags 2 0 0 6e 5 3
genselect clear
genselect target occobject
occfilter clear
occfilter add Edge Face Wire RefPlane
undogeom enter
sketch loadall
genselect target occobject
occfilter add edge vertex RefAxis
genselect target occobject
occfilter add edge vertex RefAxis
sketch setpln 0.00000000 0.00000000 0.00000000 0.00000000 0.00000000 1.00000000 1.00000000 0.00000000 0.00000000
ac
zoom 1.5
sketch line
change to sketch
change to sketch
Invalid command change!
sketch point coord (15, 20)
sketch point coord (0, 20)
sketch point coord (0, -20)
sketch point coord (15, -20)
sketch point coord (15, 20)
sketch close
genselect target occobject
occfilter clear
occfilter add Edge Face Wire RefPlane
genselect target occobject
occfilter clear
occfilter add Edge Wire
undogeom enter
nlmesh2 switch 4 1 10.000000 
nlmesh2 sizepara 0 0.25
NLine mesh command failed.
NLine mesh command failed.
Invalid command nline!
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect occobject add occobjectcheck  6w
nlmesh2 seledge 6w 0 1
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect occobject add occobjectcheck  6w 4
nlmesh2 seledge 6w 0 1
nlmesh2 seledge 4w 0 1
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect occobject add occobjectcheck  6w 4 3
nlmesh2 seledge 6w 0 1
nlmesh2 seledge 4w 0 1
nlmesh2 seledge 3w 0 1
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect occobject add occobjectcheck  6w 4 3 1
nlmesh2 seledge 6w 0 1
nlmesh2 seledge 4w 0 1
nlmesh2 seledge 3w 0 1
nlmesh2 seledge 1w 0 1
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect occobject add occobjectcheck  6w 4 3 1 1
nlmesh2 seledge 6w 0 1
nlmesh2 seledge 4w 0 1
nlmesh2 seledge 3w 0 1
nlmesh2 seledge 1w 0 1
nlmesh2 seledge 1w 0 1
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect occobject add occobjectcheck  6w 4 3 1 1 1
nlmesh2 seledge 6w 0 1
nlmesh2 seledge 4w 0 1
nlmesh2 seledge 3w 0 1
nlmesh2 seledge 1w 0 1
nlmesh2 seledge 1w 0 1
nlmesh2 seledge 1w 0 1
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect occobject add occobjectcheck  6w 4 3 1 1 1 1
nlmesh2 seledge 6w 0 1
nlmesh2 seledge 4w 0 1
nlmesh2 seledge 3w 0 1
nlmesh2 seledge 1w 0 1
nlmesh2 seledge 1w 0 1
nlmesh2 seledge 1w 0 1
nlmesh2 seledge 1w 0 1
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect occobject add occobjectcheck  6w 4 3 1 1 1 1 2
nlmesh2 seledge 6w 0 1
nlmesh2 seledge 4w 0 1
nlmesh2 seledge 3w 0 1
nlmesh2 seledge 1w 0 1
nlmesh2 seledge 2w 0 1
nlmesh2 mesh 2 4 0
nlmesh2 accept 2
genselect clear
genselect clear
nlmesh2 clearsel
nlmesh2 clearsel
genselect target edge
genselect target segment
genselect element add part 2/0 
elgenerate solid solidfacedrag 1 2107 40 160 0 0 0 0 0 4
genselect clear
genselect clear
elgenerate accept
genselect clear
genselect occobject add occobjectcheck  1e
genselect clear
genselect occobject add occobjectcheck  1e 2 3 4 5 6 7 8 1w 2 3 4 6
genselect clear
genselect occobject add occobjectcheck  1e  2  3  4  5  6  7  8  1w  2  3  4  6 
genselect clear
geomag delnoundo  1e 2 3 4 5 6 7 8 1w 2 3 4 6
partdata readlist 2 
clearid part
Shell Part #2 
clearid part
Shell Part #2 
partdata delete 2 
delelement unrefn 1
delelement unrefn 0
delelement unrefn 1
delelement unrefn 0
meshing spheresolid create -7 0 20 4.78 25 0 0 0 0 1 0
ac
meshing spheresolid accept 2 555259 614271 spheresolid
No duplicated nodes found!
ac
genselect clear
KEYWORD INPUT 1
keyword updatekind
KEYWORD INPUT 2
$output "lsppout" 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1.000000
save keyword "mesh.key"
exit
Save Config. parameters to file C:\Users\Kayleigh\AppData\Roaming\LSTC\LS-PrePost4.8\lsppconf
