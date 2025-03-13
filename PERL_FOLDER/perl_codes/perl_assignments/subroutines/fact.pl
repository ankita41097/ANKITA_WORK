#!usr/bin/perl
use warnings;
use strict;
=pod
print "Enter number:";
my $input = <stdin>;
chomp($input);
=cut

my $input = 5;
sub factorial{
  my ($num) = @_;
  return 1 if $num == 0;
  return $num * factorial($num - 1);
  }

my $res = factorial($input);
print "Factorial of $input: $res\n";


