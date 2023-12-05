use v5.16;

use warnings;
use strict;

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

    while (<>) {
	my @numbers = m/(\d+)/g;
	my $winning_numbers = scalar duplicates @numbers[1..$#numbers];
	$card_scores{$.} = [ (($. + 1)..($. + $winning_numbers)) ];
	push @copies, @{ $card_scores{$.} };
    }

    push @copies, @{ $card_scores{$_} } foreach (@copies);

    return scalar @copies + $.;
}

say part1();
say part2();
