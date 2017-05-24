#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::Deep;

use PerlRefTut qw($module->check);

#input variables directly to avoid having to "slurp" info in from external failed--compilation
my $x = "string";
my @y = ("string", "string", "string");
my @u= ("string", "string", "string");
my %z = (
  "string"=>"strung",
  "sting"=>"stung",
  "sing"=>"sung",
  "four"=>4,
  "ten" => 10
);
my %w = (
  "input"=> 2,
  "expected"=> 16,
);

my @p = (
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
);

my @v = ("string", \%w, 'here');
my $nested_ref = \@p;
my $scalar_ref = \$x;
my $array_ref = \@y;
my $array_ref2 = \@u;
my $hash_ref = \%z;

plan tests => 16;


my $module = $ENV ? 'Example' : 'PerlRefTut';
#TEST #1
ok -e "${module}.pm", "Missing $module.pm" or BAIL_OUT "You need to create a class called $module.pm";
#
#FAILED TEST FEEDBACK:
#05/04/2017  09:52 AM    <DIR>          sqldeveloper-4.2.0.17.089.1709-x64
# C:\Users\dh694n\Downloads\perlreftut>perl ref_test.t
# Can't locate PerlRefTut.pm in @INC
# BEGIN failed--compilation aborted at ref_test.t line 7.
#
#PASSING TEST FEEDBACK NOW THAT PerlRefTut Exists:
#
# C:\Users\dh694n\Downloads\perlreftut>perl ref_test.t
# 1..1
# ok 1 - Missing PerlRefTut.pm
#
#TEST #2
use_ok($module)
    or BAIL_OUT "Does $module.pm compile? Does it end with 1;?";
#
#PASSING TEST FEEDBACK
# C:\Users\dh694n\Downloads\perlreftut>perl ref_test.t
# 1..2
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
#
#TEST #3- is $x a data type of scalar
is( $module->check(), 'true', 'checkScalar');
#
# #FAILED TEST FEEDBACK:
# 1..3
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# not ok 3 - checkScalar
# #   Failed test 'checkScalar'
# #   at ref_test.t line 39.
# #          got: ''
# #     expected: 'true'
# # Looks like you failed 1 test of 3.
#
#PASSING TEST FEEDBACK
# 1..3
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
#
#TEST #4- checking to see if a ref is === thing we're reffing
is( $module->check4(), 'true', 'checkArray');
#
#FAILED TEST FEEDBcK
# 1..4
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# Can't locate object method "check4" via package "PerlRe
# 59.
# # Looks like you planned 4 tests but ran 3.
# # Looks like your test exited with 255 just after 3.
#
#PASSING TEST FEEDBACK:
# 1..4
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# ok 4 - checkScalar
#
#TEST #5 - Testing hash refs instead of array refs
#What is the value of each key in the reference? Does it match the value of the actual key?
is ($module->check5(), 'true', 'checkHash');
#
#Failed Test Feedback:
#
# 1..5
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# ok 4 - checkArray
# Can't locate object method "check5" via package "PerlRefTut" at r
# 80.
# # Looks like you planned 5 tests but ran 4.
# # Looks like your test exited with 255 just after 4.
#
# #PASSING TEST FEEDBACK :
# 1..5
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# ok 4 - checkArray
# ok 5 - checkHash
#
#TEST #6- manipulate Hash and see if expected value matches actual values
is ($module->check6(), 'true', 'manipulateHashes');
#
#FAILED TEST FEEDBACK
# #
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# ok 4 - checkArray
# ok 5 - checkHash
# not ok 6 - manipulateHashes
#   Failed test 'manipulateHashes'
#   at ref_test.t line 103.
#          got: '16'
#     expected: 'true'
# Looks like you planned 5 tests but ran 6
# Looks like you failed 1 test of 6 run.
# #PASSING TEST FEEDBACK:
# 1..5
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# ok 4 - checkArray
# ok 5 - checkHash
# ok 6 - manipulateHashes
# Looks like you planned 5 tests but ran 6.
# Test #7 - testing out some refs of refs (inner arrays and hashes)
#
is ($module->check7(), 'true', 'refsOfrefs');
#
#FAILED TEST FEEDBACK:
#
# 1..6
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# ok 4 - checkArray
# ok 5 - checkHash
# ok 6 - manipulateHashes
# not ok 7 - refsOfrefs
#   Failed test 'refsOfrefs'
#   at ref_test.t line 130.
#          got: '2'
#     expected: 'true'
# Looks like you planned 6 tests but ran 7.
# Looks like you failed 1 test of 7 run.
#
#PASSED
# 1..7
# ok 1 - Missing PerlRefTut.pm
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# ok 4 - checkArray
# ok 5 - checkHash
# ok 6 - manipulateHashes
# ok 7 - refsOfrefs
#
#Test #8- using is_deeply to see if referenced arrays/hashes are the same using "deep comparisons"
#DEEP COMPARISON-> walking each data structure to see if they are equivalent. If the two structures are different, it will display the place where they start differing

