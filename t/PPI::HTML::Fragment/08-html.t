# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 3;

# Test.
my $obj = PPI::HTML::Fragment->new('', 'css');
is($obj->html, '<span class="css"></span>');

# Test.
$obj = PPI::HTML::Fragment->new('string', 'css');
is($obj->html, '<span class="css">string</span>');

# Test.
$obj->clear;
is($obj->html, 'string');
