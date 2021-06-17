
# OsciBear SoC

This is a fork of eFabless's [Caravel (Analog) User-Project Starter](https://github.com/efabless/caravel_user_project_analog). It serves as a delivery area, meeting eFabless's expectations for directory and file layout. Note many of its sub-directories targeted for specific tools (magic, xschem, etc) are left empty or unmodified from the template version. 

Related components: 

* [osci-sky130]() is the meta-repo containing all this stuff (including this repository) as Git sub-modules 
* [chipyard-osci130]() contains the Chisel source and VLSI back-end configuration for the digital half of the SoC. (And is also a fork of https://github.com/ucb-bar/chipyard.) 
* [osci-sky130-bag-workspace]() contains the BAG generator code for the Python-generated analog portions of the SoC, plus the OpenAccess views of all other custom-designed portions, including the top integration levels. This is a fork of the starter [Berkeley Wireless Research Center Sky130 BAG Workspace](https://bwrcrepo.eecs.berkeley.edu/swtech130/bag3_skywater130_workspace), which includes both Sky130-tech-specific and BWRC-site-specific setup. 

