#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;

my $dir = shift || die "Usage: $0 <directory>\n";
my $extension = 'txt';

my @files = grep { /\.$extension$/i } glob "$dir/*";

foreach my $file (@files) {
    my $filename = basename $file;
    my $size = -s $file;
    my $modified = -M $file;
    print "$filename\t$size\t$modified\n";
}

sub read_file {
    my ($file) = @_;
    my $content;
    open my $fh, '<', $file or die "Error opening file '$file': $!";
    while (my $line = <$fh>) {
        $content .= $line;
    }
    close $fh;
    return $content;
}

my $total_size = 0;
my $total_lines = 0;

foreach my $file (@files) {
    my $content = read_file($file);
    my $lines = scalar split /\n/, $content;
    $total_size += -s $file;
    $total_lines += $lines;
}

print "Total size: $total_size bytes\n";
print "Total lines: $total_lines\n";
