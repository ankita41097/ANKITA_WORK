#!usr/bin/perl
use strict;
#use warnings;

my $filename1 = '/home/ankita/a1/fl_1.txt';
my $filename2 = '/home/ankita/a1/fl_2.txt';

open (AA, '<', $filename1) or die "cannot open file: $!";
open (BB, '<', $filename2) or die "cannot open file: $!";

my @a = <AA>;
my @b = <BB>;
my $la = @a;
my $lb = @b;

print "@a\n";
print "$la\n";
print "@b\n";
print "$lb\n";

close(AA);
close(BB);

my $filename2 = '/home/ankita/a1/fl_2.txt';
open(FH, '>', $filename2) or die "cannot open file: $!";
my @arr = <FH>;
print "the arrey content in write mode: @arr \n";


#my $filename3 = '/home/ankita/a1/sample.txt';
#open(FH_fh, '>', $filename3) or die "cannot open file: $!";
my $num_itr;
 if($la>$lb)
 {
  $num_itr = $la;
  }
  else
  {
  $num_itr = $lb;
  }
   print "$num_itr\n";
  for(my $i=0; $i<$num_itr; $i++)
 {
  print FH $a[$i];
  print FH $b[$i];
 }
print ("appended to file successfully\n");
close(FH);
#close(FH_fh);


=begin
open (FH1, '<', $filename2) or die "cannot open file: $!";

my @a1 = <FH1>;
my $l1 = @a1;
print "@a1\n";
print "$l1\n";

close(FH1);
=cut
