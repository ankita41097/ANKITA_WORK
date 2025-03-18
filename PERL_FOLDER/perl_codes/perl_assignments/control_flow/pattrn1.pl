#!usr/bin/perl
use strict;
use warnings;
use feature 'say';

print "enter number of rows:";
my $a = <STDIN>;
chomp($a);

for(my $i=$a; $i>=1; $i--)
{
  for(my $j=1; $j<=$i; $j++)
  {
    print ("*");
  }  
    print ("\n");
}

say"------------------------------------";

print "enter number of rows:";
my $b = <STDIN>;
chomp($b);

for(my $x=1; $x<=$b; $x++)
{
  for(my $y=1; $y<=$x; $y++)
  {
    print ("*");
  }  
    print ("\n");
}

print "enter number of rows:";
my $x = <STDIN>;
chomp($x);

for(my $i=1; $i<=$x; $i++)
{
 for(my $j=$x-$i; $j>0; $j--)
 {
  print (" ");
  }
  for(my $k=1; $k<=(2*$i-1); $k++)
  {
  print ("*");
  }
 print ("\n");
}

#################################################
print "enter number of rows:";
my $x = <STDIN>;
chomp($x);

for(my $i=$x; $i>=0; $i--)
{
 for(my $j=$x-$i; $j>0; $j--)
 {
  print (" ");
  }
  for(my $k=1; $k<=(2*$i-1); $k++)
  {
  print ("*");
  }
 print ("\n");
}

#################################################

print "enter number of rows:";
my $x = <STDIN>;
chomp($x);

for(my $i=$x; $i>0; $i--)
{
 for(my $j=$x-$i; $j>0; $j--)
 {
  print (" ");
  }
  for(my $k=1; $k<=$i; $k++)
  {
  print ("*");
  }
 print ("\n");
}









