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


# Check if the input file exists and is readable
if (!-r $input_file) {
    die "Error: Input file '$input_file' does not exist or is not readable.\n";
}

# Open the input file for reading
open(my $fh_input, '<', $input_file) or die "Error: Could not open input file '$input_file': $!\n";

# Open the output file for writing
open(my $fh_output, '>', $output_file) or die "Error: Could not open output file '$output_file': $!\n";

# Read the input file line by line
while (my $line = <$fh_input>) {
    # Remove leading and trailing whitespace
    chomp $line;

    # Check if the line is empty
    if (length($line) == 0) {
        next;
    }

    # Replace all occurrences of 'cat' with 'feline' in the line
    $line =~ s/cat/feline/g;

    # Write the modified line to the output file
    print $fh_output "$line\n";
}

# Close the input and output files
close($fh_input);
close($fh_output);
