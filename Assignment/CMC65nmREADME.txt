CMC Microsystems
65-nanometre CMOS STMicroelectronics Design Kit (CMC release V1.0)
June 24, 2007

===========================================================
In this README file, you will find information and advice intended 
for users of the 65nm design kit. 

The README includes:

1.  Features of the STMicroelectronics Design Kit and Process
2.  Contents of 65nm CMOS Design Kit (CMC release V1.0)
3.  How to Start Using 65nm CMOS Design Kit
4.  How to Access Design Kit Documentation
5.  How to Obtain Assistance

===========================================================

1. Features of the STMicroelectronics Design Kit and Process
------------------------------------------------------------
Through a partnership with CMP (Circuits Multi-Projets, France), 
CMC is distributing this STMicroelectronics (STM) design kit that 
is intended for designing ICs that target STM's 65-nanometre CMOS 
process. 

For all aspects of this STM technology, all users are bound to terms
of confidentiality and should be made aware of this before they are 
given access to the technology files.

General information about the 65nm CMOS STMicroelectronics process 
and design kit could be found on the following STMicroelectronics
web site:   
http://www.st.com/stonline/products/technologies/soc/65plat.htm#Anchor-19737

CMC NOTE: Some of these process/library features are not provided/
          supported in this design kit release

CMC has integrated this design kit in the Sustainable Technology
Configuration (STC) environment by providing basic installation
and startup scripts. However, users should not make any assumptions
that the structure, functionality, etc. of this kit are similar to
other kits distributed or supported by CMC.

In all cases, a design kit or similar release distributed by CMC
contributes to but does not guarantee successful design.  CMC tests 
each of its technology releases to ensure basic functionality. 
However, each release is only one of several ingredients in a design 
environment that users must assemble and test to their satisfaction 
and for the specific application intended. It is the designer's 
responsibility to take whatever steps are necessary to ensure the 
designed application will work as desired. CMC can offer advice and
assistance to designers under certain circumstances. For information
about how to get assistance with this release, see Section 5 of this
CMC65nmREADME file.

****************************************************************
*******************IMPORTANT CAUTIONS*************************** 
****************************************************************
a) This design kit has been qualified by STM for Cadence IC.5.1.41
   tools. IC.5.1.41 is available in either Cadence2005a
   or Cadence 2006a CMC releases. 

b) The kit requires the CMC generic technology environment for 
   Cadence, local.2.2 or higher (specifically, updated 
   startCds and startCds_for_cmos65nm scripts, and  
   /CMC/kits/local/lib environment).

c) Mentor Calibre is the sign-off tool for DRC.

*****************************************************************

 Product:
 --------
 DK_cmos065lpgp_7m4x0y2z_50A28A 	4.2.1
 

 Product Requirements:
 ---------------------
 IC                     5.1.41
 Unidoc                 2.7.b
 UnicadKernel           3.3
 Calibre                2006.1_19.20
 PLSKit                 1.4.1
 Star-rcxt              x-2005.06-SP2
 ArtistKit              4.7
 ams                    2005.2p0274
 hspice                 x-2005.09-sp1
 hsim                   6.0_2005.20.4
 nanosim                x-2005.09-sp1
 spectre                MMSIM 60.USR2


 The version 4.2.1 of the DK_cmos065lpgp_7m4x0y2z_50A28A Design Kit
 is aligned on:
  - Design rule manual : DRM 65 nm Bulk CMOS Process ADCS #7683821 
  - ANTICIPATED CHANGES TO CMOS065 Design Rule Manual 65nm Bulk CMOS
    Process available in Design Kit doc/Manuals/MISC directory 


2. Contents of 65nm CMOS Design Kit (CMC release V1.0)
------------------------------------------------------

This release includes both a set of files created by CMC to assist
researchers at Canadian universities to use the kit in their 
CMC-supported environment, and the STMicroelectronics design 
kit provided by CMP.

2.1 CMC Files
-------------

/CMC/kits/cmos65nm/

  CMC65nmREADME            			This file
  LICENSE                  			License agreement 
  Student_Acknowledgement_Statement.doc	
  Student_Acknowledgement_Statement.pdf


/CMC/kits/cmos65nm/CMCdir/

  .cdsinit		   Modified to load Calibre into Cadence
  cds.lib                  File that sets the library paths for 
                           Cadence Library Browser                             
  CMC90nmInstallScript     CMC installation script
  .cshrc_cmos065           Removed reference to unknown license server 
  .cshrc_cmos065.template  Removed reference to unknown license server 


