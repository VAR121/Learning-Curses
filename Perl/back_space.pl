#!/usr/bin/perl

use Curses;
use strict;

initscr();
noecho();
cbreak();
# raw();
keypad(1);

my $key = getch();

addstr("$key");

while ($key) {
    if ($key eq "q") {
        last;
    }
    elsif ($key ne KEY_BACKSPACE) {
        addstr("$key");
        $key = getch();
    } elsif( $key eq KEY_BACKSPACE) {

        getyx(my $y, my $x);

        move($y, --$x);
        delch();
        $key = getch();
    } 
}

getch();
endwin();