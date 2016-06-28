#!/usr/bin/perl

use Curses;
use strict;
curs_set(0);

initscr();
box(ACS_VLINE, ACS_HLINE);

getch();
endwin();