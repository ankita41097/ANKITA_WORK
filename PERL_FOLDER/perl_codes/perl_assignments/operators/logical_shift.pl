#!usr/bin/perl
#FIXME shift 64 more times.
use warnings;

my $a = 0b1010;
my $b = 0b0111;

#logical left shift 
my $w = $a << 2;
printf "shift_a: %b\n",$w;

my $y = $b << 1;
printf "shift_b: %b\n",$y;

#logical right shift
my $x = $a >> 1;
printf "shift_a: %b\n",$x;

my $z = $b >> 2;
printf "shift_b: %b\n",$z;

