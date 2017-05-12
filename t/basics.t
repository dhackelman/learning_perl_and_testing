#!/usr/bin/perl

use strict;
use warnings;


use Test::More 'no_plan'; # tests => 1;

use_ok('Text::Para');

my $formatter = Text::Para->new;
isa_ok($formatter, 'Text::Para');
