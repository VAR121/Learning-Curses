#!/usr/bin/perl

use Curses;
use strict;

my $ham1 = "To be, or not to be: that is the question:\n";
my $ham2 = "Whether 'tis nobler in the mind to suffer\n";
my $ham3 = "The slings and arrows of outrageous fortune,\n";
my $ham4 = "Or to take arms against a sea of troubles,\n";
my $ham5 = "And by opposing end them?\n";

initscr();
addstr($ham1);
addstr($ham2);
addstr($ham3);
addstr($ham4);
addstr($ham5);

refresh();
getch();

move(2,25);

for (my $i = 0; $i < 11; $i++) {
    delch();
}

refresh();
getch();
endwin();
exit(0);


__END__
###################################
my $ham1 = "To be, or not to be: that is the question:\n";
my $ham2 = "Whether 'tis nobler in the mind to suffer\n";
my $ham3 = "The slings and arrows of outrageous fortune,\n";
my $ham4 = "Or to take arms against a sea of troubles,\n";
my $ham5 = "And by opposing end them?\n";

initscr();
addstr($ham1);
addstr($ham2);
addstr($ham3);
addstr($ham4);
addstr($ham5);

refresh();
getch();

move(1,0);
deleteln();
refresh();
getch();

endwin();
exit(0);

###################################
__END__
my $str1 = "Stock Market Swells! DOW tops 15,000!";

initscr();
fill();

my @chars = split( //, $str1 );

foreach my $x ( reverse @chars ) {
    move( 5, 5 );
    insch($x);
    refresh();
    napms(100);
}

sub fill {
    getmaxyx( stdscr, my $y, my $x );
    for ( my $a = 0; $a < $y; $a++ ) {
        addstr( "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z\n");
    }
}

getch();

endwin();
exit(0);
###################################
__END__
my $ham1 = "To be, or not to be: that is the question:\n";
my $ham2 = "Whether 'tis nobler in the mind to suffer\n";
my $ham3 = "The slings and arrows of outrageous fortune,\n";
my $ham4 = "Or to take arms against a sea of troubles,\n";
my $ham5 = "And by opposing end them?\n";

initscr();
addstr($ham1);
addstr($ham3);
addstr($ham5);

refresh();
getch();

move(1,0);
insertln(); # Insert a blank line
addstr($ham2);
refresh();
getch();

move(3,0);
insertln(); # Insert a blank line
addstr($ham2);
refresh();
getch();

endwin();
exit(0);
###################################
