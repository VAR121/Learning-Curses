#!/usr/bin/perl
#Author: V A Ramesh
#Date: June - 8 - 2016
#Purpose: Moving Cursor All over the term screen

use Curses;
use strict;

system("tput civis");
initscr();
cbreak();
noecho();
keypad(1);

box( ACS_VLINE, ACS_HLINE );

move( 2, 5 );
printw("Enter Left/Right/Up/Down key to move or q to exit ");

getmaxyx( my $max_row, my $max_col );

my $center = int $max_col / 2;

move( 3, $center );
printw("#");
my $row = my $col = 0;

while ( my $key = getch() ) {

    if ( $key eq "q" ) { last; }
    getyx( $row, $col );

    if ( $col == 2 && $key == KEY_LEFT ) {
        next;
    }
    elsif ( $col == $max_col - 1 && $key == KEY_RIGHT ) {
        next;
    }
    elsif ( $row == 1 && $key == KEY_UP ) {
        next;
    }
    elsif ( $row == $max_row - 2 && $key == KEY_DOWN ) {
        next;
    }

    if ( $key == KEY_LEFT ) {
        move( $row, --$col );
        printw(" ");
        move( $row, --$col );
        printw("#");

    }
    elsif ( $key == KEY_RIGHT ) {
        move( $row, --$col );
        printw(" ");
        move( $row, ++$col );
        printw("#");
    }
    elsif ( $key == KEY_UP ) {
        move( $row, --$col );
        printw(" ");
        move( --$row, $col );
        printw("#");
    }
    elsif ( $key == KEY_DOWN ) {
        move( $row, --$col );
        printw(" ");
        move( ++$row, $col );
        printw("#");
    }
    else {
        move( 10, 5 );
        printw("Wrong Key Entered!!");
        refresh();
        napms(900);
        move(10, 5);
        addstr(" ") for ( 1 .. 19);
        move($row, $col);
    }
    refresh();
}

endwin();
system("tput cnorm");
