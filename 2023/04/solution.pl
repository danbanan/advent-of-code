use v5.16;

use warnings;
use strict;

use List::MoreUtils qw/duplicates/;

my $sum;

while (<>) {
    my @numbers = m/(\d+)/g;
    my @winning_numbers = duplicates @numbers[1..$#numbers];
    $sum += 2**($#winning_numbers) if $#winning_numbers >= 0;
}

say $sum;

# push @numbers, $1 while m/((\d+\s+)+)/g; # collects two groups
