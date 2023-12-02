use v5.16;

use strict;
use warnings;

use List::Util qw/first product/;

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

sub part2 {
  my %color_limit = (red => 12, green => 13, blue => 14);

  my $sum;

  while (<>) {
    my ($games_str) = m/\w+ \d+: (.*)/g;

    my @game = map { [ split ', ', $_ ] } split ';', $games_str;

    my %max_count = (red => 0, green => 0, blue => 0);

    for my $round (@game) {
      my @pairs = map { [ split ' ', $_ ] } @{$round};
      for my $pair (@pairs) {
        my ($count, $color) = @$pair;
        $max_count{$color} = $count if $count > $max_count{$color};
      }
    }
    $sum += product values %max_count;
  }

  return $sum;
}

say part1();
say part2();
