#!/usr/bin/perl -w
use strict;

my $running = `ps -A -ef | grep win10 | grep qemu | grep -v "ps -A -ef" | wc -l`;
chomp($running);
my $checkval = 0;

while(1){
    $checkval = `ps -A -ef | grep win10 | grep qemu | grep -v "ps -A -ef" | wc -l`;
    chomp($checkval);
    
    if($checkval && !$running){
        $running = 1;
        system("monitor-set --off");
    } elsif(!$checkval && $running) {
        $running = 0;
        system("monitor-set --on");
    }

    sleep(8);
}