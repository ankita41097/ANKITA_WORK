#!usr/bin/perl
use warnings;
use strict;

my $file = "sample2.sv";
open(FH, '<', $file);
my @a = <FH>;
my $l = @a;
close(FH);

my $f = join("",@a);

open(FH1, '>', "final2.sv");
for(my $i=0; $i<$l; $i++)
{
if($f =~ /\/*/)
{
 $f =~ s/\/\*(.*?\s?)*\*\///g
 }
 elsif($f =~ /^ */)
