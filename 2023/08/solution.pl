use v5.16;
use warnings;
use strict;

use Data::Dumper;

my $instruction_str = '';

while(my $line = <>) {
    chomp $line;
    last if $line eq "";
    $instruction_str = $instruction_str . $line;
};

my @instructions = split '', $instruction_str;

my %graph;

while (<>) {
    my ($node, $left, $right) = m/(\w+) = \((\w+), (\w+)\)/;
    $graph{$node} = { L => $left, 'R' => $right };
}

my $src = 'AAA';
my $dst = 'ZZZ';

my $i;

for ($i = 0; $src ne $dst; ++$i) {
    $src = $graph{$src}->{$instructions[$i % scalar @instructions]};
}

say $i;
