#!usr/bin/perl
use strict;
use warnings;
use feature 'say';

print "Enter a string: ";
my $input = <stdin>;
chomp ($input);

#$input =~ s/[^a-zA-Z0-9]//g;
#my $input = lc $input;

my $is_palindrome=0;
my $length = length($input);

=pod
if ($input eq reverse $input) {
    print "Input string is a palindrome.\n";
}
else {
    print "Input string is not a palindrome.\n";
}
=cut
#=pod
for (my $i = 0; $i < $length / 2; $i++) {
    if (substr($input, $i) eq substr($input, $length - $i - 1)) {
    		$is_palindrome=1;
    }
    else{
	    $is_palindrome=0;
	 }
}
	my $result = $is_palindrome? "palindrome":"not_palindrome";
       print "Entered string is: $result ";
#=cut
