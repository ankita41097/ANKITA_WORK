#!/usr/bin/perl
use strict;
use feature 'say';

open(FH,'<',"sample.txt");

my $count=0;
 while(<FH>){

if($_=~/hello/i){
$count++;
 print "hello found,$count,$_\n";
}

if($_ =~ s/digicomm/Ankita/){
 print "$_";
}

if($_ !~/kolkata/){
 print " found,$_";
}

if($_ =~/\d/){
 print"digits found:$_";
}

if($_ =~/[0-9]/){
 print"$_";
}

if($_ =~s/ //g){
 print"Removed $_";
}
}
close(FH);


