[ /CMC/kits/cmos65nm/==README.ECE1396-ECE412 - jaro - January 2017 ]
Create VNC session
vncserver -geometry 1920x1080 -depth 24:1
Password: EWsR2wXn

Create a new empty folder for your design work:
	mkdir $HOME/cmos65nm
	cd $HOME/cmos65nm										# remember cd to here first!

Set up for Cadence, by typing this in a terminal window:
	source /CMC/tools/CSHRCs/Cadence						# run these two lines
	startCds -t cmos65nm
[ Option: you can add this line to your $HOME/.cshrc file by "emacs $HOME/.cshrc"
  to make it take effect in all terminal windows the next time you
  login:
  	source /CMC/tools/CSHRCs/Cadence
]

Create a design library, attach it to the library "cmos065"
	CIW=>File=>New=>Library...
		- type a name for your library
		- slect "Attach to an existing techfile"
		- click "OK"
	In the pop-up window,:
		- set "Technology Library" to "cmos065"
		- click "OK"

Create any new designs in this library.  Add parts from the
libraries cmos065, analogLib, STlib

Further details are in /CMC/kits/cmos65nm/==README.jaro.quickstart
