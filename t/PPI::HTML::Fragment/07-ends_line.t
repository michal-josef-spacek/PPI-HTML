# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 2;

# Test.
my $obj = PPI::HTML::Fragment->new('string', 'css');
is($obj->ends_line, '');

# Test.
$obj = PPI::HTML::Fragment->new("string\n", 'css');
is($obj->ends_line, 1);
