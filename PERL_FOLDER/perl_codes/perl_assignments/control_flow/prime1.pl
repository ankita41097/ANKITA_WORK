#!usr/bin/perl
use warnings;
use strict;


print ("Enter any number: ");
my $num = <STDIN>;
chomp($num);

if ($num <= 1)
{
 print "$num is not a prime number\n";
# print "no of iterations:0\n";
}
#my $count=0;
for (my $i=2; $i <= $num/2; $i++)
{
 #$count++;
 if ($num % $i == 0)
 {
  print "$num is not a prime number\n";}
 else{
   print "$num is a prime number\n";}
}
#print "Total iterations: $count\n";


