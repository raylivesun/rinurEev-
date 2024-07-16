#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;
use File::Find;

my $dir = shift || '.';
my $ext = '.txt';

find(sub {
    my $file = $File::Find::name;
    my $base = basename $file;
    return if $base =~ /^\./;  # Skip hidden files
    return unless $base =~ /\.$ext$/;  # Only consider files with the given extension
    print "$file\n";
    }, $dir);

sub radios_stream_operations {
    my ($file, $operation) = @_;

    my $fh = open(my $mode, '<', $file) or die "Couldn't open file '$file': $!";
    my $output_file = "$file.output";
    open(my $output_fh, '>', $output_file) or die "Couldn't open
    output file '$output_file': $!";
    my $total_duration = 0;
    my $total_size = 0;
    my $total_streams = 0;
    my $max_stream_duration = 0;
    my $max_stream_size = 0;
    my $max_stream_id = 0;
    my $min_stream_duration = 99999999999
    my $min_stream_size = 99999999999
    my $min_stream_id = 0;
    my $average_duration;
    my $average_size;
    my $average_streams;

    while (my $line = <$fh>) {
        chomp $line;
        my @fields = split(/\s+/, $line);
        my $stream_id = $fields[0];
        my $stream_duration = $fields[1];
        my $stream_size = $fields[2];
        my $stream_bitrate = $fields[3];
        my $stream_codec = $fields[4];
        my $stream_profile = $fields[5];
        my $stream_level = $fields[6];
        my $stream_width = $fields[7];
        my $stream_height = $fields[8];
        my $stream_fps = $fields[9];
        my $stream_sar = $fields[10];
        my $stream_audio_codec = $fields[11];
        my $stream_audio_channels = $fields[12];
        my $stream_audio_sample_rate = $fields[13];
        my $stream_audio_bitrate = $fields[14];
        my $stream_subtitles_codec = $fields[15];
        my $stream_subtitles_language = $fields[16];
        my $stream_subtitles_format = $fields[17];
        my $stream_subtitles_default = $fields[18];
        my $stream_subtitles_forced = $fields[19];
        my $stream_subtitles_filename = $fields[20];
        my $stream_subtitles_forced_filename = $fields[21];
        my $stream_subtitles_stream_id = $fields[22];
        my $stream_subtitles_stream_index = $fields[23];
        my $stream_subtitles_stream_codec = $fields[24];
        my $stream_subtitles_stream_language = $fields[25];
        my $stream_subtitles_stream_format = $fields[26];
        my $stream_subtitles_stream_default = $fields[27];
        my $stream_subtitles_stream_forced = $fields[28];
        my $stream_subtitles_stream_filename = $fields[29];
        my $stream_subtitles_stream_forced_filename = $fields[30];
        my $stream_subtitles_stream_index = $fields[31];
        my $stream_subtitles_stream_codec = $fields[32];

        # Perform the specified operation on the stream data
        if ($operation eq 'count') {
            $total_streams++;
            $total_duration += $stream_duration;
            $total_size += $stream_size;
            if ($stream_duration > $max_stream_duration) {
                $max_stream_duration = $stream_duration;
                $max_stream_id = $stream_id;
            }
            if ($stream_duration < $min_stream_duration) {
                $min_stream_duration = $stream_duration;
                $min_stream_id = $stream_id;
            }
            if ($stream_size > $max_stream_size) {
                $max_stream_size = $stream_size;
                $max_stream_id = $stream_id;
            }
            if ($stream_size < $min_stream_size) {
                $min_stream_size = $stream_size;
                $min_stream_id = $stream_id;
            }

            print $output_fh "$stream_id $stream_duration $stream_size\n";

        }
        elsif ($operation eq 'average') {
            $total_streams++;
            $total_duration += $stream_duration;
            $total_size += $stream_size;
        }
        elsif ($operation eq 'total') {
            print $output_fh "Total streams: $total_streams\n";
            print $output_fh "Total duration: $total_duration seconds\n";
            print $output_fh "Total size: $total_size bytes\n";
        }
        elsif ($operation eq 'max') {
            print $output_fh "Max duration stream ID: $max_stream_id\n";
            print $output_fh "Max duration: $max_stream_duration seconds\n";
            print $output_fh "Max size stream ID: $max_stream_id\n";
            print $output_fh "Max size: $max_stream_size bytes\n";
            print $output_fh "Min duration stream ID: $min_stream_id\n";
            print $output_fh "Min duration: $min_stream_duration seconds\n";
            print $output_fh "Min size stream ID: $min_stream_id\n";
            print $output_fh "Min size: $min_stream_size bytes\n";
            print $output_fh "Average duration: $average_duration seconds\n";
            print $output_fh "Average size: $average_size bytes\n";
            print $output_fh "Average streams: $average_streams\n";
        }
        else {
            print "Invalid operation '$operation'\n";
            exit 1;
        }
        close $fh;
        close $output_fh;
    }
    if ($operation eq 'average') {
        $average_duration = int($total_duration / $total_streams);
        $average_size = int($total_size / $total_streams);
        print "Average duration: $average_duration seconds\n";
        print "Average size: $average_size bytes\n";
    }
    exit 0;
}


