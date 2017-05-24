use 5.006;
use strict;
use warnings;

package PerlRefTut;

my $x = "string";
my @y = ("string", "string", "string");
my %z = (
  "string"=>"strung",
  "sting"=>"stung",
  "sing"=>"sung"
);
my %w = (
  "input"=> 2,
  "expected"=> 16,
);

my @v = ("string", \%w, 'here');

my $scalar_ref = \$x;
my $array_ref = \@y;
my $hash_ref = \%z;

sub check {
  if ($x eq "string" && @y) {
    return 'true';
  }
}

sub check4 {
  if ($array_ref->[0] eq $y[0]) {
    return 'true';
  } else {
    return $y[0];
  }
}

sub check5 {
  if ($hash_ref->{sting} eq $z{sting} && $hash_ref->{sing} eq $z{sing} && $hash_ref->{string} eq $z{string}) {
    return 'true';
  } else {
    return $z{sting};
  }
}

sub check6 {
  if ($w{input} * 8 == 16) {
    return "true";
  }
}


sub check7 {
  my $in = $v[1]->{input};
  my $expected = $v[1]->{expected};
  my $out = $in * 8;
    if ($out == $expected) {
      return "true";
    }
}

sub check8arr1 {
  return @y;
}

sub check8arr2 {
  return $array_ref;
}
1;
#C:\Users\dh694n\Downloads\perlreftut
