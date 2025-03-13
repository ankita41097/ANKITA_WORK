#!usr/bin/perl
use warnings;
use strict;

my $filename1 = '/home/ankita/perl_assignments/ternary.pl'; 	#path for file1
my $filename2 = '/home/ankita/perl_assignments/ternary2.pl';	#path for file2

open (FH1, '<', $filename1) or die "cannot open file: $!";
open (FH2, '>', $filename2) or die "cannot open file: $!";

while (<FH1>)
{
  print FH2 $_;
}
close (FH1);
close (FH2);
print "content of filename1 successfully copied to filename2 \n"
