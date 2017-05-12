#!/usr/bin/perl

package Text::Para;

use strict;
use warnings;

my $foo = 'waffle';
my $bar = "yarblokos";

#attempt at OO without the Moose dependency
# sub new {
#   return bless {}, shift;
# }

use Moose;


has 'columns' => (is => 'rw', isa => 'Int', default => 72);

1;
