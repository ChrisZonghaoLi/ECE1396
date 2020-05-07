[ ==README.jaro.quickstart - jaro - August 2007 ]

Last modified: Thu Aug  9 11:13:02 EDT 2007

This "quick-start" document was actually
prepared for the CMOS90NM technology, but
from the testing I've done, most of it
applies to CMOS65NM as well.
	- jaro

-------------

This technology is different from most of our "standard"
technologies.  Here's a quick "how-to" guide:

- for "unidoc", the default PDF viewer is "acroread" from the
  design-kit unidoc directory, and the default HTML viewer is
  "netscape".  To change these, you can set environment variables
  to point at your favourites, before starting "unidoc".  
  (These may be set in your ".cshrc_cmos065" file in your work
  directory, or in your .cshrc file, or just typed in an xterm.)
  Examples:
	setenv UNIDOCPDFREADER /local/bin/acroread
	setenv UNIDOCHTMLREADER /local/bin/firefox

- create a design library; attach it to the library "cmos065"
- create your schematic testbench
- add parts from the libraries cmos065, analogLib, STlib
- start Tools=>AnalogEnvironment ("AE")
  - under AE's "Tools" select "*Setup Corners".  This pops up a new
    window with buttons you can use to select process corners.
    Make your selects (or use the defaults) and click "Save".
    This saves a file "corners" in your simulation directory for this
    cell; when you select "create netlist" or "netlist and run", a
    file "models" will be created, which includes the file "corners".
    (This sequence is equivalent to setting the "include file"
     from other technologies.)

#NotYet_65nm- if you use "set simulation levels", Cadence might crash unless
#NotYet_65nm  you use this from a "configured" design, rather from a schematic.
#NotYet_65nm  In this case:
#NotYet_65nm  - create a new cell using CIW=>File=>New=>Cellview...
#NotYet_65nm    - in the pop-up
#NotYet_65nm	- select your library and cellname
#NotYet_65nm	- select the tool "Hierarchy-Editor" (i.e. view name "config")
#NotYet_65nm	- click OK to close
#NotYet_65nm    - you should now see a pop-up for the Hierarchy Editor.
#NotYet_65nm	- at the bottom, click "Use Template...", and in the new
#NotYet_65nm	  pop-up, select the simulator you wish to use, then click OK to
#NotYet_65nm	  close this one
#NotYet_65nm    - this will reveal the main Hierarchy Editor window
#NotYet_65nm      where you can select which views to use for each instance
#NotYet_65nm      Defaults might be okay, then (after any changes)
#NotYet_65nm	- View=>Update
#NotYet_65nm	- View=>Save
#NotYet_65nm	- File=>Exit
#NotYet_65nm - now you can use the LibraryManager, open the config view of the testbench
#NotYet_65nm   (rather than the schematic) and run AnalogEnvironment on this.
#NotYet_65nm   - set up corners, analysis, etc
#NotYet_65nm   - run simulation

- DRC/LVS : This kit does *not* use the Cadence "diva"
  verification tools; instead, it uses Mentor's "calibre" suite.
  If you have access to cmosp18 technology, you can have a look
  at /CMC/kits/cmosp18/doc/CMOSP18calibreDRCCommandLineInstructions
  for an introduction.  (The set-up is already done, in the cmos65nm
  technology.)  If you don't have access, I've copied that file
  to  /CMC/kits/cmos65nm/==README.jaro.AncientCalibreInstructions

- Calibre LVS: For layout pins to be transferred properly to Calibre
  via GDS, the pin must have its name attached in the same pin layer; to 
  do this, you can
  - select the appropriate pin layer in the LSW
  - create pin, type the terminal name, turn on "Display Pin Name",
    click "Display Pin Name Option...", and beside
    "Layer", select the pin layer, with layer-purpose "pin" (or,
    click the box "use pin layer"), click OK.
  - in the layout window, place the pin and then place its name.
  Now, in calibre LVS, this pin will be netlisted as a port.
  CAVEATS: Follow the following, else the pin won't be written to the GDS file
	   properly (if at all):
     - ensure that you're using the correct pin type, corresponding to
       the drawing layer to which you're adding the pin
     - ensure that the pin object is fully covered (or fully covers) the
       corresponding drawing layer
     - ensure that the pin label, too, is on the corresponding drawing layer

