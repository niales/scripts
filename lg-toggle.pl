#!/usr/bin/perl -w
use strict;

my $running = `ps -ef | grep "looking-glass-client" | grep -v "grep" | grep -v "qemu-system" | wc -l`;
chomp($running);

if($running) {
    print "test1\n";
    system("killall looking-glass-client");
} else {
    print "test NOT 1\n";
    exec("looking-glass-client -s -F");
}