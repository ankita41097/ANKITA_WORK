#!usr/bin/perl
use warnings;
use strict;
use feature 'say';

print "Enter any date of birth in the format (DD-MM-YYYY): ";
my $dob = <STDIN>;           
chomp($dob);  

if ($dob =~ /^(\d{2})-(\d{2})-(\d{4})$/) {
  my ($day, $month, $year) = ($1, $2, $3);

  if ($month >= 1 and $month <= 12) {
    my @no_of_days = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

      if ($month == 2 and ($year % 4 == 0 and ($year % 100 != 0 or $year % 400 == 0))){
      $no_of_days[1] =29;
       print "leap year\n";}
      else{
        print "not a leap year.\n";
      }
      if ($day >= 1 and $day <= $no_of_days[$month - 1]){
        print "DOB is valid\n";
      } 
       else{
        print "Day is invalid for the given month.\n";
       }
      }
       else {
        print "Month is invalid. Enter valid month.\n";
       }
    }
     else {
      print "Date is invalid. Enter valid date in (DD-MM-YYYY) format.\n";
}
