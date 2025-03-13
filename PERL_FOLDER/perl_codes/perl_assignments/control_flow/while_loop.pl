#!usr/bin/perl
use strict;
use warnings;
use feature 'say';

my $count = 1;
while ($count <= 5) {
 print "$count\n";
  $count++;
}
print "Loop ends here\n";

say "***********************************";

my $cnt = 5;
while($cnt > 0)
{
 print("$cnt\n");
 $cnt--;
 if($cnt == 0){
  print("Happy Birthday to me!\n");}
}

say "************************************";

my $a = 1;
 do 
 {
  print("$a \n");
  $a = $a + 1;
  }
 while($a < 6);
  print("$a \n");

say "************************************";

my $c = 10;
until ($c > 15){
 print "Count is: $c\n";
  $c++;
}
print "End of the loop\n";


say "************************************";

print "-------redo-------\n";
my $a=0;
  while($a < 100)
 {
  $a = $a + 10;

 redo if($a <= 50);
  print("$a\n");
 }

say "************************************";

print("-------next--------\n");
my $b = 25;
  while($b < 30){
  if($b == 27){
#  print "inside if $b\n";
   $b = $b + 1;
   next;
   }
   print "value of a1: $b\n";
   $b = $b + 1;
   }

say "************************************";

print("--------last--------\n");
my $x = 30;
while($x < 35)
{
if($x == 32)
{
last;
}
print("value of x: $x \n");
$x +=1;
}

