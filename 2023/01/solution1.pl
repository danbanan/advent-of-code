use v5.16;

use warnings;
use strict;

use List::Util qw/sum/;
use Data::Dumper;

my @calibration_values;

while (<>) {
    my (@line_numbers) = m/(\d)/g;
    push @calibration_values, $line_numbers[0] . $line_numbers[-1];
}

say sum(@calibration_values);
