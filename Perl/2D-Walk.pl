#!/usr/bin/perl
#Date:July - 25 - 2016
#Author: V A Ramesh
#Purpose: Simulate 2D-Walk with-in a box

use Curses;
use strict;
use warnings;

system("tput civis");
initscr();

box( ACS_VLINE, ACS_HLINE );
getmaxyx( my $mrow, my $mcol );

my $rand_row = int( rand( $mrow - 3 ) );
my $rand_col = int( rand( $mcol - 3 ) );

move( 1 + $rand_row, 1 + $rand_col );

my $h_direction = 1;     #h_: Horizontal(1:Right, -1:Left);
my $v_direction = -1;    #v_: Vertical(-1:Up, 1:Down) Directions

getyx( my $c_row, my $c_col );

while (1) {

    if ( $c_row >= $mrow - 2 ) {
        $v_direction = -1;
    }
    elsif ( $c_row - 1 <= 0 ) {
        $v_direction = 1;
    }

    if ( $c_col >= $mcol - 2 ) {
        $h_direction = -1;
    }
    elsif ( $c_col - 1 <= 0 ) {
        $h_direction = 1;
    }

    $c_row += $v_direction;
    $c_col += $h_direction;

    move( $c_row, $c_col );
    addch("O");
    napms(100);
    refresh();

    move( $c_row, $c_col);
    addch(" ");
}

getch();
endwin();
system("tput cnorm");
