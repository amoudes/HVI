#! /usr/bin/env python3

from os.path import exists
from os import remove

##############################################################################
# Basic parameters

readfile = 'lsppout'
writefile = 'bcinfo.k'
#
ytop = 20.0
ybot = -20.0

TOL_g = 1.0e-4

##############################################################################
## Read lsppout file

fid = open(readfile,'r')

flag = False
# print(fid.read())

nodesz = []
nodesy = []
for text in fid:
    #print(x)
    
    if 'NODE' in text:
        flag = True
        
        
    if flag:
        try:
            text = text.split()
            node = int(text[0])
            x    = float(text[1])
            y    = float(text[2])
            z    = float(text[3])
            
            nodesz.append(node)
            
            if y > ytop - TOL_g or y < ybot + TOL_g:
                nodesy.append(node)
        except ValueError:
            print('String cannot be converted')
   

remz = len(nodesz) % 8
remy = len(nodesy) % 8

if remz > 0:     
    nodesz = nodesz + [0]*(8-remz) 

if remy > 0:
    nodesy = nodesy + [0]*(8-remy)

fid.close()

##############################################################################
# Write data

if exists(writefile):
    remove(writefile)
    
fid = open(writefile,'w')

# Write Z list
fid.write('*KEYWORD\n')
fid.write('*SET_NODE_LIST\n')
fid.write('$#     sid       da1       da2       da3       da4    solver\n')
fid.write('         1       0.0       0.0       0.0       0.0MECH\n')
fid.write('$#    nid1      nid2      nid3      nid4      nid5      nid6      nid7      nid8\n')


linenr = 0
for node in range(len(nodesz)):
    linenr += 1
    
    
    if nodesz[node] < 10:
        text = '         {}'.format(nodesz[node])
    elif nodesz[node] >= 10 and nodesz[node] < 100:
        text = '        {}'.format(nodesz[node])
    elif nodesz[node] >= 100 and nodesz[node] < 1000:
        text = '       {}'.format(nodesz[node])
    elif nodesz[node] >= 1000 and nodesz[node] < 10000:
        text = '      {}'.format(nodesz[node])
    else:
        text = '     {}'.format(nodesz[node])
    
    fid.write(text)
    
    if linenr == 8:
        fid.write('\n')
        linenr = 0


# Write Y list
fid.write('*SET_NODE_LIST\n')
fid.write('         2       0.0       0.0       0.0       0.0MECH\n')

linenr = 0
for node in range(len(nodesy)):
    linenr += 1
    
    
    if nodesy[node] < 10:
        text = '         {}'.format(nodesy[node])
    elif nodesy[node] >= 10 and nodesy[node] < 100:
        text = '        {}'.format(nodesz[node])
    elif nodesy[node] >= 100 and nodesy[node] < 1000:
        text = '       {}'.format(nodesy[node])
    elif nodesy[node] >= 1000 and nodesy[node] < 10000:
        text = '      {}'.format(nodesy[node])
    else:
        text = '     {}'.format(nodesy[node])
    
    fid.write(text)
    
    if linenr == 8:
        fid.write('\n')
        linenr = 0    

fid.write('*END\n')
fid.close()

print('--- bcinfo.k file created ---')

