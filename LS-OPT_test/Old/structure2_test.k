$# LS-DYNA Keyword file created by LS-PrePost(R) V4.8.25 - 04Jan2022
$# Created on Mar-24-2022 (14:16:56)
*KEYWORD
*TITLE
$#                                                                         title
LS-DYNA keyword deck by LS-PrePost
*CONTROL_ACCURACY
$#     osu       inn    pidosu      iacc    
         1         4         0         0
*CONTROL_BULK_VISCOSITY
$#      q1        q2      type     btype    tstype      
       1.5      0.06        -2         0         0
*CONTROL_CONTACT
$#  slsfac    rwpnal    islchk    shlthk    penopt    thkchg     orien    enmass
       0.2       0.0         1         0         1         0         1         0
$#  usrstr    usrfrc     nsbcs    interm     xpene     ssthk      ecdt   tiedprj
         0         0         0         0       4.0         0         0         0
$#   sfric     dfric       edc       vfc        th     th_sf    pen_sf      
       0.0       0.0       0.0       0.0       0.0       0.0       0.0
$#  ignore    frceng   skiprwg    outseg   spotstp   spotdel   spothin       
         2         1         0         0         0         0       0.0
$#    isym    nserod    rwgaps    rwgdth     rwksf      icov    swradf    ithoff
         0         0         1       0.0       1.0         0       0.0         0
$#  shledg    pstiff    ithcnt    tdcnof     ftall    unused    shltrw    igactc
         0         0         0         0         0                 0.0         0
*CONTROL_DISCRETE_ELEMENT
$#   ndamp     tdamp     frics     fricr     normk    sheark       cap       vtk
       0.0       0.0       0.0       0.0      0.01       0.0         0         0
$#   gamma       vol       ang       gap    unused    ignore      nbuf  parallel

$#   lnorm    lshear    unused     fricd        dc      ncrb        bt        dt
         0         0                 0.0       0.0         0       0.01.00000E20
$#      cp        tc      tfac    
       0.0       0.0       0.0
$# idesoft    sofscl    unused     iskip     
         0       0.1                  20
*CONTROL_ENERGY
$#    hgen      rwen    slnten     rylen     irgen     
         2         1         2         2         1
*CONTROL_HOURGLASS
$#     ihq        qh  
         3       0.1
*CONTROL_OUTPUT
$#   npopt    neecho    nrefup    iaccop     opifs    ipnint    ikedit    iflush
         0         0         0         0       0.0         0       100      5000
$#   iprtf    ierode   tet10s8    msgmax    ipcurv      gmdt   ip1dblt      eocs
         0         1         2        50         0       0.0         0         0
$#   tolev    newleg    frfreq     minfo    solsig    msgflg    cdetol      
         2         0         1         0         0         0      10.0
$# phschng    demden   icrfile   spc2bnd    penout    shlsig   hisnout    engout
         0         0         0         0         0         0         0         0
$#    insf    isolsf      ibsf      issf    mlkbag      
         0         0         0         0         0
*CONTROL_SOLID
$#   esort   fmatrix   niptets    swlocl    psfail   t10jtol    icohed    tet13k
         1         0         4         1         0       0.0         0         0
$#   pm1     pm2     pm3     pm4     pm5     pm6     pm7     pm8     pm9    pm10
       0       0       0       0       0       0       0       0       0       0
*CONTROL_SOLUTION
$#    soln       nlq     isnan     lcint     lcacc     ncdcf     nocop     
         0         0         0       400         1         1         0
*CONTROL_TERMINATION
$#  endtim    endcyc     dtmin    endeng    endmas     nosol     
2.20000E-5         0       0.0       0.01.000000E8         0
*CONTROL_TIMESTEP
$#  dtinit    tssfac      isdo    tslimt     dt2ms      lctm     erode     ms1st
       0.0       0.1         0       0.0       0.0         0         0         0
$#  dt2msf   dt2mslc     imscl    unused    unused     rmscl    unused      ihdo
       0.0         0         0                           0.0                   0
