# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 1;

# Test.
is($PPI::HTML::Fragment::VERSION, '1.08', 'Version.');
