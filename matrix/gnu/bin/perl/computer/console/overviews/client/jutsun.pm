#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;

# Function to check if a file is a valid CSV
sub is_valid_csv {
    my ($file) = @_;

    open(my $fh, '<', $file) or die "Cannot open file '$file': $!";
    my @headers = <$fh>;
    close($fh);

    return scalar @headers == 2;
}

# Function to calculate the average of a column
sub calculate_average {
    my ($file, $column) = @_;

    open(my $fh, '<', $file) or die "Cannot open file '$file': $!";
    my @data = <$fh>;
    close($fh);

    my $sum = 0;
    my $count = 0;

    foreach my $row (@data) {
        next if $row =~ /^\s*#/;  # Skip comments
        next unless $row =~ /\S/;  # Skip empty lines

        my @values = split(',', $row);
        $sum += $values[$column - 1];
        $count++;
    }

    return $sum / $count;
}

# Get the command-line arguments
my $file = $ARGV[0];
my $column = $ARGV[1];

# Check if the file exists and is a valid CSV
if (!-f $file) {
    die "File '$file' does not exist.\n";
}

if (!is_valid_csv($file)) {
    die "File '$file' is not a valid CSV.\n";
}

# Calculate the average of the specified column
my $average = calculate_average($file, $column);

# Print the average
print "Average of column $column in '$file': $average\n";

