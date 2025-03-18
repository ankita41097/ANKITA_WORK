#!usr/bin/perl
use strict;
use warnings;

my @arr = (30,89,54,26,12,32,7,45,23,4,76,99);
print "Elements of array before sorting: @arr\n";

my $size = @arr;
print ("Size of array: $size\n");

for (my $i=0; $i<$size-1; $i++)
{  									# Outer loop runs for each pass through the list
 for (my $j=0; $j<$size-1-$i; $j++)
 {  									# Inner loop compares adjacent elements
  if ($arr[$j] > $arr[$j+1])
  {									# Compare the current element with the next one
   ($arr[$j], $arr[$j+1]) = ($arr[$j+1], $arr[$j]);} 			# Swap the elements directly using list assignment
 }
}
print "Sorted array: @arr\n";

