#!usr/bin/perl
use warnings;
use strict;

print "Enter the number of terms:";
my $a = <stdin>;
chomp($a);

sub fibonacci{
  my ($num) = @_;
  return 1 if ($num == 0) || ($num == 1);
  return fibonacci($num - 1) + fibonacci($num - 2);
  }

print "Fibonacci series up to $a:";
for (my $i =0; $i<=$a-1;$i++){
#for my $i(0..$a-1){
  print fibonacci($i)," ";
  }
print "\n";
