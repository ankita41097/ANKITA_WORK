#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';

print "Enter a date in DD/MM/YYY format:";
my $input = <STDIN>;
chomp($input);

$input =~ m|^(\d{2})/(\d{2})/(\d{4})$|;   

#$input =~ m|^(\d{2})(\d{2})(\d{4})$|;   
  my $day = $1;
  my $month = $2;
  my $year = $3;
  print "day: $day, month: $month, year: $year\n";

#if(my $input =~ m/^(0[1-9]|1[0-9]|2[0-9]|3[01])([ -:\/\.])([1-9]|1[0-2])([ -:\/\.])((17|18|19|20)\d\d)$/){     

if($day =~/^(0[1-9]|1[0-9]|2[0-9]|3[0-1])$/ and $month =~/^(0[1-9]|1[0-2])$/ and $year =~/^17|18|19|20|21\d\d$/)
{
 my @dob = ($day,$month,$year);
  print "@dob\n";
  my $dob = join('/',$day, $month, $year);
  $dob =~ s/\//:/g;
  print "Converted date: $dob\n";
  }
  else{
   print "Date format is invalid\n";}




