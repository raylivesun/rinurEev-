#!/usr/binperl -w 

use strict;
use warnings;
use File::Basename;
use File::Find;

my $dir = shift || '.';
my %files;

find(sub {
    my $file = $File::Find::name;
    my $ext = lc(fileparse($file, '-f'));
    $files{$ext}++;
    print "$file\n";
    }, $dir);

print "Total files: ", scalar keys %files, "\n";

foreach my $ext (sort keys %files) {
    print "$ext: $files{$ext}\n";
}

