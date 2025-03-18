#!usr/bin/perl
use strict;
use warnings;

print ("Enter any number: ");
my $num = <STDIN>;
chomp($num);

if ($num <= 1) {
    print "$num is not prime.\n";
} elsif ($num == 2) {
    print "$num is prime.\n";
} elsif ($num % 2 == 0) {
    print "$num is not prime.\n";
} else {
    my $sqrt = 0;
    for (my $i = 0; $i * $i <= $num; $i++) {
        $sqrt = $i;
     }

    my $a = 1; 
    for (my $j = 3; $j <= $sqrt; $j += 2) {
        if ($num % $j == 0) {
	my $a = 0;
        }
      }
    if(my @a == 1){
     print "$num is prime\n";
     }else{
      print "$num is not prime\n";
}
}

