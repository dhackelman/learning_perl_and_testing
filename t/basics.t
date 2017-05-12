#!/usr/bin/perl

use strict;
use warnings;

# docs for Test::More: https://perldoc.perl.org/Test/More.html
use Test::More 'no_plan'; # tests => 1;

use_ok('Text::Para');

my $formatter = Text::Para->new;

isa_ok($formatter, 'Text::Para');

can_ok($formatter, 'columns');

#is assertion compares 2 values (the value being tested) and (the value we expect);
#third argument is a description for the test which will be printed out in the event of a failure!

is($formatter->columns, 72, 'default column width is 72');

$formatter = Text::Para->new(columns=>8);

is($formatter->columns, 8, 'initialised column width to 10');
