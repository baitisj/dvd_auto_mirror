#!/bin/sh
### CONFIGURE THIS
# Set this to the device
DEV=/dev/sr0
# Set this to the location that you want the DVD images copied to
OUTDIR=/dvds
###

# Note: dirname is not available on all systems
DIR=$( cd $( dirname -- "$0" ) > /dev/null ; pwd )
TRAYOPEN="$DIR/trayopen"

# Generate trayopen utility if it doesn't exist
if [ ! -x "$TRAYOPEN" ] ; then
	echo "Building prerequisite tool"
	gcc -o "$TRAYOPEN" "$DIR/trayopen.c" || ( echo "Unable to build trayopen tool" && exit 1 )
fi

"$TRAYOPEN" $DEV || eject $DEV

while sleep 1; do 
        i=0
	while "$TRAYOPEN" $DEV ; do
	   echo -ne "\a\rWaiting for drive to close: $i..."
	   let i="$i+1"
	   sleep 1
	done
	dvdbackup -rb -p -M -i $DEV -o $OUTDIR || ( eject $DEV && read -p "There was a problem with this DVD. Press any key to exit and handle this manually." && exit 1 )
	eject $DEV
done
