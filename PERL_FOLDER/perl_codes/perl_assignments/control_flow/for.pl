#!usr/bin/perl
use strict;
use warnings;
use feature 'say';

=begin
my $count;
for($count=0; $count<=5; $count++){
print "hello world\n";}

my $counts;
for($counts=0; $counts<=5; $counts+=1){
print "hello world\n";}
=cut

my $a;
  for($a=0; $a<5; $a++){
   print ("value = $a\n");}
   say "************************";

my $b;
  for($b=10; $b>5; $b--){
   printf ("value = $b\n");}
   say "*************************";

my $c;
  for($c=1; $c<=16; $c*=2){
   print ("value = $c\n");}
   say "***************************";

my $d;
  for($d=16; $d>3; $d/=2){
   print ("value = $d\n");}
  say "****************************";
# FIXME if no = is there what will happen
my $e;
  for($e=16; $e>=1; $e>>=1){
   print ("value = $e\n");}
   say "****************************";

my $f;
  for($f=1; $f<=14; $f<<=1){
   print ("value = $f\n");}
   say "*****************************";

