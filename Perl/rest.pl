#!/usr/bin/perl
#Date:July - 25 - 2016
#Author: V A Ramesh
#Purpose: Simulate 2D-Walk with-in a box

use Curses;
use strict;
use warnings;

system("tput civis");
initscr();
noecho();

getmaxyx( my $mrow, my $mcol );

while (my $gc  = getch()) {

    last if ($gc eq "q");
    clear();
    box( ACS_VLINE, ACS_HLINE );

    my $rand_row = int( rand($mrow - 3) );
    my $rand_col = int( rand($mcol - 3) );
    move(5, 5);
    addstr("$mrow $mcol $rand_row $rand_col");
    move(1 + $rand_row, 1 + $rand_col);
    addch("#");
    refresh();
}


getch();
endwin();
system("tput cnorm");
exit(0);