#!/usr/bin/perl

use strict;
use Data::Dumper;
use Test::More;

#this is an array of array references
 my @AoA = ([2, 3], [4, 5, 7], [0] );

print Dumper(\@AoA);

sub somefunc {
  my $var = shift @_;
  return $var + 10;
}
my @array = (1,2,3,4);
print @array;
for my $i (1..5) {
    # @array = somefunc($i);
    @array = 0..$i;
    # print Dumper(\@array);
    @{$AoA[$i]} = @array;
    # print @{$AoA[$i]} "\n";
}
print Dumper(\@AoA);
