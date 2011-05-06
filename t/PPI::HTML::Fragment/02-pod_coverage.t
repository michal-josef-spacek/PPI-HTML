# Pragmas.
use strict;
use warnings;

# Modules.
use Test::Pod::Coverage 'tests' => 1;

# Test.
pod_coverage_ok('PPI::HTML::Fragment', 'PPI::HTML::Fragment is covered.');
