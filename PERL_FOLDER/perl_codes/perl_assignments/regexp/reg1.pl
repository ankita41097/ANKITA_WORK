my $string = "My name is Ankita Banerjee. I am 1997 born**, 4th october. I am from Kolkata, West Bengal..";
if($string =~ /Ankita/)		#Search
{
print("Ankita is present\n");}
else{
print("Ankita is not present\n");}

if($string !~ /Banerjee/){
print("Banerjee is not present\n");}
else{
print("Banerjee is present\n");}

if($string =~ /ankita/){
print("Ankita is present\n");}
else{
print("Ankita is not present\n");}

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
my $a =0;
if ($string =~ /a.*z/)
{
$a++;
print("$a\n");
}
else
{
print("$a\n");
}
$string =~ s/ //g;
print("$string\n");

if($string =~ /[-_\.]/)
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
