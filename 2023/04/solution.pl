use v5.16;

use warnings;
use strict;

use Data::Dumper;
use List::MoreUtils qw/duplicates reduce_0/;

sub part1 {
    my $sum;

    while (<>) {
	my @numbers = m/(\d+)/g;
	my @winning_numbers = duplicates @numbers[1..$#numbers];
	$sum += 2**($#winning_numbers) if $#winning_numbers >= 0;
    }

    return $sum;
}

sub part2 {
    my %card_scores;
    my @copies;
    my @cards;

    while (<>) {
	my @numbers = m/(\d+)/g;
	my @winning_numbers = duplicates @numbers[1..$#numbers];
	$card_scores{$.} = scalar @winning_numbers;
	push @copies, (($. + 1)..($. + $card_scores{$.}));
    }

    print Dumper \%card_scores;

    return $. + scalar @copies + reduce_0 { $a + $card_scores{$b} } @copies;
}

say part2();
