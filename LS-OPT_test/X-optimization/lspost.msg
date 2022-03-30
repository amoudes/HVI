open keyword "C:\Users\Kayleigh\Documents\HVI share\HVI\LS-OPT_test\X-optimization\mesh.key"
Time to read keyword file = 0.117 seconds
Warning - SECTION 1 not found:
  Referenced in *PART ID = 1
Warning - MAT 2 not found:
  Referenced in *PART ID = 1
Warning - EOS 1 not found:
  Referenced in *PART ID = 1
Warning - SECTION 2 not found:
  Referenced in *PART ID = 2
Warning - MAT 1 not found:
  Referenced in *PART ID = 2
Warning - EOS 2 not found:
  Referenced in *PART ID = 2
Time to process element data = 0.062 seconds
Finished reading model
home
genselect target node
genselect clear
meshing cylindersolid create 30.000000 50.000000 20 5 0.000000 0.000000,0.000000,1.000000,0.000000,0.000000,0,0.000000
ac
meshing cylindersolid modify 1 30.000000 50.000000 20 5 0.000000 0.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -1.000000 0.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -7.000000 0.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -7.000000 1.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -7.000000 7.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindershell reject
meshing cylindersolid create 4.780000 1.000000 20 5 -7.000000 0.000000,0.000000,0.000000,0.000000,1.000000,0,0.000000
ac
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -7.000000 5.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -7.000000 10.000000,0.000000,0.000000,0.000000,1.000000
zoomhere 0.076622 0.161650 1.125000;
pan -0.089771 -0.751820;
meshing cylindershell reject
measure select 1
Coincident nodes found. Select node ID
Nid#    2858, xyz=14.74755955,-19.74951935,0.25
clearpick
zoomhere 0.147092 -0.391304 0.900000;
zoomhere 0.147092 -0.391304 0.720000;
zoomhere 0.147092 -0.391304 0.576000;
zoomhere 0.146532 -0.391304 0.460800;
zoomhere 0.143736 -0.391304 0.368640;
Coincident nodes found. Select node ID
Nid#    5132, xyz=15,-20,0.25
measure dist N2858/0 N5132/0 ;
Nid#    2858, xyz=14.74755955,-19.74951935,0.25
Nid#    5132, xyz=15,-20,0.25
dx=0.25244 dy=-0.250481 dz=0 dist=0.355622
clearpick
Coincident nodes found. Select node ID
Nid#     439, xyz=14.75,-20,0
zoomhere 0.122483 0.044593 0.460800;
zoomhere 0.122483 0.044593 0.576000;
zoomhere 0.122483 0.044593 0.720000;
pan 8.976287 2.363353;
pan 9.299457 14.859249;
Coincident nodes found. Select node ID
Nid#     161, xyz=14.75,20,0
measure dist N439/0 N161/0 ;
Nid#     439, xyz=14.75,-20,0
Nid#     161, xyz=14.75,20,0
dx=0 dy=40 dz=0 dist=40
zoomhere 0.139262 -0.325530 0.900000;
pan 7.782351 7.561013;
measure select 0
meshing cylindersolid create 4.780000 1.000000 20 5 -7.000000 10.000000,0.000000,0.000000,0.000000,1.000000,0,0.000000
ac
zoomhere -0.029083 0.151616 1.125000;
pan 2.659422 6.216531;
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -7.000000 9.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -7.000000 5.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindersolid modify 1 4.780000 1.000000 20 5 -7.000000 7.000000,0.000000,0.000000,0.000000,1.000000
meshing cylindershell reject
Save Config. parameters to file C:\Users\Kayleigh\AppData\Roaming\LSTC\LS-PrePost4.8\lsppconf
