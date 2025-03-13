#!usr/bin/perl
use strict;
use warnings;

my $str = <<END;
This is the sample text
Welcome to Perl world
This is Ankita Banerjee
END

my $filename = '/home/ankita/perl_assignments/ternary2.pl';

open (FH, '>>', $filename) or die "cannot open file: $!";
print FH $str;
close (FH);

print ("appended to file successfully\n");

