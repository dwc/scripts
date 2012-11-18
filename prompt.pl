#!/usr/bin/env perl

use strict;
use warnings;
use Term::ReadLine;


main(@ARGV);
sub main {
    my (@args) = @_;
    die usage() unless @args;

    my $term = Term::ReadLine->new('prompt');

    my $prompt = join(' ', @args) . '> ';
    my $out = $term->OUT || \*STDOUT;
    while (my $input = $term->readline($prompt)) {
        for ($input) {
            s/^\s+//;
            s/\s+$//;
        }

        system(@args, $input);
    }
    print "\n";
}

sub usage () {
    return qq[$0 COMMAND [ARGUMENTS]\n];
}
