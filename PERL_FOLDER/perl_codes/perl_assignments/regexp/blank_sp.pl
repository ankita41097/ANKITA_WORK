#!usr/bin/perl
use warnings;
use strict;

my $filename = "file1.txt";
my $filename1 = "file2.txt";

open (my $fh,'<', $filename) or die "cannot open file $filename: $!";
open (my $fh1,'>', $filename1) or die "cannot open file $filename1: $!";

while(my $lines = <$fh>){
$lines =~ s/^\s+//g;
print $lines;
print $fh1 $lines;
}
print "Blank lines removed successfully from $filename.\n";
close($fh);
close($fh1);

