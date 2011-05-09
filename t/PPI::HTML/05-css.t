# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML;
use Test::More 'tests' => 1;

# Test.
my $obj = PPI::HTML->new;
is($obj->css, undef);
