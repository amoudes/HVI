openc command "create_mesh.cfile" nodialog
\\ THE FRONT PLATE
Invalid command \\!
genselect target node
genselect clear
meshing boxsolid create 0.000000 -10.000000 0.000000 2.000000 10.000000 2.500000 8 80 1 0.000000
ac
meshing boxsolid accept 1 1256 1645 boxsolid
genselect clear
genselect clear
ac
meshing cylindersolid create 2.500000 1.000000 50 5 -3.000000 0.000000,0.000000,0.000000,0.000000,1.000000,0,0.000000
ac
meshing cylindersolid accept 3 1 1 ball
No duplicated nodes found!
ac
Finished reading command file!
Save Config. parameters to file C:\Users\s148946\AppData\Roaming\LSTC\LS-PrePost4.8\lsppconf
