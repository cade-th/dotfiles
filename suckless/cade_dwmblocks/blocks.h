//Modify this file to change what commands output to your statusbar, and recompile using the make command.
// what is going on
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "status-systemstats.sh", 10, 14},
	{"", "date '+%b %d (%a) %I:%M%p'",5,0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
