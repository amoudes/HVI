#! /usr/bin/env python3

from os.path import exists
from os import remove, system

##############################################################################
# plotting settings

run_prepost = "yes"
graphics    = "no"

print('running')
##############################################################################
# model input

# Geometric properties ply
W = 110 # width
H = 110.0 # height
t = 0.2   # wall thickness

# projectile properties
R  = 3.75 # Radius
xP = -4   # x-coord
yP = 0    # y-coord
zP = 0    # z-coord

nR = 10   # nr elements radial direction

# mesh properties
nW = 150 # nr elements W
nH = 150 # nr elements H
nt = 1   # nr elements t
nelemply = nW*nH*nt # nr of elements per ply

# ply information
sym = "no"
#orientations = [45,-45,0,90,90,0]
orientations = [45,45]

if sym == "yes":
    orientations.extend(orientations[::-1])

nply = len(orientations)

##############################################################################
##############################################################################
# create empty .cfile

filename = "create_ply_mesh.cfile"

if exists(filename):
    remove(filename)

fid = open(filename,'w')
##############################################################################
# create plies

fid.write('bgstyle plain\n')
fid.write('cemptymodel\n')
fid.write('genselect target node\n')
fid.write('genselect clear\n')

t1 = 0.0
t2 = t
estart = 1
eend   = nelemply+1
for i in range(1,nply+1):
    fid.write('meshing boxsolid create %.2f %.2f %.2f %.2f %.2f %.2f %d %d %d 0.0\n' %(t1,-W/2,-H/2,t2,W/2,H/2,nt,nW,nH))
    fid.write('ac\n')
    fid.write('meshing boxsolid accept %d %d %d ply%d\n' %(i, estart,eend,i))
    fid.write('genselect clear\n')
    fid.write('ac\n')
    
    t1 += t
    t2 += t
    estart += nelemply
    eend   += nelemply

##############################################################################
# implement sphere

fid.write('genselect target node\n')
fid.write('genselect clear\n')
fid.write('meshing spheresolid create %.2f %.2f %.2f %d %d 1 0 0 0 1 0\n' %(xP,yP,zP,R,nR))
fid.write('ac\n')
fid.write('meshing spheresolid accept %d %d %d ball\n' %(nply+1,eend,5*eend))
fid.write('ac\n')

##############################################################################
# create data sets for tiebrakes

ntiebrakes = nply - 1
itb = 0

t1 = t

for i in range(1,ntiebrakes+1):
    for j in range(0,2):
        itb += 1
        
        for k in range(1,nply+1):
            if i + j != k:
                fid.write('-M %d\n' %(k))
                

        fid.write('setsegment\n')
        fid.write('genselect target segment\n')
        fid.write('genselect clear\n')
        fid.write('genselect clear\n')
        fid.write('genselect element add box in %.2f %.2f %.2f %.2f %.2f %.2f\n' %(t1-0.01,-W/2-1,-H/2-1,t1+0.01,W/2+1,H/2+1))        
        fid.write('setsegment createset %d 1 0 0 0 0 "%d"\n' %(itb,itb))
        
        fid.write('assembly on fem 1\n')
                
    fid.write('// next tiebreak\n')
    t1 += t
 
# create tiebrakes
for i in range(1,ntiebrakes+1):
    fid.write('KEYWORD INPUT 1\n')
    fid.write('*CONTACT_AUTOMATIC_ONE_WAY_SURFACE_TO_SURFACE_TIEBREAK_ID\n')
    fid.write('$#     cid                                                                 title\n')
    fid.write('        %d tiebrake %d                                                          \n' %(i,i))
    fid.write('$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr\n')
    fid.write('        %d        %d         0         0         0         0         1         1\n' %(i+1,i))
    fid.write('$#      fs        fd        dc        vc       vdc    penchk        bt        dt\n')
    fid.write('     0.000     0.000     0.000     0.000     0.000         0     0.0001.0000E+20\n')
    fid.write('$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf\n')
    fid.write('  1.000000  1.000000     0.000     0.000  1.000000  1.000000  1.000000  1.000000\n')
    fid.write('$#  option      nfls      sfls     param    eraten    erates     ct2cn        \n')
    fid.write('         9 35.000000 45.000000  1.450000  0.250000  0.750000  1.000000     0.000\n')
    
fid.write('*END\n')
fid.write('keyword updatekind\n')
fid.write('CONTACT_AUTOMATIC_ONE_WAY_SURFACE_TO_SURFACE_TIEBREAK\n')

##############################################################################
# create orientation information

#fid.write('KEYWORD INPUT 1\n')

for i in range(nply):
    if orientations[i] == -45:
        matID = 1
    elif orientations[i] == 45:
        matID = 2
    elif orientations[i] == 90:
        matID = 3
    elif orientations[i] == 0:
        matID = 4
    
    fid.write('*PART\n')
    fid.write('KEYWORD INPUT %d\n' %(i+1))
    fid.write('*PART\n')
    fid.write('$#                                                                         title\n')
    fid.write('ply %d\n' %(i+1))
    fid.write('$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid\n')
    
    if i+1 < 10:
        fid.write('         %d         1         %d         1         0         0         0         0\n' %(i+1,matID))
    else:
        fid.write('        %d         1         %d         1         0         0         0         0\n' %(i+1,matID))
    fid.write('*END\n')
    fid.write('keyword updatekind\n')
    fid.write('PART_PART\n')


##############################################################################
fid.write('save keyword "mesh_ply_ball.key"')
fid.close()
##############################################################################

if graphics == "yes":
    cmd = 'cmd /c "lsprepost4.8_x64 ' + filename + '"'
else:
    cmd = 'cmd /c "lsprepost4.8_x64 ' + filename + ' -nographics"'


if run_prepost == "yes":
    system(cmd)
    
    
print('done')
    
    
    
    
    
    
    
