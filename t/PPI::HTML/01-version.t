# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML;
use Test::More 'tests' => 1;

# Test.
is($PPI::HTML::VERSION, '1.08', 'Version.');
