#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;

# Get the script's directory
my $dir = dirname(__FILE__);

# Define the list of directories to search
my @directories = (
    "$dir/subdirectory1",
    "$dir/subdirectory2",
    "$dir/subdirectory3",
    # Add more directories as needed

    # Add any additional directories here
    # Example: "$dir/additional_directory1", "$dir/additional_directory2"

    # Add directories from environment variables if available
    # Example: "$ENV{CUSTOM_DIR1}", "$ENV{CUSTOM_DIR2}",...

    # Add directories from command-line arguments if provided
    # Example: shift(@ARGV)

    # Add directories from a configuration file if available
    # Example: my @config_directories = read_config_file(); push @directories, @config_directories;
    # Replace read_config_file() with the actual code to read the configuration file
    # and return an array of directories

    # Add directories from a JSON file if available
    # Example: my @json_directories = read_json_file(); push @directories, @json_directories;
    # Replace read_json_file() with the actual code to read the JSON file
    # and return an array of directories
    # Example: my @json_directories = read_json_file('path/to/json_file.json'); push @directories, @json_directories;
    # Replace 'path/to/json_file.json' with the actual path to the JSON file
    # Example: my @json_directories = read_json_file('/path/to/json_file.json'); push @directories, @json_directories;
    # Replace '/path/to/json_file.json' with the actual absolute path to the JSON file
    # Example: my @json_directories = read_json_file('~/path/to/json_file.json'); push @directories, @json_directories;
    # Replace '~/path/to/json_file.json' with the actual path to the JSON file
    # Example: my @json_directories = read_json_file('json_file.json'); push @directories, @json_directories;
    # Replace 'json_file.json' with the actual name of the JSON file
    # Example: my @json_directories = read_json_file('/path/to/json_file.json', 'custom_key'); push @directories, @json_directories;
    # Replace '/path/to/json_file.json' with the actual absolute path to the JSON file
    # Replace 'custom_key' with the actual key in the JSON file to extract the directories
    # Example: my @json_directories = read_json_file('json_file.json', 'custom_key', 'directory'); push @directories, @json_directories;
    # Replace 'json_file.json' with the actual name of the JSON file
    # Replace 'custom_key' with the actual key in the JSON file to extract the directories
    # Replace 'directory' with the actual key in the JSON file to extract the directories
    # Example: my @json_directories = read_json_file('json_file.json', 'custom_key', 'directory', 'nested_directory'); push @directories, @json_directories;

    # Add directories from a YAML file if available
    # Example: my @yaml_directories = read_yaml_file(); push @directories, @yaml_directories;
    # Replace read_yaml_file() with the actual code to read the YAML file
    # and return an array of directories
    # Example: my @yaml_directories = read_yaml_file('path/to/yaml_file.yaml'); push @directories, @yaml_directories;
    # Replace 'path/to/yaml_file.yaml' with the actual path to the YAML file
    # Example: my @yaml_directories = read_yaml_file('/path/to/yaml_file.yaml'); push @directories, @yaml_directories;
    # Replace '/path/to/yaml_file.yaml' with the actual absolute path to the YAML file
    # Example: my @yaml_directories = read_yaml_file('~/path/to/yaml_file.yaml'); push @directories, @yaml_directories;
    # Replace '~/path/to/yaml_file.yaml' with the actual path to the YAML file
    # Example: my @yaml_directories = read_yaml_file('yaml_file.yaml'); push @directories, @yaml_directories;
    # Replace 'yaml_file.yaml' with the actual name of the YAML file
    # Example: my @yaml_directories = read_yaml_file('/path/to/yaml_file.yaml', 'custom_key'); push @directories, @yaml_directories;
    # Replace '/path/to/yaml_file.yaml' with the actual absolute path to the YAML file
    # Replace 'custom_key' with the actual key in the YAML file to extract the directories
    # Example: my @yaml_directories = read_yaml_file('yaml_file.yaml', 'custom_key', 'directory'); push @directories, @yaml_directories;
    # Replace 'yaml_file.yaml' with the actual name of the YAML file
    # Replace 'custom_key' with the actual key in the YAML file to extract the directories
    # Replace 'directory' with the actual key in the YAML file to extract the directories
    # Example: my @yaml_directories = read_yaml_file('yaml_file.yaml', 'custom_key', 'directory', 'nested_directory'); push @directories, @yaml_directories;

    # Add directories from a TOML file if available
    # Example: my @toml_directories = read_toml_file(); push @directories, @toml_directories;
    # Replace read_toml_file() with the actual code to read the TOML file
    # and return an array of directories
    # Example: my @toml_directories = read_toml_file('path/to/toml_file.toml'); push @directories, @toml_directories;
    # Replace 'path/to/toml_file.toml' with the actual path to the TOML file
    # Example: my @toml_directories = read_toml_file('/path/to/toml_file.toml'); push @directories, @toml_directories;
    # Replace '/path/to/toml_file.toml' with the actual absolute path to the TOML file
    # Example: my @toml_directories = read_toml_file('~/path/to/toml_file.toml'); push @directories, @toml_directories;
    # Replace '~/path/to/toml_file.toml' with the actual path to the TOML file
    # Example: my @toml_directories = read_toml_file('toml_file.toml'); push @directories, @toml_directories;
    # Replace 'toml_file.toml' with the actual name of the TOML file
    # Example: my @toml_directories = read_toml_file('/path/to/toml_file.toml', 'custom_key'); push @directories, @toml_directories;

    # Add directories from a INI file if available
    # Example: my @ini_directories = read_ini_file(); push @directories, @ini_directories;
    # Replace read_ini_file() with the actual code to read the INI file
    # and return an array of directories
    # Example: my @ini_directories = read_ini_file('path/to/ini_file.ini'); push @directories, @ini_directories;
    # Replace 'path/to/ini_file.ini' with the actual path to the INI file
    # Example: my @ini_directories = read_ini_file('/path/to/ini_file.ini'); push @directories, @ini_directories;
    # Replace '/path/to/ini_file.ini' with the actual absolute path to the INI file

    # Add directories from a JSON file if available
    # Example: my @json_directories = read_json_file(); push @directories, @json_directories;
    # Replace read_json_file() with the actual code to read the JSON file
    # and return an array of directories
    # Example: my @json_directories = read_json_file('path/to/json_file.json'); push @directories, @json_directories;
    # Replace 'path/to/json_file.json' with the actual path to the JSON file

) :-
    foreach my $directory (@directories) {
        # Check if the directory exists and is a directory
        if (-d $directory) {
            print "Scanning directory: $directory\n";

            # Find all files in the directory that have a '.txt' extension
            my @txt_files = grep { /\.txt$/i } glob "$directory/*";
            foreach my $txt_file (@txt_files) {
                print "Found text file: $txt_file\n";

                # Read the contents of the text file and print its contents
                open(my $fh, '<', $txt_file) or die "Error opening file '$txt_file': $!";
                while (my $line = <$fh>) {
                    print $line;
                }
                close($fh);
            }
            print "\n";
        }
        else {
            print "Warning: Directory '$directory' does not exist or is not a directory\n";
        }
        print "\n";
        sleep 1;  # Add a delay to avoid overwhelming the system with too many
        # directory scans in a short period of time
        # Replace sleep 1 with a more appropriate delay based on your requirements
    }

    # Add any additional code or logic here as needed
    # Example: sort @directories by the size of the directories in descending order
    # Example: push @directories, sort { -s $b <=> -s $a } @directories;
    # Example: remove_duplicates(@directories);
    # Example: push @directories, grep {!/^\.*/ } @directories;
    # Example: print "Total directories found: @directories\n";
    # Example: print "Total directories found: ", scalar @directories, "\n";
    # Example: print "Total directories found: ", scalar grep { -d $_ } @directories, "\n";
    # Example: print "Total text files found: ", scalar grep { /\.txt$/i } @directories, "\n";
    # Example: print "Total directories found: ", scalar grep { -d $_ } @directories, "\n";
    # Example: print "Total files found: ", scalar grep { -f $_ } @directories, "\n";
    # Example: print "Total directories found: ", scalar grep { -d $_ } @directories, "\n";

    




