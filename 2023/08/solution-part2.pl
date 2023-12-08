use v5.16;
use warnings;
use strict;

use Data::Dumper;
use List::Util qw/all/;

my $instruction_str = '';

while(my $line = <>) {
    chomp $line;
    last if $line eq "";
    $instruction_str = $instruction_str . $line;
};

my @instructions = split '', $instruction_str;

my %graph;

while (<>) {
    my ($node, $left, $right) = m/(\S+) = \((\S+), (\S+)\)/;
    $graph{$node} = { L => $left, 'R' => $right };
}

my @sources = grep { $_ =~ m/A$/ } keys %graph;

my $i;

my $matches = 0;

my $sources_len = scalar @sources;
my $instr_len = scalar @instructions;

for ($i = 0; $matches != $sources_len; ++$i) {
    $matches = 0;
    for my $src (@sources) {
	$src = $graph{$src}->{$instructions[$i % $instr_len]};
	$matches += $src =~ m/Z$/;
    }
}

say $i;
