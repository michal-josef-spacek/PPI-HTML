# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 3;

# Test.
my $obj = PPI::HTML::Fragment->new('string', 'css');
is($obj->css, 'css');
my $ret = $obj->clear;
is($ret, 1);
is($obj->css, undef);
