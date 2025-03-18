#!usr/bin/perl
use strict;
use warnings;

my @arr = (30, 89, 54, 26, 12, 32, 7, 45, 23, 4, 76, 99);
print "Elements of array before sorting: @arr\n";

my $size = @arr;
print ("Size of array: $size\n");

bubble_sort(\@arr); 
print "Sorted array: @arr\n";

sub bubble_sort {
  my ($arr_ref) = @_;  # Accept the array reference as a parameter
    my $size = scalar @$arr_ref;  # size of the array from the reference

    for (my $i = 0; $i < $size - 1; $i++) {
      for (my $j = 0; $j < $size - 1 - $i; $j++) {
        if ($arr_ref->[$j] > $arr_ref->[$j + 1]){ 
            ($arr_ref->[$j], $arr_ref->[$j + 1]) = ($arr_ref->[$j + 1], $arr_ref->[$j]);}
         }
         }
         }