is_deeply ($array_ref2,$array_ref, "check deeply");
#
#FAILED
#not ok 8 - check deeply
#   Failed test 'check deeply'
#   at ref_test.t line 161.
#          got: 'yes'
#     expected: 'no'
# Looks like you failed 1 test of 8.
#
#FAILED 2-
# is_deeply() takes two or three args, you gave 5.
# This usually means you passed an array or hash instead
# of a reference to it at ref_test.t line 161
# not ok 8
# #   Failed test at ref_test.t line 161.
# # Looks like you failed 1 test of 8.
#Failed 3- two array references with 1 item in the array being different:
# not ok 8 - check deeply
#   Failed test 'check deeply'
#   at ref_test.t line 183.
#     Structures begin differing at:
#          $got->[2] = 'strung'
#     $expected->[2] = 'string'
# Looks like you failed 1 test of 8.
#
#Passed:
#
#1..8
# ok 1 - Missing PerlRefTut.
# ok 2 - use PerlRefTut;
# ok 3 - checkScalar
# ok 4 - checkArray
# ok 5 - checkHash
# ok 6 - manipulateHashes
# ok 7 - refsOfrefs
# ok 8 - check deeply
#
#Test #9 -> declaring and checking anonymous arrays and hashes
#
my $aref = [1, 2, 3];
print "@{$aref} \n";
is($aref->[2], 3, "check anonArrayRef");
#
#Failed
#my $aref;
# is($aref->[2], 3, "check anonArrayRef");
# not ok 9 - check anonArrayRef
#   Failed test 'check anonArrayRef'
#   at ref_test.t line 224.
#          got: undef
#     expected: '3'
# Looks like you failed 1 test of 9.
#
# #PASSING:
# ok 8 - check deeply
# ok 9 - check anonArrayRef
#
#Test #10- manipulating and using array references
#
my $aref2 = ['string', 'alphabet', 456, 'elephant'];
sub testArrayRef2 {
  my $string_thing = join('', @{$aref2});
  return $string_thing;
}

is (testArrayRef2(), "stringalphabet456elephant", "check arrayref loop with string");
#
#FAILED- didn't like the loop, but liked JOIN instead
# Argument "string" isn't numeric in addition (+) at ref_test.t line
# Argument "alphabet" isn't numeric in addition (+) at ref_test.t li
# Argument "elephant" isn't numeric in addition (+) at ref_test.t li
# not ok 10 - check arrayref loop with string
# #   Failed test 'check arrayref loop with string'
# #   at ref_test.t line 253.
# #          got: '456'
# #     expected: 'stringalphabet456elephant'
# # Looks like you planned 9 tests but ran 10.
# # Looks like you failed 1 test of 10 run.
#
# #PASSING: Didn't use a loop; used the perl func "JOIN"
# ok 4 - checkArray
# ok 5 - checkHash
# ok 6 - manipulateHashes
# ok 7 - refsOfrefs
# ok 8 - check deeply
# 1 2 3
# ok 9 - check anonArrayRef
# ok 10 - check arrayref loop with string
#
#
#Test #11 - returning and using Hash array refs and testing outputs
#
is (returnHashRef(), 14, "hashRef check");
#
sub returnHashRef {
  my $refVal1= $hash_ref->{'four'};
  my $refVal2= $hash_ref->{'ten'};
  return $refVal1+$refVal2;
}
#
#FAILED :
# ok 4 - checkArray
# ok 5 - checkHash
# ok 6 - manipulateHashes
# ok 7 - refsOfrefs
# ok 8 - check deeply
# 1 2 3
# ok 9 - check anonArrayRef
# ok 10 - check arrayref loop with string
# sub returnHashRef {
#   return 1;
# }
#
#PASSED: (don't add in a string, add the variables that catch values);
# #
# ok 9 - check anonArrayRef
# ok 10 - check arrayref loop with string
# ok 11 - hashRef check
#
#Test #12 - print out all the contents of a hash:
#Not an actual TDD because I don't know how to return and check the whole hash against an entire hash
is ('true', 'true', 'fake test');
for my $key (keys %z) {
  print "$key => $z{$key} \n";
}

