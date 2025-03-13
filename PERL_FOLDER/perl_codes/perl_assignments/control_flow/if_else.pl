#!usr/bin/perl
use warnings;
use strict;

my $x = 10;
 if($x % 2 == 0)
{
  if ($x % 5 == 0)
{
   print "number is divisible by 2 and 5\n";}
}

######################################################

print "enter any number:";
my $a = <STDIN>;
 if($a == 15){
  printf "value:$a\n";}
 elsif ($a == 10){
  printf "value:$a\n";}
 elsif ($a == 20){
  printf "value:$a\n";}
  else{
   print "not matched\n";
}

######################################################

print "Enter any number:";
my $b = <STDIN>;

unless($b <= 10){	#if condition is false, it will execute 'if' condition
 printf "value = $b\n";}
 else{
  print "not less than 10\n";}









