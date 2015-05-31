# dvd_auto_mirror
Simple script and tool to automate backing up of DVD media using dvdbackup in mirror mode.
Edit the automirror.sh file before you use this tool.

This script and utility uses Linux kernel headers and the 'dvdbackup' utility. Modifications
to allow this script and/or utilities to work on other platforms are encouraged.

trayopen.c is from Slackware maintainer volkerdi from:
https://www.linuxquestions.org/questions/slackware-14/detect-cd-tray-status-4175450610/
I modified this program to block until the tray loading process is completed; should
probably be broken into another executable in the true spirit of UNIX.
