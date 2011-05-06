# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 5;

# Test.
my $obj = PPI::HTML::Fragment->new('string', 'css');
is($obj->string, 'string');
my $ret = $obj->concat;
is($ret, undef);
is($obj->string, 'string');

# Test.
$ret = $obj->concat('string');
is($ret, 1);
is($obj->string, 'stringstring');
