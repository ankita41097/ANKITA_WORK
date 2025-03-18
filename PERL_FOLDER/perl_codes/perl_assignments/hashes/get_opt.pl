#!/usr/bin/perl
use strict;
use Getopt::Long;

my $length;
my $data;

GetOptions("length=i" => \$length,
           "data=s"=> \$data,
	   ) 
	   or die "no arguments\n";

print "Length: $length\n" if $length;
print "Data: $data\n" if $data;

if (!$length || !$data){
  print "error: --length and --data are manadatory\n";
}





