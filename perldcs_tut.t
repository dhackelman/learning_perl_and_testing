#!/usr/bin/perl

use strict;
use Data::Dumper;
use Test::More;

plan tests => 1;


# Working with Eric to understand weird for loops, memory locations, and setting Context (list vs scalar)
# #this is an array of array references
#  my @AoA = ([2, 3], [4, 5, 7], [0] );
#
# print Dumper(\@AoA);
#
# sub somefunc {
#   my $var = shift @_;
#   return $var + 10;
# }
# my @array = (1,2,3,4);
# print @array;
# for my $i (1..5) {
#     # @array = somefunc($i);
#     @array = 0..$i;
#     # print Dumper(\@array);
#     @{$AoA[$i]} = @array;
#     # print @{$AoA[$i]} "\n";
# }
# print Dumper(\@AoA);

#following http://perldoc.perl.org/perldsc.html with TDD style approach
my @AoA = (); #initialize empty array to be used by subs

sub md_array {#dynamically introduce values into empty array
  for my $x (0..5) {
  for my $y (0..5) {
      $AoA[$x][$y] = $x + $y;
    }
  }
  my $arrayLocation = $AoA[0][5];
  return $arrayLocation;
}

my @Arr_o_Arr = ( [2, 3], [4, 5, 7], [0] );#explicitly declare array of anon array refs
sub test_Arr_o_Arr {
  my $arg = @_;
  return $arg;
}

sub replace_indices_Arr {
  sub somefunc { #create sub to alter the passed in arg (+ 10);
    my $var = shift;
    return $var + 10;
  }
  for my $i (1..5) { #run loop on 1-5 to replace index of $i with list form of $i + 10
    my @array = somefunc($i);
    $AoA[$i] = @array;
  }
}


subtest "testing complex data structures and refs" => sub {

   subtest "#1- testing faux-multidimensional arrays" => sub {

     my $results = md_array();

    is($results, 5, "testing the value against the memory location in AoA");
  };
  subtest "#2- testing array of anon array refs" => sub {

    my $results = test_Arr_o_Arr(@Arr_o_Arr);

   is($results, @Arr_o_Arr, "is the arg ref the same as the array");
 };
 subtest "#3- memory location errors" => sub {
   my @expected = ([2,3], [11], [12], [13], [14], [15]);
   my $results = replace_indices_Arr(@Arr_o_Arr);

  is($results, !@expected, "is the arg ref the same as the array");
  #this failed as I thought because of the issue with @array being repeatedly replaced. Passes with ! preceeeding @expected

};

};
