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
    my $filename = shift;
    open my $fh, '<', $filename or die "Cannot open file '$filename': $!";
    my $contents = <$fh>;
    close $fh;
    return $contents;
}

sub write_file {
    my ($filename, $contents) = @_;
    open my $fh, '>', $filename or die "Cannot open file '$filename' for writing:
    $!";
    print $fh $contents;
    close $fh;
}

my $contents = read_file 'example.txt';
write_file 'example_copy.txt', $contents;
