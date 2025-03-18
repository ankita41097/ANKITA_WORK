#!usr/bin/perl
use warnings;
use feature 'say';
 
print "Enter the first string:";
my $str1 = <STDIN>;
chomp ($str1);
#chop ($str1);

print "Enter the second string:";
my $str2 = <STDIN>;
chomp ($str2);
#chop ($str2);

#string comparison
if ($str1 eq $str2){
print "str1 equal to str2\n";}
else{
say "str1 not equal to str2";}

if ($str1 gt $str2){
print "str1 is greater than str2\n";}
else{
say "str1 is not greater than str2";}

if ($str1 lt $str2){
say "str1 is lesser than str2";}
else{
print "str1 is not lesser than str2\n";}

if ($str1 ge $str2){
print "str1 is greater than equal to str2\n";}
else{
say "str1 is not greater than equal to str2";}

if ($str1 le $str2){
say "str1 is lesser than equal to str2";}
else{
print "str1 is not lesser than equal to str2\n";}

#string concatenation
my $a = "ankita";
my $b = "banerjee";

my $c = $a.$b;
print "concatenation_str: $c\n";

#string repetition
my $str3 = "PERL";
print "enter no of times to repeat strings:";
my $str4 = <STDIN>;
chomp ($str4);
my $str5 = $str3 x $str4;
say "repeated strings: $str5";






















 