*DATABASE_GLSTAT
$#      dt    binary      lcur     ioopt     
1.00000E-8         0         0         1
*DATABASE_GLSTAT_MASS_PROPERTIES
$#      dt    binary      lcur     ioopt     
1.00000E-8         0         0         1
*DATABASE_MATSUM
$#      dt    binary      lcur     ioopt     
1.00000E-8         0         0         1
*DATABASE_SLEOUT
$#      dt    binary      lcur     ioopt     
1.00000E-8         0         0         1
*DATABASE_BINARY_D3PLOT
$#      dt      lcdt      beam     npltc    psetid      
       0.0         0         0        30         0
$#   ioopt      rate    cutoff    window      type      pset    
         0       0.0       0.0       0.0         0         0
*DATABASE_EXTENT_BINARY
$#   neiph     neips    maxint    strflg    sigflg    epsflg    rltflg    engflg
        20        20         3         0         1         1         1         1
$#  cmpflg    ieverp    beamip     dcomp      shge     stssz    n3thdt   ialemat
         0         0         0         1         1         1         2         1
$# nintsld   pkp_sen      sclp     hydro     msscl     therm    intout    nodout
         0         0       1.0         2         0         0                    
$#    dtdt    resplt     neipb     quadr     cubic     
         0         0         0         0         0
*BOUNDARY_SPC_SET_ID
$#      id                                                               heading
         1fix z
$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
         1         0         0         0         1         0         0         0
*CONTACT_ERODING_NODES_TO_SURFACE_ID
$#     cid                                                                 title
         3                                                                      
$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
        50        12         4         2         0         0         0         0
$#      fs        fd        dc        vc       vdc    penchk        bt        dt
      0.01      0.01       0.0       0.0       5.0         0       0.01.00000E20
$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
       1.0       1.0       0.0       0.0       1.0       1.0       1.0       1.0
$#    isym    erosop      iadj    
         1         1         1
$#    soft    sofscl    lcidab    maxpar     sbopt     depth     bsort    frcfrq
         1       0.1         0     1.025       2.0         2         1         1
*SET_NODE_GENERAL_TITLE
Particles
$#     sid       da1       da2       da3       da4    solver      
        50       0.0       0.0       0.0       0.0MECH
$#  option        e1        e2        e3        e4        e5        e6        e7
PART              10        20         0         0         0         0         0
*SET_PART_LIST_TITLE
Parts
$#     sid       da1       da2       da3       da4    solver      
        12       0.0       0.0       0.0       0.0MECH
$#    pid1      pid2      pid3      pid4      pid5      pid6      pid7      pid8
         1         2         0         0         0         0         0         0
*CONTACT_ERODING_SINGLE_SURFACE
$#     cid                                                                 title
$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
         0         0         5         0         0         0         0         2
$#      fs        fd        dc        vc       vdc    penchk        bt        dt
      0.01      0.01       0.0       0.0       5.0         0       0.01.00000E20
$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
       1.0       1.0       0.0       0.0       1.0       1.0       1.0       1.0
$#    isym    erosop      iadj    
         1         1         1
$#    soft    sofscl    lcidab    maxpar     sbopt     depth     bsort    frcfrq
         2       0.1         0     1.025       5.0        35         1         1
*PART
$#                                                                         title
target
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
         1         1         2         2         0         0         0         0
*SECTION_SOLID_TITLE
Target and particles
$#   secid    elform       aet    unused    unused    unused    cohoff    unused
         1         1         0                                       0          
*MAT_USER_DEFINED_MATERIAL_MODELS_TITLE
AA6070-O
$#     mid        ro        mt       lmc       nhv    iortho     ibulk        ig
         22.70000E-9        47        48        20         0         1         2
$#   ivect     ifail    itherm    ihyper      ieos      lmca    unused    unused
         1         1         0         0         1         0                    
$        k         g         e        pr      beta       xsi    cp*rho     alpha
$#      p1        p2        p3        p4        p5        p6        p7        p8
  58333.33  26923.08   70000.0       0.3       0.0       0.9     2.4572.32000E-5
$    e0dot        tr        tm        t0
$#      p1        p2        p3        p4        p5        p6        p7        p8
1.00000E-4     293.0     893.0     293.0         0       0.0       0.0       0.0
$        a         b         n         c         m
$#      p1        p2        p3        p4        p5        p6        p7        p8
      38.8      3.63     0.213     0.142       1.0         0       0.0       0.0
