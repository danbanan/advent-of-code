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
    # twone => [2, 1],
    # sevenine => [7, 9],
    # eightwo => [8, 2],
    # eightwone => [8, 2, 1],
    # eighthree => [8, 3],
    # nineight => [9, 8],
    # oneight => [1, 8]
);

$number_mapping{$_} = $_ for (1..9);

while (<>) {
    my (@line_numbers) =
	m/(?=)(\d|one|two|three|four|five|six|seven|eight|nine)/g;

    print Dumper \@line_numbers;
    
    # my $x = $number_mapping{$line_numbers[0]};
    # my $y = $number_mapping{$line_numbers[-1]};

    # $x = (ref $x eq 'ARRAY') ? $x->[0] : $x;
    # $y = (ref $y eq 'ARRAY') ? $y->[-1] : $y;

    # push @calibration_values, $x . $y;
}

say sum(@calibration_values);

# too low 55680
# too high 55869
