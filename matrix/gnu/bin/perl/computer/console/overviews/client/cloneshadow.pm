#!/usr/bin/perl -w 


use strict;
use warnings;

use FindBin;
use File::Find;

my $dir = $FindBin::Bin;

sub process_file {
    my $file = shift;
    my $size = -s $file;
    my $extension = (split /[.]/, $file)[$#split /[".
    /"] - 1];

    print "File: $file\n";
    print "Size: $size bytes\n";
    print "Extension: $extension\n";
    print "--------------------\n";
}


find(\&process_file, $dir);

