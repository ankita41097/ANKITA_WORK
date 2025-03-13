#!usr/bin/perl
use warnings;
use strict;

my @arr = (64, 25, 12, 22, 11, 87, 4, 21, 78);
print "Elements of array: @arr\n";
my $size = @arr;
print "size: $size\n";

for (my $i = 0; $i < @arr - 1; $i++) {
 my $idx = $i;                          #current index holds the smallest element
 for (my $j = $i + 1; $j < @arr; $j++) {
  if ($arr[$j] < $arr[$idx]) {    # Compare elements
     $idx = $j;                   #Update the index of the smallest element
  }
 } 
 my $temp = $arr[$i];
 $arr[$i] = $arr[$idx];
 $arr[$idx] = $temp;
}
print "Sorted Array: @arr\n";