2.2 Design Kit
--------------

Once the design kit has been properly installed, it will contain 
the following:  

CLOCK65LPHVT_SNPS-AVT-CDS_2.1
CLOCK65LPLVT_SNPS-AVT-CDS_2.1
CLOCK65LPSVT_SNPS-AVT-CDS_2.1
CORE65LPHVT_SNPS-AVT-CDS_4.1
CORE65LPLVT_SNPS-AVT-CDS_4.1
CORE65LPSVT_SNPS-AVT-CDS_4.1
CORL65LPHVT_SNPS-AVT-CDS_3.0
CORL65LPSVT_SNPS-AVT-CDS_4.0
CORX65LPHVT_SNPS-AVT-CDS_6.0
CORX65LPLVT_SNPS-AVT-CDS_6.0
CORX65LPSVT_SNPS-AVT-CDS_6.0
DK_cmos065lpgp_7m4x0y2z_50A28A_4.2.1
DftKit_1.4
IO65LPHVT_SF_1V8_50A_7M4X0Y2Z_SNPS-AVT-CDS_5.0
IO65LPHVT_SF_2V5_50A_7M4X0Y2Z_SNPS-AVT-CDS_5.0
IO65LPSVTHVT_COMPENSATION_1V8_2V5_50A_SNPS-AVT-CDS_5.0
IO65LP_DEVKIT_50A_ST_7M4X0Y2Z_SNPS-AVT-CDS_5.0
IO65LP_SF_BASIC_50A_ST_7M4X0Y2Z_SNPS-AVT-CDS_5.0
PLSKit_1.4.1
PRHS65_SNPS-AVT-CDS_5.0
SHIFT65_HS_LP_SW_3.0
SignOffKit_2.3.11.1
SignOffTechnoKit_cmos065lp_7m4x0y2z_4.2
SynopsysHandOffKit_2.3.11.1
UNIOPUS
UnicadKernel_3.4
Unidoc_2.7.b
adv_AvantiKit_2.3.9.1
adv_AvantiTechnoKit_cmos065_7m4x0y2z_AP_4.2.1
adv_EncounterKit_2.3.11.1
adv_EncounterTechnoKit_cmos065_7m4x0y2z_4.2
bzip2
esquiss_1.2
install


3. How to Start Using 65nm CMOS Design Kit
------------------------------------------

To start Cadence with the cmos65nm design kit,  
follow these steps:
 
a) Log on as a user
 
b) mkdir <working_directory> (e.g., mkdir cmos65nm.1.0)

   NOTE: The first time you start the cmos65nm.1.0 design kit, 
         make sure you create/use an empty folder so that  
         configuration files from the other kits 
         do not affect the kit startup! 
         
c) cd <working_directory>

d) Environment/paths for any tools that will be used must be set
   (e.g., Cadence, Synopsys Star-RCXT, Mentor Calibre,...)

e) startCds -t cmos65nm

Cadence should now start with a proper configuration for the 
cmos65nm design kit. 


4. How to Access Documentation
------------------------------

Starting the kit should also start the Unidoc cmos65nm
documentation browser. 

IMPORTANT NOTE:
    
    The version 4.2.1 of the DK_cmos065lpgp_7m4x0y2z_50A28A Design Kit
    is aligned on:
    
    - Design rule manual : DRM 65 nm Bulk CMOS Process ADCS #7683821 
    - ANTICIPATED CHANGES TO CMOS065 Design Rule Manual 65nm Bulk CMOS
      Process available in Design Kit doc/Manuals/MISC
      directory

    Only one (1) hard copy of the Design Rule Manual will be delivered
    directly from CMP to the Authorized Signatory of the STM NDA at your
    university. This document is not available in the design kit package
    (due to confidentiality concerns of STMicroelectronics).


5.  How to Obtain Assistance
----------------------------

Do NOT contact CMP or STM for assistance with the cmos65nm kit.

If you need assistance,  please consult the questions and answers
posted on CMC's web forum for cmos65nm design kit users, accessible to
authorized users at: https://forums.cmc.ca/ 

You are strongly encouraged to share your experiences through 
postings on this forum.

You may also contact CMC engineering support services using the 
Request for Support web form at:
https://www1.cmc.ca/clients/support_request.php

