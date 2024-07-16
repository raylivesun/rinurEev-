#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;
use File::Basename::Basename;
use File::Find;
use File::Copy;
use File::Path;

# Define the source directory and destination directory
my $source_dir = '/path/to/source/directory';
my $destination_dir = '/path/to/destination/directory';

# Create the destination directory if it doesn't exist
Path::mkpath($destination_dir) or die "Cannot create directory: $!";

# Function to process each file found
sub process_file {
    my $file = $File::Find::name;
    my $base_name = basename($file);
    my $base_dir = dirname($file);

    # Check if the file is a text file
    if (-f $file && -T $file) {
        # Get the file extension
        my $extension = File::Basename::extension($file);

        # Check if the file extension is not empty
        if ($extension ne '') {
            # Construct the new file name with the extension removed
            my $new_base_name = $base_name =~ s/\.[^.]+$//r;

            # Construct the new file path
            my $new_file = "$base_dir/$new_base_name$extension";

            # Copy the file to the destination directory
            copy($file, $new_file) or die "Cannot copy file: $!";
        }
        else {
            warn "Skipping non-text file: $file\n";
        }
    return $file;
    };
    # Recursively process subdirectories
    find(\&process_file, $file);
}
# Process all files in the source directory
find(\&process_file, $source_dir);

