\\ DOUBLE PLATE COMMAND FILE

\\ THE BALL
meshing cylindersolid create 2.000000 0.250000 36 1 0.000000 0.000000,0.000000,0.000000,0.000000,1.000000,0,0.000000
ac
meshing cylindersolid accept 1 1 1 ball
No duplicated nodes found!
ac


\\ THE FRONT PLATE
genselect target node
genselect clear
meshing boxsolid create 3.000000 -10.000000 0.000000 5.000000 10.000000 0.250000 8 80 1 0.000000
ac
meshing boxsolid accept 2 370 777 front plate
genselect clear
ac


\\ THE BACK PLATE
genselect target node
genselect clear
meshing boxsolid create 55.000000 -20.000000 0.000000 58.299999 20.000000 0.250000 13 160 1 0.000000
ac
meshing boxsolid accept 3 1010 2235 BACK plate
genselect clear
ac
