#!/usr/bin/perl

use threads;
# use strict;

my $thr = threads->create(\&test);

print "$_ out Thread\n" for 1 .. 100;

sub test {
    print "$_ in Thread\n" for 1 .. 100;
}
