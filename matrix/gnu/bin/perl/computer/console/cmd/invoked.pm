#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;

# Check if the correct number of command-line arguments are provided
if (@ARGV != 2) {
    die "Usage: $0 <input_file> <output_file>\n";
}

my $input_file = $ARGV[0];
my $output_file = $ARGV[1];

# Check if the input file exists
if (!-e $input_file) {
    die "Input file '$input_file' does not exist.\n";
}

# Get the base name of the input file without the extension
my $input_base = basename($input_file, '.txt');

# Open the input file for reading
open(my $input_fh, '<', $input_file) or die "Error opening input file '$input_file': $!";

# Open the output file for writing
open(my $output_fh, '>', $output_file) or die "Error opening output file '$output_file': $!";

# Read the input file line by line
while (my $line = <$input_fh>) {
    # Replace all occurrences of the word "apple" with "orange"
    $line =~ s/apple/orange/g;

    # Print the modified line to the output file
    print $output_fh $line;

    # Print a line number and the modified line to the terminal
    print STDERR "$input_base: $.\n$line";
}

# Close the input and output files
close($input_fh);
close($output_fh);
