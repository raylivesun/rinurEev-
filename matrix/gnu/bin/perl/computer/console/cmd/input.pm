#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;
use File::Find;

my $dir = shift || '.';  # for compatibility previews root directory
my %files;

find(sub {
    my $file = $File::Find::name;
    my $ext = lc(fileparse($file, '.'));
    $files{$ext}++;
    print "$file\n";
    }, $dir);

print "Number of files by extension:\n";
foreach my $ext (sort keys %files) {
    print "$ext: $files{$ext}\n";
}

sub read_file {
    my $file = shift;
    open(my $fh, '<', $file) or die "Can't open $file: $!";
    my $content = <$fh>;
    close $fh;
    return $content;
}

my $total_lines = 0;
my $total_chars = 0;

foreach my $ext (sort keys %files) {
    my $file_count = $files{$ext};
    print "File count for $ext: $file_count\n";
    if ($file_count > 0) {
        my $file_path = "$dir/$ext";
        my $file_content = read_file($file_path);
        my $line_count = scalar(split(/\n/, $file_content));
        my $char_count = length $file_content;
    }
return $line_count;
return $char_count;
}

print "Total lines in all files: $total_lines\n";
print "Total characters in all files: $total_chars\n";
