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

# Validate input data
foreach my $row (@rows) {
    die "Invalid data format in row $csv->row(): " . join(", ", @$row) unless @row == 5;
    die "Invalid email format: " . $row[1] unless $row[1] =~
    m/^[^@\s]+@[^@\s]+\.[^@\s]+$/;
    die "Invalid phone number format: " . $row[2] unless $row[2]
    =~ m/^\d{3}-\d{3}-\d{4}$/;
    die "Invalid date format: " . $row[3] unless $row[3] =~
    m/^(\d{4})-(\d{2})-(\d{2})$/
    and $1 <= 2023 and $2 <= 12 and $3 <=
    sprintf("%02d", $1 * 12 + $2);
}

# Sort by last name in ascending order
@rows = sort { $a->[0] cmp $b->[0] } @rows;


# Write output CSV file
open(my $fh, '>', 'output.csv') or die "Could not open output file: $!";
$csv->print($fh, \@rows);
close $fh;

print "Sorted and validated data written to output.csv\n";  