- Extraction : This kit does *not* use Cadence "diva" for extraction.
  For most newer technologies, Diva is not flexible enough.  This
  technology uses a combination of Calibre/LVS and Synopsys/StarRCXT
  for extraction; STM calls this "PLS" for "Post-Layout Simulation".
  Details are in the "PLSkit" documentation, but here's a quick
  introduction:
  - create the schematic and layout views for your cell
  - open the schematic, and use 
	Tools=>*Post Layout Simulation=>Textual Netlist Import
    - step through the tabs "LVS", "Extraction", and "Simulation" and
      examine the defaults:
      - LVS: should be okay
      - Extraction: select an Extraction Methodology as described in the
        PLSkit documentation
      - Simulation: Turn off "Target Simulators" for the simulators you
        are not planning to use; ensure that "ads" is turned off
    - click "Run PLS" to run the automated sequence of steps, which
      includes
	- CDL out (to generate a schematic netlist)
	- Stream-Out
	- PLS Init
	- PLS Extract
	- LVS
	- Extract
	- Conversion to spectre/hspice/ads netlist
      When successful, you should have two new cellviews named as shown
      in the "Simulation" tab.
  - Simulate your testbench: If you simulate a configured schematic,
    change the "View Found", selecting the appropriate extraction strategy
    you used (the one in upper-case on the Simulation tab); if you simulate
    from the schematic, update the Setup=>Environment Switch and StopView
    Lists with the appropriate extraction strategy.
    Then in Analog Environment, you probably need to select
	Tools=>*Import netlist=>Enable
    Check and save your design, then re-run your simulation

- DRC rules: A quick summary of the Calibre DRC rules used is available
  at /CMC/kits/cmos65nm/==README.jaro.calibredrc_summary  ... this
  was generated using
	cd /CMC/kits/cmos90nm/cmos090/DK*/CALIBRE_CORE 
	grep '@ Rule ' calibredrc | sed 's/^..*@ Rule /Rule /' | sort
  and saving the results.  Please be discreet with any hardcopy, as
  some of this info could be sensitive.  (No guarantees that it holds
  all of the rules, but it looks complete to me as of 8 August 2007.
  Let me know if you find something missing...)

- simulation: the default simulator is Cadence's spectre, not HSPICE.
 
Full details are available in the documents related to
Analog Artist and the Design Kit ("DK...") available when using

	% source ./.cshrc_cmos065
	% unidoc &

- Current densities: I haven't read through the entire design-rule
  manual, but it has information similar to the cmos90nm manual
  related to "Electromigration Line Current Limits"

- Post-layout simulation (PLS) using Synopsys Star-RCXT: ST has
  provided only the 64-bit solaris versions of the exectables for the
  PLSkit, so avoid running this on 32-bit machines.  To determine
  this on solaris machines, you can use
	% isainfo -b
  This will return "32" or "64".

- Using the UltraSum simulator: ST doesn't support it directly, but 
  UltraSim understands spectre models, so you can try this (but
  compare results with spectre simulations!)
  - open Artist; set it up for a spectre sim, use Tools=>*SetupCorners
    to create spectre model files under
    ./simulation/{cellname}/UltraSim/schematic/netlist/
    Copy four files from the "spectre" simulation directory
    to the "UltraSim" simulation directory, including
    - models.scs
    - hiddenOptions.scs
    - corners.scs
    - setupCornersIncludeFile.scs
  - Now set up your UltraSim simulation:
    Under Setup=>SimulationFiles...
    - add "models.scs" to the "Definition Files".
    Under Setup=>Environment:
    - If simulating cells that have a layout view that you extracted
      using PLS, you can add the PLS netlist to the "Stop View List",
      and "Switch View List", so it would change from "spectre" to
      "spectre pls_spectre_rcmax_rcc", for example.
    - If you don't have a layout view, you might be able to
      add "SimMostfetStandard" to the two lists instead
    Try hitting the "Netlist and Run" button to start the simulation.
  No guarantees, but it might work... let me know how it goes.


Review this file occasionally ... I'll keep adding to it.  -- jaro
