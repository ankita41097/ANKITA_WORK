#!usr/bin/perl
use warnings;
use strict;

=begin
my $str = <<END;
This is the sample text
Welcome to Perl world
This is Ankita Banerjee
END
=cut

my $filename = '/home/ankita/perl_assignments/script.pl';

open(FH, '<', $filename) || die "cannot open file: $!";
while (<FH>){
 print $_;
}
print ("file $filename opened successfully\n");
close (FH);







