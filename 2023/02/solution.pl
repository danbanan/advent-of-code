use v5.16;

use strict;
use warnings;

use Data::Dumper;
use List::Util qw/first/;

sub part1 {
  my %color_limit = (red => 12, green => 13, blue => 14);

  my $sum;
  
  while (<>) {
    my (@pairs) = m/(\w+ \d+)|(\d+ \w+)/g;

    my ($game_id) = $pairs[0] =~ m/(\d+)/;
    my @color_pairs = map { [ split ' ', $_ ] } grep { defined $_ } @pairs[1..$#pairs];

    print Dumper \@color_pairs;

    my $match = first { $_->[0] > $color_limit{$_->[1]} } @color_pairs;

    $sum += $game_id if not defined $match;
  }

  return $sum;
}

say part1();


