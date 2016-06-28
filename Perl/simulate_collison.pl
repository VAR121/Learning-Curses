#!/usr/bin/perl

use Curses;
use strict;

my $rows = my $cols = 1;

initscr();
system("tput civis");
my $direction = 1;

while (1) {
    getmaxyx( my $max_rows, my $max_cols );
    move( $rows, $cols );
    addstr("O");
    refresh();

    $cols += $direction;

    napms(60);

    clear();

    box( ACS_VLINE, ACS_HLINE );
    refresh();

    my $next_col = $direction + $cols;

    if ( $next_col >= $max_cols - 1 ) {
        $direction = -1;
    }
    elsif ( $next_col <= 0 + 1 ) {
        $direction = 1;
    }
}

getch();
endwin();
system("tput cnorm")
