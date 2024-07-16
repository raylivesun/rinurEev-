#!/usr/bin/perl -w 

use strict;
use warnings;

use FindBin;
use File::Find;

my $directory = findbin::abs_path;
my $total_size = 0;

sub process_file {
    my $file = $File::Find::name;

    if (-f $file) {
        my $size = -s $file;
        print "$file: $size bytes\n";
        $total_size += $size;
    }
}


find(\&process_file, $directory);

print "Total size of files in $directory: $total_size bytes\n";
