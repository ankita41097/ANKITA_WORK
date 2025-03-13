#!usr/bin/perl
use warnings;
use strict;

#push 
my @array = (1, 2, 3);
push(@array, 4);    # @array becomes (1, 2, 3, 4)
print "pushed array = @array\n";   # Output: 1 2 3 4

#pop
my @array = (5, 6, 7);
my $last = pop(@array);  # $last becomes 3
print "after pop,element: @array\n";        # Output: 1 2
print "Popped element: $last\n";  # Output: Popped element: 3

#shift
my @array = (1, 2, 3);
my $first = shift(@array);  # $first becomes 1
print "after shift, elements: @array\n";           # Output: 2 3
print "Shifted element: $first\n";  # Output: Shifted element: 1

#unshift
my @array = (2, 3);
unshift(@array, 1);   # @array becomes (1, 2, 3)
print "after unshift, elements: @array\n";      # Output: 1 2 3

#slice
my @array = (1, 2, 3, 4, 5);
my @slice = @array[1, 3];   # @slice becomes (2, 4)
print "after slice, elements: @slice\n";            # Output: 2 4

#splice
my @array = (1, 2, 3, 4, 5);
my @removed = splice(@array, 1, 2, 8, 9);  # Removes 2 and 3, inserts 8 and 9
print "after splice, elements: @array\n";            # Output: 1 8 9 4 5
print "spliced elements: @removed\n";          # Output: 2 3

#map
my @array = (1, 2, 3);
my @squared = map { $_ * $_ } @array;  # @squared becomes (1, 4, 9)
print "squared elements: @squared\n";  # Output: 1 4 9

#grep
my @array = (1, 2, 3, 4, 5);
my @even = grep { $_ % 2 == 0 } @array;   # @even becomes (2, 4)
print "elements: @even\n";   # Output: 2 4

#reverse
my @array = (1, 2, 3, 4);
my @reversed = reverse(@array);  # @reversed becomes (4, 3, 2, 1)
print "reversed elements in array: @reversed\n";  # Output: 4 3 2 1

#sort
my @array = (4, 2, 3, 1);
my @sorted = sort @array;  # @sorted becomes (1, 2, 3, 4)
print "sorted elements in array: @sorted\n";         # Output: 1 2 3 4

#join
my @array = ("apple", "banana", "cherry");
my $string = join(", ", @array);   # $string becomes "apple, banana, cherry"
print "string element: $string\n";    # Output: apple, banana, cherry

#split
my $string = "apple,banana,cherry";
my @array = split(", ", $string);  # @array becomes ("apple", "banana", "cherry")
print "splitted string: @array\n";  # Output: apple banana cherry

#scalar
my @array = (1, 2, 3);
my $count = scalar(@array);  # $count becomes 3
print "count of element: $count\n";  # Output: 3

#each
my @array = (1, 2, 3);
while (my ($index, $value) = each @array) {
    print "elements: $index => $value\n";}  # Output: 0 => 1, 1 => 2, 2 => 3

#undef
my @array = (1, 2, 3);
undef $array[1];  # The second element is now undefined
print "elements: @array\n";  # Output: 1  (undef is not printed)

#delete
my @array = (1, 2, 3, 4);
delete $array[1];  # Removes element at index 1
print "deleted element: @array\n";   # Output: 1  (gaps are not removed in arrays)

#Array iteration with foreach
my @array = (1, 2, 3);
foreach my $elem (@array) {
    print "element: $elem\n";}   # Output: 1 2 3

#reverse with for loop
my @array = (1, 2, 3);
foreach my $elem (reverse @array) {
    print "element: $elem\n";}   # Output: 3 2 1

