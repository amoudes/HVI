#! /usr/bin/env python3

from os.path import exists
from os import remove, system
import math

##############################################################################
# plotting settings

run_prepost  = "yes"
graphics     = "no"
delete_cfile = "yes"

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
nW = 50 # nr elements W
nH = 50 # nr elements H
nt = 1   # nr elements t
nelemply = nW*nH*nt # nr of elements per ply

# ply information
# -45 -> matID = 2
#  45 -> matID = 3
#  90 -> matID = 4
#   0 -> matID = 5

sym = "yes" # symmetry
orientations = [45,-45,0,90,90,0]

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
# implement sphere
eend   = 30000


fid.write('genselect target node\n')
fid.write('genselect clear\n')
fid.write('meshing spheresolid create %.2f %.2f %.2f %d %d 1 0 0 0 1 0\n' %(xP,yP,zP,R,nR))
fid.write('ac\n')
fid.write('meshing spheresolid accept 1 1 %d ball\n' %(eend))
fid.write('ac\n')

##############################################################################
# create plies

fid.write('bgstyle plain\n')
fid.write('cemptymodel\n')
fid.write('genselect target node\n')
fid.write('genselect clear\n')

t1 = 0.0
t2 = t
estart = eend+1
eend   = estart+nelemply+1
for i in range(2,nply+2):
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
# create data sets for tiebrakes

ntiebrakes = nply - 1
itb = 0
t1 = t
iKW = 1

for i in range(1,ntiebrakes+1):
    for j in range(0,2):
        itb += 1
        
        for k in range(2,nply+2):
            if i + j +1 != k:
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
# create orientation information by specifying part

for i in range(nply):
    if orientations[i] == -45:
        matID = 2
    elif orientations[i] == 45:
        matID = 3
    elif orientations[i] == 90:
        matID = 4
    elif orientations[i] == 0:
        matID = 5
    
    iKW += 1
    fid.write('*PART\n')
    fid.write('KEYWORD INPUT %d\n' %(iKW))
    fid.write('*PART\n')
    fid.write('$#                                                                         title\n')
    fid.write('ply %d\n' %(i+1))
    fid.write('$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid\n')
    
    if i+2 < 10:
        fid.write('         %d         1         %d         0         0         0         0         0\n' %(i+2,matID))
    else:
        fid.write('        %d         1         %d         0         0         0         0         0\n' %(i+2,matID))
    fid.write('*END\n')
    fid.write('keyword updatekind\n')
    fid.write('PART_PART\n')


##############################################################################
#ply particle info
    
for j in range(nply):
    if orientations[j] == -45:
        matID = 2
    elif orientations[j] == 45:
        matID = 3
    elif orientations[j] == 90:
        matID = 4
    elif orientations[j] == 0:
        matID = 5
    
    iKW += 1
    fid.write('*PART\n')
    fid.write('KEYWORD INPUT %d\n' %(iKW))
    fid.write('*PART\n')
    fid.write('$#                                                                         title\n')
    fid.write('particles ply %d\n' %(j+1))
    fid.write('$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid\n')
    
    if i+2 < 10:
        fid.write('       %d         1         %d         0         0         0         0         0\n' %((j+2)*100,matID))
    else:
        fid.write('      %d         1         %d         0         0         0         0         0\n' %((j+2)*100,matID))
    fid.write('*END\n')
    fid.write('keyword updatekind\n')
    fid.write('PART_PART\n')

##############################################################################
# sphere part information

iKW += 1
fid.write('KEYWORD INPUT %d\n' %(iKW))
fid.write('*PART\n')
fid.write('$#                                                                         title\n')
fid.write('ball\n')
fid.write('$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid\n')
fid.write('         1         2         1         1         0         0         0         0\n')
fid.write('*END\n')
fid.write('keyword updatekind\n')
fid.write('PART_PART\n')


iKW += 1
# sphere particles part information
fid.write('KEYWORD INPUT %d\n' %(iKW))
fid.write('*PART\n')
fid.write('$#                                                                         title\n')
fid.write('particle ball\n')
fid.write('$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid\n')
fid.write('       100         1         1         1         0         0         0         0\n')
fid.write('*END\n')
fid.write('keyword updatekind\n')
fid.write('PART_PART\n')

##############################################################################
# create part lists

# particles
iKW += 1
fid.write('KEYWORD INPUT %d\n' %(iKW))
fid.write('*SET_NODE_GENERAL_TITLE\n')
fid.write('Particles\n')
fid.write('$#     sid       da1       da2       da3       da4    solver \n')     
fid.write('      5000       0.0       0.0       0.0       0.0MECH\n')
fid.write('$#  option        e1        e2        e3        e4        e5        e6        e7\n')

rows = math.ceil((nply+1)/7)

iPart = 1
for row in range(rows):
    
    if iPart < 9:
        fid.write('PART             ')
    else:
        fid.write('PART            ')
        
    for i in range(7):
        
        if iPart > nply+1:
            iPart = 0
            
        fid.write('%d' %(iPart*100))
        
        if iPart == nply + 1:
            fid.write('         ')
        elif iPart < 9:
            fid.write('       ')
        else:
            fid.write('      ')
            
        if iPart != 0:
            iPart += 1
            
    fid.write('\n')
fid.write('*END\n')
fid.write('keyword updatekind\n')
fid.write('SET_NODE_GENERAL\n')

# parts
iKW += 1
fid.write('KEYWORD INPUT %d\n' %(iKW))
fid.write('*SET_PART_LIST_TITLE\n')
fid.write('Parts\n')
fid.write('$#     sid       da1       da2       da3       da4    solver \n')     
fid.write('      4000       0.0       0.0       0.0       0.0MECH\n')
fid.write('$#    pid1      pid2      pid3      pid4      pid5      pid6      pid7      pid8\n')

rows = math.ceil((nply+1)/8)

iPart = 1
for row in range(rows):
    
    if iPart < 10:
        fid.write('         ')
    else:
        fid.write('        ')
        
    for i in range(8):
        
        if iPart > nply+1:
            iPart = 0
            
        fid.write('%d' %(iPart))
        
        if iPart < 9 or iPart == nply+1:
            fid.write('         ')
        else:
            fid.write('        ')
            
        if iPart != 0:
            iPart += 1
            
    fid.write('\n')
fid.write('*END\n')
fid.write('keyword updatekind\n')
fid.write('SET_PART_LIST\n')



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
    remove('lspost.msg')
    remove('lspost.cfile')
    
if delete_cfile == "yes":
    remove(filename)

print('done')
    
    
    
    
    
    
    
