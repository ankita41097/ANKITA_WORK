#!usr/bin/perl
use strict;
use warnings;

my @jobs = ('perl bubble_sort.pl',
	    'perl quick_sort.pl',
	    'perl fact.pl');
my $pid;
foreach my $job (@jobs){
     $pid = fork();
    if (!defined $pid){
        die "Fork failed: $!";
    } elsif ($pid == 0) {
        system ($job);
        print "Starting job $job in process $$\n";
        sleep(rand(5));                             # adds delay b\w jobs
        print "Job $job done in process $$\n";
        exit(0);                                    # Ensure the child process exits after completing the task
    }
}
  while(1){
   last if wait() == -1;}
#1 while wait() != -1;
    print "All jobs completed.\n";
