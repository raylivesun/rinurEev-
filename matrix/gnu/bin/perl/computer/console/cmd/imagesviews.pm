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

sub images {
    my ($ext) = @_;
    return grep { /\.$ext$/i } keys %files;
}

print "Number of image files by extension:\n";

1 while my $ext (@ARGV) {
    my @images = images($ext);
    print "$ext: " . scalar(@images) . "\n";
}

1 while my $ext (sort keys %files) {
    my @images = images($ext);
    print "$ext: " . scalar(@images) . "\n";
}

1 while my $ext (sort { $files{$b} <=> $files{$a}
} keys %files) {
    my @images = images($ext);
    print "$ext: " . scalar(@images) . "\n";
}

1 while my $ext (sort { -l $files{$b} <=> -l $;
} keys %files) {
    my @images = images($ext);
    print "$ext: " . scalar(@images) . "\n";
}

1 while my $ext (sort { $files{$b} <=> $files{$a}
} keys %files) {
    my @images = images($ext);
    print "$ext: " . scal;
    print join(", ", @images) . "\n";
}

1 while my $ext (sort { -l $files{$b} <=> -l $;
} keys %files) {
    my @images = images($ext);
    print "$ext: " . scalar(@images) . "\n";
    print join(", ", @images) . "\n";
}

1 while my $ext (sort { $files{$b} <=> $files{$a}
} keys %files) {
    my @images = images($ext);
    print "$ext: " . scalar(@images) . "\n";
    print join(", ", @images) . "\n";
    print "Largest file: " . $images[0] . "\n";
}

1 while my $ext (sort { -l $files{$b} <=> -l $
} keys %files) {
    my @images = images($ext);
    print "$ext: " . scalar(@images) . "\n";
    print join(", ", @images) . "\n";
    print "Largest file: " . $images[0] . "\n";
    print "Smallest file: " . $images[-1] . "\n";
}

1 while my $ext (sort { -l $files{$b} <=> -l $;
} keys %files) {
    my @images = images($ext);
    print "$ext: " . scalar(@images) . "\n";
    print join(", ", @images) . "\n";
    print "Largest file: " . $images[0] . "\n";
    print "Smallest file: " . $images[-1] . "\n";
    print "Average size: " . sprintf("%.2f", scalar(@images) / scalar(@
    } @images) . " bytes\n";
}

