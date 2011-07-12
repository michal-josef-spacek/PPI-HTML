# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 10;

# Test.
my $obj = PPI::HTML::Fragment->new;
is($obj, undef);

# Test.
$obj = PPI::HTML::Fragment->new('string');
is($obj, undef);

# Test.
$obj = PPI::HTML::Fragment->new('string', 'css');
ok(defined $obj);
ok($obj->isa('PPI::HTML::Fragment'));

# Test.
$obj = $obj->new('string', 'css');
ok(defined $obj);
ok($obj->isa('PPI::HTML::Fragment'));

# Obscure test.
$obj = PPI::HTML::Fragment->new(\'string', 'css');
ok(defined $obj);
ok($obj->isa('PPI::HTML::Fragment'));

# Obscure test.
$obj = PPI::HTML::Fragment->new(
	PPI::HTML::Fragment->new('string', 'css'),
	'css',
);
ok(defined $obj);
ok($obj->isa('PPI::HTML::Fragment'));