$       q1        c1        q2        c2
$#      p1        p2        p3        p4        p5        p6        p7        p8
      79.5      56.9      88.2       4.0         0       0.0       0.0       0.0
$       dc        wc
$#      p1        p2        p3        p4        p5        p6        p7        p8
       1.0       151         0       0.0       0.0       0.0       0.0       0.0
$       tc      tauc       pco
$#      p1        p2        p3        p4        p5        p6        p7        p8
     804.01.00000E20     -1000         0       0.0       0.0       0.0       0.0
*EOS_LINEAR_POLYNOMIAL_TITLE
Linear
$#   eosid        c0        c1        c2        c3        c4        c5        c6
         2       0.0  58333.33       0.0       0.0       0.0       0.0       0.0
$#      e0        v0  
       0.0       1.0
*PART
$#                                                                         title
ball
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
         2         2         1         2         0         0         0         0
*SECTION_SOLID_TITLE
Ball
$#   secid    elform       aet    unused    unused    unused    cohoff    unused
         2         1         0                                       0          
*MAT_USER_DEFINED_MATERIAL_MODELS_TITLE
Aluminium
$#     mid        ro        mt       lmc       nhv    iortho     ibulk        ig
         12.70000E-9        47        48        20         0         1         2
$#   ivect     ifail    itherm    ihyper      ieos      lmca    unused    unused
         1         1         0         0         1         0                    
$        k         g         e        pr      beta       xsi    cp*rho     alpha
$#      p1        p2        p3        p4        p5        p6        p7        p8
  58333.33  26923.08   70000.0       0.3       0.0       0.9     2.4572.32000E-5
$    e0dot        tr        tm        t0
$#      p1        p2        p3        p4        p5        p6        p7        p8
1.00000E-4     293.0     893.0     293.0         0       0.0       0.0       0.0
$        a         b         n         c         m
$#      p1        p2        p3        p4        p5        p6        p7        p8
     292.6       0.0       0.0      0.02       1.0         0       0.0       0.0
$       q1        c1        q2        c2
$#      p1        p2        p3        p4        p5        p6        p7        p8
       2.7    2160.7     707.6      8.94         0       0.0       0.0       0.0
$       dc        wc
$#      p1        p2        p3        p4        p5        p6        p7        p8
       1.0     278.0         0       0.0       0.0       0.0       0.0       0.0
$       tc      tauc       pco
$#      p1        p2        p3        p4        p5        p6        p7        p8
     804.01.00000E20     -1000         0       0.0       0.0       0.0       0.0
*PART
$#                                                                         title
Particle Target
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
        10         1         2         2         0         0         0         0
*PART
$#                                                                         title
Particle Ball
$#     pid     secid       mid     eosid      hgid      grav    adpopt      tmid
        20         1         1         2         0         0         0         0
*INITIAL_VELOCITY_GENERATION
$#      id      styp     omega        vx        vy        vz     ivatn      icid
         2         2       0.0   6700000       0.0       0.0         0         0
$#      xc        yc        zc        nx        ny        nz     phase    irigid
       0.0       0.0       0.0       0.0       0.0       0.0         0         0
*DEFINE_ADAPTIVE_SOLID_TO_DES_ID
$#     did                                                               heading
         1                                                                      
$#    ipid     itype        nq     ipdes     isdes       rsf    outdes     ibond
         1         0         1        10         1       1.0         0         0
*DEFINE_ADAPTIVE_SOLID_TO_DES_ID
         2                                                                      
         2         0         1        20         2       1.0         0         0
*INCLUDE
$#                                                                      filename
lsppout
*INCLUDE
$#                                                                      filename
bcinfo.k
*BOUNDARY_SPC_SET_ID
$#      id                                                               heading
         1Fix Z
$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
         1         0         0         0         1         0         0         0
$#      id                                                               heading
         2Fix Y
$#    nsid       cid      dofx      dofy      dofz     dofrx     dofry     dofrz
         2         0         0         1         0         0         0         0
*END
