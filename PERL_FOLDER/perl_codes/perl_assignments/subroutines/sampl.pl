#!usr/bin/perl
use warnings;
use strict;

sub say_hello{
  print "Hello, Welcome to subroutines\n";
}

say_hello();
say_hello();

sub greetings{
  my ($name) = @_;
  print "Hello, $name!\n";
  }

greetings("Ankita");
greetings("Priti");

print "*****************************\n";

sub square{
  my ($num) = @_;
  return $num * $num;
}
my $result = square(6);
print "square of 6 is: $result\n";

print "*****************************\n";

sub addition{
  my ($num1, $num2) = @_;
  return $num1 + $num2;
}
my $result = addition(10,15);
print "addition of 10 and 15 is: $result\n";


print "******************************\n";

sub calculate{
  my ($a, $b) = @_;
  my $sum = $a + $b;
  my $prod = $a * $b;
  return ($sum, $prod);
  }
my ($sum, $prod) = calculate (15,20);
print "Sum: $sum, Product: $prod\n";











