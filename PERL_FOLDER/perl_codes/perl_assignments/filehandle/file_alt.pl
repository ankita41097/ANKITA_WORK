#!usr/bin/perl
use strict;
use warnings;

my $filename1 = '/home/ankita/a1/file1.txt';
my $filename2 = '/home/ankita/a1/file2.txt';

open (FH1, '<', $filename1) or die "cannot open file: $!";
open (FH2, '<', $filename2) or die "cannot open file: $!";
my @x = <FH1>;
my @y = <FH2>;
my $lx = @x;
my $ly = @y;

print "@x\n";
print "@y\n";
print "$lx, $ly\n";

close(FH1);
close(FH2);

my $filename3 = '/home/ankita/a1/file3.txt';

open(FH3, '>', $filename3) or die "cannot open file: $!";
 for(my $i=0; $i<$lx; $i++)
{
  print FH3 $x[$i];
  print FH3 $y[$i];
}
close(FH3);

open (FH4, '<', $filename3) or die "cannot open file: $!";

my @a1 = <FH4>;
my $l1 = @a1;
print "@a1\n";
print "$l1\n";

close(FH4);





