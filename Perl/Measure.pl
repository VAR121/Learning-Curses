#!/usr/bin/perl

use Curses;
use strict;

initscr();

# getmaxyx(stdscr,my $y, my $x);
addstr("$LINES, $COLS");
refresh();

getch();
endwin();