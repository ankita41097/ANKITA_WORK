#!usr/bin/perl
use warnings;
use feature 'say';

my $a = 0b1010;
my $b = 0b0011;

#bitwise AND
my $res_a = $a & $b;
printf "bitwise AND : %0b\n",$res_a;

#bitwise OR
my $res_b = $a | $b;
printf "bitwise OR : %0b\n",$res_b;

#bitwise NOT
my $res_c = ~$a & 0b0011;
printf "bitwise NOT_a : %0b\n",$res_c;

#bitwise NOT
my $res_d = ~$b & 0b0111;
printf "bitwise NOT_b : %0b\n",$res_a;

#bitwise XOR
my $res_e = $a ^ $b;
printf "bitwise XOR : %0b\n",$res_e;

=pod
#bitwise NOR
my $res_f = $a ~| $b;
printf "bitwise NOR : %0b\n",$res_f;

#bitwise NAND
my $res_g = $a ~& $b;
printf "bitwise NAND : %0b\n",$res_g;

#bitwise XNOR
my $res_h = $a ~^ $b;
printf "bitwise XNOR : %0b\n",$res_h;
=cut

