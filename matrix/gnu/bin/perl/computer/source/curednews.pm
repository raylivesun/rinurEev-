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

sub read_file_manager {
    my ($file, $block_size) = @_;

    open(my $fh, '<', $file) or die "Error opening $file: $!";
    my $block_count = 0;

    while (my $block = <$fh>($block_size)) {
        print "Block $block_count:\n";
        print $block;
        $block_count++;
    }
    close($fh);
}

if (@ARGV == 1) {
    if (-d $ARGV[0]) {
        read_file_manager($ARGV[0], 1024);
        exit 0;
    }
    print "Error: $ARGV[0] is not a directory.\n";
}

sub read_file_preview {
    my ($file, $preview_size) = @_;

    open(my $fh, '<', $file) or die "Error opening $file: $!";
    my $preview = <$fh>($preview_size);
    print "Preview:\n";
    print $preview;
    close($fh);
}

if (@ARGV == 2) {
    if (-f $ARGV[0]) {
        read_file_preview($ARGV[0], 1024);
        exit 0;
    }
    print "Error: $ARGV[0] is not a file.\n";
}

sub read_file_location {
    my ($file) = @_;

    if (-f $file) {
        my $location = `locate -i $file`;
        print "Location: $location\n";
    } else {
        print "Error: $file does not exist.\n";
    }
}

if (@ARGV == 1) {
    read_file_location($ARGV[0]);
}

sub read_file_flags_location {
    my ($file) = @_;

    if (-f $file) {
        my $flags = `stat -c "%a %n" $file`;
        print "Flags and location: $flags\n";
    } else {
        print "Error: $file does not exist.\n";
    }
}

if (@ARGV == 1) {
    read_file_flags_location($ARGV[0]);
}

sub read_file_flags_path {
    my ($file) = @_;

    if (-f $file) {
        my $flags = `stat -c "%A %n" $file`;
        print "Flags and path: $flags\n";
    } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_path($ARGV[0]);
}

sub read_file_flags_prefix {
    my ($file) = @_;

    if (-f $file) {
        my $flags = `stat -c "%a %n" $file`;
        print "Flags and prefix: $flags\n";
    } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}


if (@ARGV == 1) {
    read_file_flags_prefix($ARGV[0]);
}


sub read_file_flags_suffix {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%a %n" $file`;
        print "Flags and suffix: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_suffix($ARGV[0]);
}

sub read_file_flags_inode {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%i %n" $file`;
        print "Flags and inode: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_inode($ARGV[0]);
}


sub read_file_flags_device {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%D %n" $file`;
        print "Flags and device: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_device($ARGV[0]);
}

sub read_file_flags_group {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%G %n" $file`;
        print "Flags and group: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_group($ARGV[0]);
}

sub read_file_flags_user {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%U %n" $file`;
        print "Flags and user: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_user($ARGV[0]);
}


sub read_file_flags_birth {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%b %n" $file`;
        print "Flags and birth: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_birth($ARGV[0]);
}

sub read_file_flags_mtime {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%m %n" $file`;
        print "Flags and mtime: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_mtime($ARGV[0]);
}

sub read_file_flags_ctime {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%c %n" $file`;
        print "Flags and ctime: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_ctime($ARGV[0]);
}

sub read_file_flags_atime {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%A %n" $file`;
        print "Flags and atime: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_atime($ARGV[0]);
}


sub read_file_flags_birthtime {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%B %n" $file`;
        print "Flags and birthtime: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_birthtime($ARGV[0]);
}

sub read_file_flags_rdev {
    my ($file) = @_;
    if (-f $file) {
        my $flags = `stat -c "%r %n" $file`;
        print "Flags and rdev: $flags\n";
        exit 0;
        } else {
        print "Error: $file does not exist.\n";
    }
    exit 0;
}

if (@ARGV == 1) {
    read_file_flags_rdev($ARGV[0]);
}


