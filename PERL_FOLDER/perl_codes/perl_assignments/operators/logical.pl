#!usr/bin/perl
use warnings;
use feature 'say';

my $a = 0b1010;
my $b = 0b0000;

#Logical AND
if($a && $b){
	print "true\n";}
else{
	print "false\n";}

#Logical OR
if($a || $b){
	print "true\n";}
else{
	print "false\n";}

#Logical NOT
if(!$a){
	print "true\n";}
else{
	print "false\n";}
