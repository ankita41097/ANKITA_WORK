#!/usr/bin/perl
use strict;

open(FH,'<',"sample.txt");
my @a = <FH>;
my $l = @a;
close(FILE);
#print("@a\n");
my $c=0;
#foreach(@a)
#--------------finding word -------#
for(my $i=0; $i< $l; $i++)
{
if($a[$i] =~ /digi...m/)
{
$c++;
}
}
#else
print("$c\n");

for(my $i=0; $i< $l; $i++)
{
$a[$i] =~ s/digicomm/Ankita/
}
#print("@a\n");

my $string = "my name is Ankita Banerjee. I am from Kolkata,West Bengal";
my $name = "Ankita";
my $name1 = "Banerjee";
my $str = "Ankita";
if($string =~ /Ankita/)
{
print("Ankita is present\n");
}
else
{
print("Ankita is not present\n");
}
if($string !~ /Banerjee/)
{
print("Banerjee is not present\n");
}
else
{
print("Banerjee is present\n");
}
if($string =~ /ankita/)
{
print("Ankita is present\n");
}
else
{
print("Ankita is not present\n");
}
if($string =~ /ankita/i)
{
print("ankita is present by ignoring the case\n");
}
else
{
print("ankita is not present by ignoring the case\n");
}
if($string =~ /\d/)
{
print("no digit\n");
}
else
{
print("digit\n");
}
if($string =~ /\bkolkata\b/i)
{
print("yes, I am from kolkata\n");
}
else
{
print("no, I am from bangalore\n");
}
if($string =~ /[0-9]/)
{
print("yes digit\n");
}
else
{
print("no digit\n");
}

my $xx =0;
if ($string =~ /a.*z/)
{
$xx++;
print("$xx\n");
}
else
{
print("$xx\n");
}
$string =~ s/ //g;
print("$string\n");

my $sample = "i am under training. My perl sessions are going on. My training started on 4/11/2025.";

if($sample =~ /[-_\.]/)
{
print("-_are present\n");
}
else
{
print("-_aren't present\n");
}

if ("Hello" =~ /H...o/)
{
print("YES\n");
}
if ("Hello" =~ /H.t../)
{
print("Yes word with t as third and H as first letter present.\n");
}
if ("Hello" =~ /H.l../)
{
print("YES\n");
}

if ("Hello" =~ /[a-z]/)
{
print("lowercase present\n");
}
if ("hello" =~ /[A-Z]/)
{
print("uppercase present\n");
}
else
{
print("uppercase absent\n");
}
if ("Hello123" =~ /[a-zA-Z0-9]/)
{
print("Yes numeric also\n");
}
else
{
print("No numeric\n");
}
my $g = int($sample =~ /gr[ea]y/);
print("$g\n");
chomp(my $a = <stdin>);
my $b = int(($a =~ /(0[1-9])/));
print("$b \n");

# match hh:mm:ss format
chomp(my $t = <stdin>);
# match hh:mm:ss format
if($t =~ /(\d\d):(\d\d):(\d\d)/)
{
my $h = $1; print("Hours : $h\n");
my $m = $2; print("Minutes : $m\n");
my $s = $3; print("Seconds : $s\n");
}
