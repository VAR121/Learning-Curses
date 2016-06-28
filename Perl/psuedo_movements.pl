#!/usr/bin/perl

use Curses;
use strict;

my $rows = my $cols = 1;

initscr();
system("tput civis");
move(2,2);
addstr("OOOOO(");

box(ACS_VLINE, ACS_HLINE);
refresh();
getmaxyx(my $m_rows, my $m_cols);

my $i = 0;
while ($i < $m_cols) {
    move(2,1);
    insch(" ");
    refresh();

    box(ACS_VLINE, ACS_HLINE);
    refresh();
    napms(60);
    $i++;
}

system("tput cnorm");
addstr("Enter any key to Exit!");
getch();
endwin();
exit(0);
