# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 1;

# Test.
my $obj = PPI::HTML::Fragment->new('string', 'css');
is($obj->string, 'string');
