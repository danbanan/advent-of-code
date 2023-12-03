use v5.16;

use warnings;
use strict;

use Data::Dumper;

my @schematic;

push @schematic, [ split '' ] while (<>);

my @part_numbers;

for (my $i=0; $i < scalar @schematic; ++$i) {
  my $num = '';
  my $is_part_number = 0;
  for (my $j=0; $j < scalar @{$schematic[$i]}; ++$j ) {
    my $char = $schematic[$i]->[$j];
    if ($char =~ m/\d/) {
      $num = $num . $char;
      $is_part_number = 1 if adjacent_symbol($j, $i);
    } else {
      if ($is_part_number and $num ne '') {
	push @part_numbers, $num;
      } else {
	$num = '';
	$is_part_number = 0;
      }
    }
  }
}

print Dumper \@part_numbers;

sub adjacent_symbol {
  my ($x, $y) = @_;

  my @x_adjacent = grep { $_ > 0 and $_ < scalar @{$schematic[0]} } ($x-1, $x, $x+1);
  my @y_adjacent = grep { $_ > 0 and $_ < scalar @schematic } ($y-1, $y, $y+1);

  for my $i (@y_adjacent) {
    for my $j (@x_adjacent) {
      return 1 if not $schematic[$i]->[$j] =~ m/\.|\d/;
    }
  }

  return 0;
}
