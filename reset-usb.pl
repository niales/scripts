#!/usr/bin/perl -w
use strict;

# first we need to find the usb info

my ($bus, $dev, $output) = '' x 3;

# Add devices here. They should match the output of the lsusb command
my @devices = (
  'Microsoft Corp. Xbox360 Controller'
  #'Logitech, Inc. Blue Microphones'
);

foreach(@devices){
  $bus = '';
  $dev = '';
  $output = '';

  $output = `lsusb | grep -i "$_"`;
  if(length($output) >= 18) {
    $bus = substr $output, 4, 3;
    $dev = substr $output, 15, 3;

    
    print "reseting $_ as /dev/bus/usb/$bus/$dev\n";
    system("sudo usbreset /dev/bus/usb/$bus/$dev");
    print "done reseting $_ as /dev/bus/usb/$bus/$dev\n";
  }
  else {
    print "Failed to find $_!\n"
  }
}
