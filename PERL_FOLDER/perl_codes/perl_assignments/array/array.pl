#!usr/bin/perl
use warnings;
use feature 'say';

my @array1 = (23,56,87,98,34,12,32,11,1,5,7,33);
print "elements of array: @array1\n";
printf "element:$array1[5]\n";
printf "element:$array1[7]\n";

#1 reverse - it will reverse the array order
my @reversed_arr = reverse @array1;
print "Reversed array: @reversed_arr\n";

#2 sort - it will sort all the elements in ascending order
my @sort_arr = sort @array1;
print "Sorted array: @sort_arr\n";

#3 push - adds elements to the end of an array
push (@array1,"ankita",31);
print "after push, elements: @array1\n";
printf "fnfnkfkew, @array";
#4 pop - remove elements from end of the array
my $var1 = pop(@array1);
print "after pop, elements: @array1\n";
print "popped element: $var1\n";

#5 shift - remove the first element of an array
my $var2 = shift(@array1);
print "after shift, elements: @array1\n";
print "shifted element: $var2\n";

#6 unshift - add element from front in an array
unshift (@array1, 99,43);
print "after unshift, elements: @array1\n";

#7 splice - remove and replace in the array in specified position
my @arr1 = (1, 2, "ashu", 3, 4, 5, "ankita", "priti", "sushanki");
print "array element before splicing: @arr1\n";
my @var3 = splice (@arr1,5,3,10,11,12);
print "spliced array: @arr1\n";
print "spliced element: @var3\n";

#8 slice - it will allow you to extract specific elements using indices
my @arr2 = (20, 60, 90, 54, "digicomm", "perl", "gvim", 25);
my @slice = @arr2[3,6];  
print "sliced element: @slice\n";

#9 split - it will split string into an array
my $str = ("int!integer!float!strings!logic");
print "string elements before split: $str\n";
my @spl = split("!",$str);
print "split elements: @spl\n";

#10 scalar - size of the array - get the number of elements in an array
my @items = (2, 4, 7, 10, "ankita");
my $a = @items;
print "no of elements: $a\n";
my @count = scalar(@items);
print "count of elements: @count\n";

#11 join - combine array elements into a single string 
my @arr3 = ("hello", "ankita", "priti","sushanki");
my @arr_join = join("/",@arr3);
print "array before join: @arr3\n";
print "joined array: @arr_join\n";

#12 map - apply transformation to each element in an array
my @num = (2,5,8,9);
my @sqrs = map({$_*$_} @num);
#FIXME try with a variable.
print "squared number: @sqrs\n";

#13 grep - filter elements based on a condition
print "elements: @array1\n";
my @less_than_80 = grep({$_<80} @array1);
print "less than 50 elements are: @array1\n";

#14 exist - it checks whther the element exist in the array or not
my @array2 = (5,10,15,20,25,30,35,40,45,50,55);
for($i=0;$i<1;$i++){
if(exists($array2[$i])){
print "number exist\n";}
else{
print "number does not exist\n";}}

my @a1 = ();
print "element stored: @a1\n";