for my $key2 (keys %{$hash_ref}) {
  print "$key2 => ${$hash_ref}{$key2}\n";
}
#PASSED:
# Actual=
# sting => stung
# sing => sung
# string => strung
# ten => 10
# four => 4
# REF=
# sting => stung
# sing => sung
# string => strung
# ten => 10
# four => 4

#Test #13- Trying to use some mult-dimensional arrays and array Refs
is ($p[1]->[2], $nested_ref->[1][2], "nested tested");
#
# #FAILED #1-
# Global symbol "@nested_ref" requires explicit package name at
# 6.
# Execution of ref_test.t aborted due to compilation errors.
## is ($p[1]->[2], $nested_ref[1][2], "nested tested");
#
#PASSED #1
#USes the arrows to escape the referencity
#
#ten => 10
# four => 4
# ok 13 - nested tested
# Looks like you planned 12 tests but ran 13.
#
#Test #14= Testing hash insertion- push all the keys of an object into an array. Then create new key-value pair. See if printed out list of keys matches list in the array.


  my @originals = ('string', 'sting', 'sing', 'four', 'ten', 'the_new_one');
  my @from_hash;
  sub add_and_push {
    $z{"the_new_one"} .= 1;
    foreach my $keys (keys %z) {
      push @from_hash, $keys;
    }
  }
  add_and_push();
  print "@originals \n";
  print "@from_hash \n";
  #create refs to use in is__deeply
  my @sorted_originals = sort @originals;
  my @sorted_from_hash = sort @from_hash;

  my $ref_sorted_orig = \@sorted_originals;
  my $ref_sorted_from_hash = \@sorted_from_hash;

  is_deeply ($ref_sorted_orig, $ref_sorted_from_hash, "testing hash insertion");
#
#FAILED:
#
##   Failed test 'testing autovivification'
#   at ref_test.t line 371.
#     Structures begin differing at:
#          $got->[0] = 'string'
#     $expected->[0] = 'sting'
# Looks like you failed 1 test of 14.
#
  #PASSED:
#   string sting sing four ten the_new_one
# sting the_new_one sing string ten four
# ok 14 - testing autovivification
#
#Test #15- using regex to return some values
#

sub replaceCats {
  my $n = "The categories of cats are concatenated";
  my $got;
  $got = $n =~ s/cat/dog/gr;
  return "$got";
}
replaceCats();
like (replaceCats(), "/The dogegories of dogs are condogenated/", 'replace cats');

#
# Failed:
#
#not ok 15 - replace cats
#   Failed test 'replace cats'
#   at ref_test.t line 400.
#     'The dogegories of dogs are condogenated' doesn't look much like a regex to me.
# Looks like you failed 1 test of 15.
#
#Passed
#
#ok 14 - testing hash insertion
# ok 15 - replace cats
#
#
#Test 16- attempting an conditional test with a regexp (for all the keys in %z, do this thing unless the key contains the letter "r");
#Testing with Test::Deep
#
#Does the sub return a 7digit number that starts with a 0 ?
my $string = 0;
sub string_do_er {
  for (1..6) {
    my $numb = 1 + int rand (9);
    $string .= $numb;
  }
  return $string;
}
my $string_re = re(/^0d{6}$/);

cmp_deeply(string_do_er(), $string_re, "number looks good");
#
#Failed
# Use of uninitialized value $this in pattern match (m//)
# not ok 16 - number looks good
#   Failed test 'number looks good'
#   at ref_test.t line 426.
#                   undef
#     doesn't match '/^0d{6}$/'
# Looks like you failed 1 test of 16.
#
#PASSING (starts with a 0)
# my $string = 0;
# sub string_do_er {
#   return $string;
# }
# string_do_er();
# like(string_do_er(), '/^0/', "number looks good");
# # ok 14 - testing hash insertio
# ok 15 - replace cats
# ok 16 - number looks good
#
#PASSING!!!!
# ok 14 - testing hash insertion
# ok 15 - replace cats
# ok 16 - number looks good
#
#
#Test #17- matching complex data structures
#when given a list of ticket numbers, compare all of them to make sure they all start with a W and are followed by a 5 digit number
my @tickets = ();
my $ticket_start = "W";
sub rand_tickets {
  for (0..4) {
    my $potential_ticket = "";
    my $len = 0;
    while ($len < 5) {
      my $numb = 0 + int rand(9);
      $potential_ticket = "";
      $potential_ticket = $ticket_start .= $numb;
      $len++;
    }
    push (@tickets, $potential_ticket);
  }
  print "$_\n" for @tickets;
}
rand_tickets();
