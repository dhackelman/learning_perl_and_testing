#!/usr/bin/perl

use strict;
use Data::Dumper;

package perldcs_tut;

my @AoA = (); #initialize empty array

sub md_array {
  for my $x (0..5) { #dynamically introduce values into empty array
  for my $y (0..5) {
      $AoA[$x][$y] = $x + $y;
    }
  }
  my $arrayLocation = $AoA[0][5];
  return $arrayLocation;
}
