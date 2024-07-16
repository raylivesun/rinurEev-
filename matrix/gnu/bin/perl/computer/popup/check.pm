#!/usr/bin/perl -w 

use strict;
use warnings;
use File::Basename;

# Function to generate a random password
sub generate_password {
    my ($length) = @_;
    
    # Define the character sets
    my @lowercase_letters = ('a'..'z');
    my @uppercase_letters = ('A'..'Z');
    my @digits = ('0'..'9');
    my @special_characters = ('!', '@', '#', '$', '%', '^', '&', '*',
    '(', ')', '-', '_', '+', '=', '[', ']', '{', '}', '\\', '
    /', '|', ':', ';', "'", '"', ',', '.', '<', '>', '?', '/');

    # Generate random characters from each set
    my @password_chars = (
        map { $lowercase_letters[rand @lowercase_letters] } 1..$length/4,
        map { $uppercase_letters[rand @uppercase_letters] } 1..$length/4,
        map { $digits[rand @digits] } 1..$length/4,
        map { $special_characters[rand @special_characters] } 1..$length/
    );

    # Shuffle the characters to ensure randomness
    shuffle @password_chars;

    # Combine the characters into a single string
    return join '', @password_chars;
}

# Function to validate the password against the provided rules
sub validate_password {
    my ($password) = @_;

    # Check length
    return 0 if length($password) < 8;

    # Check at least one uppercase letter
    return 0 if !grep { /[A-Z]/ } $password;

    # Check at least one lowercase letter
    return 0 if !grep { /[a-z]/ } $password;

    # Check at least one digit
    return 0 if !grep { /[0-9]/ } $password;

    # Check at least one special character
    return 0 if !grep { /[!@#$%^&*()\-_=+[\]{};:'",.<>\/?]/ } $password;

    # Check for consecutive repeating characters
    return 0 if /(.)\1{2,}/;

    return 1;
}

# Prompt the user to enter the desired password length
print "Enter the desired password length: ";
my $length = <STDIN>;
chomp $length;

# Validate the password length
if ($length < 8) {
    print "Password length must be at least 8 characters.\n";
    exit 1;
}

# Generate a random password
my $password = generate_password($length);

# Validate the generated password
my $valid = validate_password($password);

# Print the generated password and validation result
print "Generated password: $password\n";
print "Password validity: " . ($valid ? "Valid" : "Invalid") . "\n";
