
# Run eFabless's pre-checks 
set -e

make install 

make precheck \
	CARAVEL_ROOT=${PWD}/caravel \
	PRECHECK_ROOT=${PWD}/open_mpw_precheck 

make run-precheck \
	CARAVEL_ROOT=${PWD}/caravel \
	PRECHECK_ROOT=${PWD}/open_mpw_precheck \
	PDK_ROOT=/tools/B/dan_fritchman/sky130/local/sky130A


