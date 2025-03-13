#!/usr/bin/perl
use strict;
my $given = "sample2.sv";
open(FILE,'<',$given);
my @a = <FILE>;
my $l = @a;
close(FILE);

print "@a\n";
#my $f = join("",@a);

open(FILE1,'>',"final2.sv");
foreach my $a(@a)

if($a =~ m/\/\*.*\*\//g)
{
 $a =~ s/\/\*.*?\*\///gs;
 }
 elsif($a =~ m/\/\/.*?/g)
 {
  $a =~ s/\/\/.*//g;
  }
 else($a =~ m/\/\/.*?/g)
 {
  $a =~ s/\/\/.*//g;
  }
  print "$a\n";
close(FILE1)

print "all comments removed successfully\n";





=pod
for(my $i=0; $i<$l;$i++)
{
if($f =~ /\/\*/)
{
$f =~ s/\/\*(.*?\s?)*\*\///g
}
elsif($f =~ /^ *\/.*+\n/)
{
$f =~ s/^ *\/.*+\n//g;
}
elsif($f =~ /\/.*+/)
{
$f =~ s/\/.*+//g;
}
}
print FILE1 $f;
close(FILE1);

open(FILE2,'<',"final2.v");
my @b = <FILE2>;
open(FILE3,'>',"final2.v");
for(my $j=0; $j<$l;$j++)
{
if($b[$j] =~ /^\s+$/)
{
$b[$j] =~ s/^\s+$//g;
print FILE3 $b[$j];
}
else
{
print FILE3 $b[$j];
}
}
close(FILE3);
=cut
