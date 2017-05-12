#!/usr/bin/perl

package Text::Para;

use strict;
use warnings;

#attempt at OO without the Moose dependency
sub new {
  return bless {}, shift;
}

1;
