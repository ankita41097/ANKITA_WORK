#!usr/bin/perl
use strict;
use warnings;

my $file = "sample2.sv";
my $file1 = "final2.sv";
open(FH, '<', $file) or die "cannot open $file: $!";
open(FH1, '>', $file1) or die "Cannot open $file1: $!";

my @a = <FH>;

print "content: @a\n";
my $f = join("_", @a);
#print "$f\n";

$f =~ s/\/\*.*?\*\/\s//gs;  # search and remove multiline comments
$f =~ s/\/\/.*+//g;        # search and remove single line comment      
$f =~ s/\n{2,}/\n/g;       #match 2 or more consc newlines and relace with single line

print "$f\n";
my @b = split("_", $f);

print "Final content:\n@b\n";
print FH1 $f;

close(FH);
close(FH1);

