#!/usr/bin/perl -w
use strict;


my $running = `ps -A -ef | grep Murmur | grep qemu | grep -v "ps -A -ef" | wc -l`;
chomp($running);
my $checkval = 0;

print 'running: ' . $running . "\n";
print 'checkval: ' . $checkval . "\n";


while(1){
    $checkval = `ps -A -ef | grep Murmur | grep qemu | grep -v "ps -A -ef" | wc -l`;
    chomp($checkval);
    
    if($checkval && !$running){
        $running = 1;
        system("~/scripts/monitor-set --off");
    } elsif(!$checkval && $running) {
        $running = 0;
        system("~/scripts/monitor-set --on");
    }

   print 'running: ' . $running . "\n";
   print 'checkval: ' . $checkval . "\n";

    sleep(8);
}

