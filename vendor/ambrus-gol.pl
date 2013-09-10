#!/usr/bin/perl
use warnings; use strict; use 5.010; 
use Time::HiRes "sleep";

our $DELAY = 0.05;

# determine size of terminal
my $w = pack "S4", 24, 79;
ioctl STDIN, $_, $w for 0x40087468, 0x5413;
our($R, $C) = unpack "S2", $w; $R--;

our $b;
if (rand 3 < 1) {
    # glider gun pattern
    $b = pack "(A$C)[Lx$R]", ("")x3, split /^/, "
                                  1
                                1 1
                      11      11            11
                     1   1    11            11
          11        1     1   11
          11        1   1 11    1 1
                    1     1       1
                     1   1
                      11 ";
} else {
    # generate random bitmap as starting state
    $b = pack "(A)*", map { rand 3 < 1 } 0 .. 2*$R*$C;
}

system qw"tput clear";

while () {

    # display game board
    system qw"tput home";
    say for unpack "xx$C(a$C)$R", $b;

    sleep $DELAY; 

    # game of life evolution step
    no warnings "numeric";
    $b = 
        pack "xx$C(A)*xx$C", 
        unpack "(x7a/(x13)X4Ax!18)[(A$R)$C]", 
        pack "((a*)17xx!18)*x3", 
        unpack "((AAAX3AAA\@$C AXAAAXAx$C (X3AAA)2\@)$C)$R", 
        $b;

}

__END__
