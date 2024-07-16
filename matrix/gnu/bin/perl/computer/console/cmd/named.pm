#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;
use File::Basename::Basename;

# Get command line arguments
my $input_dir = $ARGV[0];
my $output_dir = $ARGV[1];

# Check if input and output directories exist
if (! -d $input_dir ||! -d $output_dir) {
    die "Error: Input and output directories must exist.\n";
}
# Iterate through all files in the input directory
opendir(my $dh, $input_dir) or die "Error opening input directory: $!";

foreach my $file (grep { /\.txt$/i } readdir($dh)) {
    # Get the file path and base name
    my $file_path = "$input_dir/$file";
    my $base_name = basename($file, '.txt');

    # Check if the file already exists in the output directory
    if (-e "$output_dir/$base_name.html") {
        warn "Warning: File '$file' already exists in the output directory.\n";
        next;
    }
    # Generate the HTML code
    my $html_code = "<html><head><title>$base_name</title></head><body><h1>$base_name</h1><p>This is a sample HTML page.</p></body></html>";
    # Write the HTML code to a new file in the output directory
    open(my $fh, '>', "$output_dir/$base_name.html") or die "Error opening output file: $!";
    print $fh $html_code;
    close $fh;
}
closedir($dh);


