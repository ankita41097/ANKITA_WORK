#!usr/bin/perl
use warnings;
use feature 'say';

print "Enter your input:";
my $str1 = <STDIN>;

# chomp

#my $str_chomped = $str1;
print "Chomp Example\n";
print "print initial string without chomp: $str1";
print "Original string with new line: $str1\n";
chomp($str1);
print "string after chomp: $str1\n";
#print "\n";

# chop
my $str_chopped = $str1;
print "Chop Example\n";
print "initial string without chop: $str_chopped\n";
chop($str_chopped);  	# Removes the last character, which is usually the newline or it can be word
print "After chop: $str_chopped\n";
