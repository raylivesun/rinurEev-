#!/usr/bin/perl -w 

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin";

use Text::CSV;

my $csv = Text::CSV->new({ binary => 1 });

# Read input CSV file
open(my $fh, '<', 'input.csv') or die "Could not open input file: $!";
my @rows = $csv->read($fh);
close $fh;


# Create a hash to store the frequency of each character in each row
my %char_freq;

foreach my $row (@rows) {
    my $char_count = scalar @$row;

    foreach my $char (@$row) {
        $char_freq{$char}{$row}++;
    }
}


# Create a new CSV file to store the frequency of each character in each row
open(my $fh, '>', 'output.csv') or die "Could not open output file: $!";
my $csv_output = Text::CSV->new({ binary => 1, write_header => [qw(Character Row Frequency)] });

foreach my $char (sort keys %char_freq) {
    foreach my $row (sort keys %{$char_freq{$char}}) {
        $csv_output->writerow([ $char, $row, $char_freq{$char}{$row} ]);
    }
}

close $fh;

print "Frequency of characters in each row saved to output.csv\n";
