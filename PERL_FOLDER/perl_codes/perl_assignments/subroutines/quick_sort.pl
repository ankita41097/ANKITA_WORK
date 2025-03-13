#!usr/bin/perl
#FIXME how many iterations and swapping this algorithm is doing
#FIXME give the odd and even number of elements
use warnings;
use strict;

=pod
print "enter array elements";
my @arr = <stdin>;
chomp(@arr);
=cut

my @arr = (45,65,23,12,55);
print "elements of array: @arr\n";

sub quick_sort{
 #my $count = 1;
 my @arr = @_;
 #print "value of array: @_\n";
 return @arr if @arr<=1;
 my $pivot = pop @arr;
 my @smaller = grep {$_<=$pivot}@arr;
 my @greater = grep {$_>=$pivot}@arr;
 #$count++;
 return (quick_sort(@smaller), $pivot, quick_sort(@greater));
 }


my @sorted_arr = quick_sort(@arr);
print "sorted array: @sorted_arr\n";
#print "count:$count\n";



