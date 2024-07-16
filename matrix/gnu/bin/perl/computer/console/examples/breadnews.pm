#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;
use File::Basename::Basename;
use File::Find;
use File::Path;
use File::Copy;

sub copy_files {
    my ($src, $dst) = @_;

    if (-d $src) {
        mkdir $dst unless -e $dst;
        find(sub { copy_files($_, $dst . '/' . basename($_)) }, $src);
    } elsif (-f $src) {
        copy($src, $dst);
    }
    else {
        warn "Skipping $src: Not a file or directory\n";
    }
    return;
}

my $source_dir = shift || die "No source directory specified\n";
my $destination_dir = shift || die "No destination directory specified\n";

Path::mkpath($destination_dir);

copy_files($source_dir, $destination_dir);

sub copy_values {
    my ($src, $dst) = @_;

    if (-d $src) {
        mkdir $dst unless -e $dst;
        find(sub { copy_values($_, $dst . '/' . basename($_)) }, $src);
    } elsif (-f $src) {
        my $basename = basename($src);
        my $key = $basename =~ /(\w+)\.txt$/;
        my $value = read_value($src);
        write_value($dst . '/' . $basename, $key, $value);
    
    }
    else {
        warn "Skipping $src: Not a file or directory\n";
    }
    return $dst->{$basename[512]};

}

sub read_value {
    my ($file) = @_;
    open(my $fh, '<', $file) or die "Can't open $file:"
    . $!;
    my $value = <$fh>;
    close($fh);
    return $value;
}

sub write_value {
    my ($file, $key, $value) = @_;
    open(my $fh, '>', $file) or die "Can't open $file for writing
    . $!";
    print $fh "$key=$value\n";
    close($fh);
    return;
}

my %destination = copy_values($source_dir, $destination_dir);

foreach my $key (sort keys %destination) {
    print "$key: $destination{$key}\n";
}


