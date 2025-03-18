#!usr/bin/perl
use warnings;
use strict;
use feature 'say';

print "Enter the first number:";
my $a = <stdin>;
chomp($a);

print "Enter the second number:";
my $b = <stdin>;
chomp($b);

print "Enter the operation:";
my $operation = <stdin>;
chomp($operation);

sub add{
  my ($a, $b) = @_;
  return $a + $b;
  }

sub subtract{
  my ($a, $b) = @_;
  return $a - $b;
  }

sub mult{
  my ($a, $b) = @_;
  return $a * $b;
  }

sub div{
  my ($a, $b) = @_;
  return $b == 0 ? "error": $a / $b;}
  
sub divide {
  my ($a, $b) = @_;
  return "Error: Division by zero" if $b == 0;
  return $a / $b;}

my $res;
  if($operation eq '+'){
   $res = add($a, $b);}

   elsif($operation eq '-'){
   $res = subtract($a, $b);}

   elsif($operation eq '*'){
   $res = mult($a, $b);}

   elsif($operation eq '/'){
   $res = div($a, $b);}

   else{
     $res = "invalid operator";}

print "final result = $res\n";
















