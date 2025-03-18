#!usr/bin/perl
use warnings;
use strict;

my %fruit_colours = ( 'guava' => 'green', 'pomegranate' => 'red', 'apricot' => 'peach', 'grape' => 'purple');

print "colour of every fruit: ";
print %fruit_colours;
print "\n";
print "colour of pomegranate: $fruit_colours{'pomegranate'}\n";

while (my ($fruit, $colour) = each %fruit_colours){
  print "$fruit => $colour\n";
  }

print "*******************************************************\n";

$fruit_colours{'banana'} = 'yellow';   # adding new fruit to hash list
$fruit_colours{'guava'} = 'light green'; # modifying an existing key-value pair

while (my ($fruit, $colour) = each %fruit_colours){
  print "$fruit => $colour\n";
  }

print "********************************************************\n";

delete $fruit_colours{'grape'};  #delete the key-value pair
print "updated hash list\n";

while (my ($fruit, $colour) = each %fruit_colours){
  print "$fruit => $colour\n";
  }

print "*********************************************************\n";

if(exists $fruit_colours{'banana'}){
  print "banana exists in hash list\n";
  }
  else{
    print "banana doesnt exists in the hash list\n";}

if(exists $fruit_colours{'grape'}){
  print "grape exists in hash list\n";
  }
  else{
    print "grape doesnt exists in the hash list\n";}

print "*********************************************************\n";

my @keys = keys %fruit_colours;
  print "keys: @keys\n";

print "*********************************************************\n";

my @values = values %fruit_colours;
  print "values: @values\n";

print "*********************************************************\n";

 for(my $i=0; $i< scalar@keys; $i++){
  print "$keys[$i] => $values[$i]\n";}

  


























