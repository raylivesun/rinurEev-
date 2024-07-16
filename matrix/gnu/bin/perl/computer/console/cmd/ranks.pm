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

sub ranks_file {
    my ($file) = @_;
    my $ext = (basename $file, '.');
    return $files{$ext} if exists $files{$ext};
    return 0;
}

find(sub {
    my $file = $File::Find::name;
    print "Rank: $files{$ext}\n";
    print "Path: $file\n";
    return;
    }, $dir, sub { ranks_file($File::Find::name) >= 2 });

sub ranks_command {
    my ($file) = @_;
    my $ext = (basename $file, '.');
    return $files{$ext} if exists $files{$ext};
    return 0;
}

print "Ranked files by extension:\n";
find(sub {
    my $file = $File::Find::name;
    print "Rank: $files{$ext}\n";
    print "Path: $file\n";
    return;
    }, $dir, sub { ranks_command($File::Find::name) >= 2 });

sub ranks_local {
    my ($file) = @_;
    my $ext = (basename $file, '.');
    return $files{$ext} if exists $files{$ext};
    return 0;
}

print "Ranked files by extension (local):\n";
find(sub {
    my $file = $File::Find::name;
    print "Rank: $files{$ext}\n";
    print "Path: $file\n";
    return;
    }, $dir, sub { ranks_local($File::Find::name) >= 2 });

sub ranks_types {
    my ($file) = @_;
    my $ext = (basename $file, '.');
    return $files{$ext} if exists $files{$ext};
    return 0;
}

print "Ranked files by extension (types):\n";
find(sub {
    my $file = $File::Find::name;
    print "Rank: $files{$ext}\n";
    print "Path: $file\n";
    return;
    }, $dir, sub { ranks_types($File::Find::name) >= 2 });

sub ranks_preview {
    my ($file) = @_;
    my $ext = (basename $file, '.');
    return $files{$ext} if exists $files{$ext};
    return 0;
    print "Rank: $files{$ext}\n";
    print "Path: $file\n";
    return;
}


find(sub {
    my $file = $File::Find::name;
    print "Rank: $files{$ext}\n";
    print "Path: $file\n";
    return;
    }, $dir, sub { ranks_preview($File::Find::name) >= 2 });


sub ranks_file_rounds {
    my ($file) = @_;
    my $ext = (basename $file, '.');
    return $files{$ext} if exists $files{$ext};
    return 0;
    print "Rank: $files{$ext}\n";
    print "Path: $file\n";
    return;
}

find(sub {
    my $file = $File::Find::name;
    print "Rank: $files{$ext}\n";
    print "Path: $file\n";
    return;
    }, $dir, sub { ranks_file_rounds($File::Find::name) >=
    (scalar grep { -f $_ } @ARGV) });
