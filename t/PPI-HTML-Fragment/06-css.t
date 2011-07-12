# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 2;

# Test.
my $obj = PPI::HTML::Fragment->new('string', 'css');
is($obj->css, 'css');

# Test.
$obj->clear;
is($obj->css, undef);
