#!/usr/bin/perl
use strict;
use warnings;
my $count;

print "Enter a number:";
my $num = <STDIN>;
chomp($num);

 my $fact = 1;
  for (my $i = 1; $i <= $num; $i++) {
   $fact *= $i;}
   $count++;
    print "The factorial of $num is $fact, $count\n";

