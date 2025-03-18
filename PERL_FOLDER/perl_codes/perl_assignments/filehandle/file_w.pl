#!usr/bin/perl
use warnings;
use strict;

my $str = <<END;
This is the sample text
Welcome to Perl world
This is Ankita Banerjee
I live in bengaluru
END

my $filename = '/home/ankita/a1/ank.txt';


open (FH,'>',$filename) or die "cannot open file: $!";
print FH $str;

print ("write to file successfully\n");
close (FH);








