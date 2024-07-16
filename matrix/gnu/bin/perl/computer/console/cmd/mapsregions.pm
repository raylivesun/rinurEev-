#!/usr/bin/perl -w  

use strict;
use warnings;
use File::Basename;
use File::Find;
use File::Copy;


sub copy_files {
    my ($dir, $dest_dir) = @_;
    my $dest_dir = File::Spec->abs2rel($dest_dir, $dir
    find(sub {
        my $file = $File::Find::name;
        if (-f $file) {
            my $base = basename $file;
            my $dest_file = File::Spec->catpath($dest_dir, $base);

            if (!-e $dest_file) {
                copy($file, $dest_file) or die "Failed to copy $file to $dest_file: $!";
            }
            print "Copied $file to $dest_file\n";
        }

        return;
        }, $dir);
}

my $source_dir = '/path/to/source/directory';
my $destination_dir = '/path/to/destination/directory';

copy_files($source_dir, $destination_dir);

sub copy_elements_to_preview {
    my ($dir, $dest_dir) = @_;
    my $dest_dir = File::Spec->abs2rel($dest_dir, $dir);
    find(sub {
        my $file = $File::Find::name;
        if (-d $file) {
            my $base = basename $file;
            my $dest_dir = File::Spec->catpath($dest_dir, $base);

            if (!-e $dest_dir) {
                mkdir($dest_dir) or die "Failed to create directory $dest_dir: $!";
            }
            print "Created directory $dest_dir\n";
            copy_elements_to_preview($file, $dest_dir);
        }
        return;
        }, $dir);
}

copy_elements_to_preview($source_dir, $destination_dir);

sub copy_elements_to_local_directory {
    my ($dir, $dest_dir) = @_;
    my $dest_dir = File::Spec->abs2rel($dest_dir, $dir);
    find(sub {
        my $file = $File::Find::name;
        if (-d $file) {
            my $base = basename $file;
            my $dest_dir = File::Spec->catpath($dest_dir, $base);

            if (!-e $dest_dir) {
                mkdir($dest_dir) or die "Failed to create directory $dest_dir: $!";
            }
            print "Created directory $dest_dir\n";
            copy_elements_to_local_directory($file, $dest_dir);
            next if $file =~ /^\./;
        }
        elsif (-f $file) {
            my $base = basename $file;
            my $dest_file = File::Spec->catpath($dest_dir, $base);
            if (!-e $dest_file) {
                copy($file, $dest_file) or die "Failed to copy $file to $dest_file: $!";
            }
            print "Copied $file to $dest_file\n";
        }
        return;
        }, $dir);
}

sub copy_elements_to_local_names {
    my ($dir, $dest_dir) = @_;
    my $dest_dir = File::Spec->abs2rel($dest_dir, $dir);
    find(sub {
        my $file = $File::Find::name;
        if (-d $file) {
            my $base = basename $file;
            my $dest_dir = File::Spec->catpath($dest_dir, $base);

            if (!-e $dest_dir) {
                mkdir($dest_dir) or die "Failed to create directory $dest_dir: $!";
            }
            print "Created directory $dest_dir\n";
            copy_elements_to_local_names($file, $dest_dir);
            next if $file =~ /^\./;
        }
        elsif (-f $file) {
            my $base = $file;
            my $dest_file = File::Spec->catpath($dest_dir, $base);
            if (!-e $dest_file) {
                copy($file, $dest_file) or die "Failed to copy $file to $dest_file: $!";
            }
            print "Copied $file to $dest_file\n";
        }
        return;
        }, $dir);
}

