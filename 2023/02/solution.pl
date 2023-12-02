use v5.16;

use strict;
use warnings;

use Data::Dumper;
use List::Util qw/first/;

sub part1 {
  my %color_limit = (red => 12, green => 13, blue => 14);

  my $sum;
  my $game_id = 1;

  while (<>) {
    my (@pairs) = m/(\d+ \w+)/g;

    my @color_pairs = map { [ split ' ', $_ ] } grep { defined $_ } @pairs;

    my $match = first { $_->[0] > $color_limit{$_->[1]} } @color_pairs;

    $sum += $game_id if not defined $match;
    $game_id++;
  }

  return $sum;
}

say part1();


