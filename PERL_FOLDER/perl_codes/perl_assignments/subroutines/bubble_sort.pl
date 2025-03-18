#!usr/bin/perl
#FIXME how many iterations and swapping this algorithm is doing

use strict;
use warnings;
use feature 'say';

my @arr = (65,2,45,32,12,78,4,7,17,24);
print "elements of array before sorting: @arr\n";

sub bubble_sort {
  my @a1 = @_;
  my $n = @a1;
    for (my $i = 0; $i < $n-1; $i++){      # loop for each pass
      for (my $j = 0; $j < $n-1-$i; $j++) {     # loop for comparing adjacent elements
        if ($a1[$j] > $a1[$j+1]) {  
          ($a1[$j], $a1[$j+1]) = ($a1[$j+1], $a1[$j]);
        }
      }
    }
  return @a1;
}

my @sorted_arr = bubble_sort(@arr);
print "sorted array: @sorted_arr\n";
