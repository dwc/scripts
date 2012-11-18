#!/usr/bin/perl

##
## Organize the current directory by number.  The files in the current directory
## are numbered from 0*1 to 0*n, where the number of 0s depends on the number of
## files.  File extensions are preserved, if possible.  Optionally, you can
## specify a starting number for the files.
##
## Author: Daniel Westermann-Clark
## Version: $Id: organize_by_number.pl,v 1.2 2006/10/07 18:51:19 dwc Exp $
##

use strict;
use warnings;


##
## Main script
##

main();
sub main {
    my $start = 1;
    if (@ARGV and $ARGV[0]) {
        $start = $ARGV[0];
    }
    my $userPadding = 0;
    if (@ARGV and $ARGV[1]) {
        $userPadding = $ARGV[1];
    }

    opendir(DIR, '.') or die "Can't open current directory: $!";
    my @files = grep { !/^\.+/ } readdir(DIR);
    closedir DIR;

    my $counter = $start;
    my $end = scalar(@files) + $start - 1;
    print "start = $start, end = $end\n";
    foreach my $file (sort @files) {
        my $extension;
        if ($file =~ /\.((\w|\d)+)$/) {
            $extension = $1;
        }

        my $padding = ($userPadding ? $userPadding : (length($end) - length($counter)));
        my $newFilename = ('0' x $padding) . $counter;
        if ($extension) {
            $newFilename .=  ".$extension";
        }

        if (-e $newFilename) {
            warn "Destination file $newFilename exists; not renaming $file";
        }
        else {
            print "Renaming $file to $newFilename\n";
            rename $file, $newFilename;
        }

        $counter++;
    }
}
