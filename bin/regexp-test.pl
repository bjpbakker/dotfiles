#!/usr/bin/perl

use strict;
use warnings;

use Term::ANSIColor;

sub test_regexp {
  my $options = shift;
  my $regexp = $options->{regexp};
  my $inputs = $options->{inputs};
  my $match_fn = $options->{match};
  my $no_match_fn = $options->{no_match};

  for my $input (@$inputs) {
    if (matches($input, $regexp)) {
      &$match_fn($input, $regexp);
    } else {
      &$no_match_fn($input, $regexp);
    }
  }
}

sub matches {
  my $input = shift;
  my $regexp = shift;

  return $input =~ /$regexp/;
}

sub print_match {
  my $input = shift;
  my $regexp = shift;
  print colored ['green'], "$input matches $regexp", "\n";
}

sub print_no_match {
  my $input = shift;
  my $regexp = shift;
  print colored ['red'], "$input does NOT match $regexp", "\n";
}

{

  my $regexp = shift @ARGV;

  if (!$regexp || !@ARGV) {
    print "usage: $0 <regexp> <INPUT>+\n";
    exit 1;
  }


  test_regexp({ regexp => $regexp,
      inputs => \@ARGV,
      match => \&print_match,
      no_match => \&print_no_match,
    });

}

