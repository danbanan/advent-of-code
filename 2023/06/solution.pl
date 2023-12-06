use v5.16;

use warnings;
use strict;

use Data::Dumper;
use List::Util qw/zip product/;

my (@times) = <> =~ m/(\d+)/g;
my (@records) = <> =~ m/(\d+)/g;

my @ways = map { ways_to_beat_record(@{$_}) } zip \@times, \@records;

say product @ways;
say ways_to_beat_record(join('', @times), join('',@records));

sub ways_to_beat_record {
    my ($time, $record) = @_;

    my $n_ways;

    for my $i (0..$time) {
	++$n_ways if ($time - $i) * $i > $record;
    }

    return $n_ways;
}
