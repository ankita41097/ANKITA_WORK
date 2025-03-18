#!usr/bin/perl
use strict;
use warnings;

my $f1 = 'ternary2.pl';

# -e file exist or not
if(-e $f1){
 print ("file $f1 exists\n");
 }
 else{
  print ("file $f1 does not exists\n");
}

# -w file is writable or not
if(-w $f1){
 print ("file $f1 is writable\n");
 }
 else{
  print ("file $f1 is not writable\n");
}

# -r file is readable or not
if(-r $f1){
 print ("file $f1 is readable\n");
 }
 else{
  print ("file $f1 is not readable\n");
}

#file is executable or not
if(-x $f1){
 print ("file $f1 is executable\n");
 }
 else{
  print ("file $f1 is not executable\n");
}

#file is empty or not
if(-z $f1){
 print ("file $f1 empty\n");
 }
 else{
  print ("file $f1 not empty\n");
}

#file size in bytes
my $size = -s $f1;
if(-s $f1){
 print ("file $f1 has non zero size and size: $size bytes\n");
 }
 else{
  print ("file $f1 does not have non zero size\n");
}

# file is plain or not
if(-f $f1){
 print ("file $f1 is plain\n");
 }
 else{
  print ("file $f1 not plain\n");
}

# multiple perl test operators

if(-e -f -r $f1){
 print ("file $f1 exists and readable\n");
 }
 else{
  print ("file $f1 does not exists and not readable\n");
  }

if(-e -w -f $f1){
 print ("file $f1 exists and writable\n");
 }
 else{
  print ("file $f1 does not exists and not writable\n");
}

if(-e -r -w -x $f1){
 print ("file $f1 exists, readable, writable and executable\n");
 }
 else{
  print ("file $f1 not exists, readable, writable and executable\n");
}
