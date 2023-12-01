use v5.16;

use warnings;
use strict;

use List::Util qw/sum/;
use Scalar::Util q/reftype/;
use Data::Dumper;

my @calibration_values;

my %number_mapping = (
		      one => 1,
		      two => 2,
		      three => 3,
		      four => 4,
		      five => 5,
		      six => 6,
		      seven => 7,
		      eight => 8,
		      nine => 9,
		     );

$number_mapping{$_} = $_ for (1..9);

while (<>) {
  my (@line_numbers) =
    m/(?=(one|two|three|four|five|six|seven|eight|nine|\d))/g;

    my $x = $number_mapping{$line_numbers[0]};
    my $y = $number_mapping{$line_numbers[-1]};

    push @calibration_values, $x . $y;
}

say sum(@calibration_values);
