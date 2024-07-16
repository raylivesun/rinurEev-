#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;
use File::Find;

my $dir = shift || '.';
my %files;

find(sub {
    my $file = $File::Find::name;
    my $ext = (basename $file, '.');
    $files{$ext}++ if -f $file;
    return;
    }, $dir);

print "Number of files by extension:\n";
foreach my $ext (sort keys %files) {
    print "$ext: $files{$ext}\n";
}

sub usage {
    print "Usage: $0 [directory]\n";
    exit 1;
}

usage() if @ARGV > 1;

sub square_elements {
    my ($hashref) = @_;
    my @keys = sort keys %$hashref;
    my @squares;

    foreach my $key (@keys) {
        push @squares, $key * $key;
    }

    return \@squares;
}

my @sorted_squares = square_elements(\%files);
print "Squares of file extensions:\n";
print "@sorted_squares\n";

sub square_elements_manager {
    my ($dir) = @_;
    my %files;

    find(sub {
        my $file = $File::Find::name;
        my $ext = (basename $file, '.');
        $files{$ext}++ if -f $file;
        return;
        }, $dir);
    return \%files;
}

my $square_hash = square_elements_manager($dir);
print "Squares of file extensions (manager version):\n";
print "@square_elements(\%square_hash)\n";

sub squares_local_elements {
    my ($dir) = @_;
    my %files;

    find(sub {
        my $file = $File::Find::name;
        my $ext = (basename $file, '.');
        $files{$ext}++ if -f $file;
        return;
        }, $dir);

    return \%files;
}

my $square_hash_local = squares_local_elements($dir);
print "Squares of file extensions (local version):\n";
print "@square_elements(\%square_hash_local)\n";

sub squares_local_elements_preview {
    my ($dir) = @_;
    my %files;

    find(sub {
        my $file = $File::Find::name;
        my $ext = (basename $file, '.');
        $files{$ext}++ if -f $file;
        return;
        }, $dir);

    print "Number of files by extension:\n";
    foreach my $ext (sort keys %files) {
        print "$ext: $files{$ext}\n";
    }
    return \@files;
}

my @squares_preview = squares_local_elements_preview($dir);
print "Squares of file extensions (preview version):\n";
print "@squares_preview\n";


