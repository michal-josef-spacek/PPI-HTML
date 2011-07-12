# Pragmas.
use strict;
use warnings;

# Modules.
use CSS::Tiny;
use PPI::HTML;
use Test::More 'tests' => 8;

# Test.
my $obj = PPI::HTML->new;
ok(defined $obj);
ok($obj->isa('PPI::HTML'));

# Test.
$obj = $obj->new;
ok(defined $obj);
ok($obj->isa('PPI::HTML'));

# Test.
$obj = PPI::HTML->new(
	'colours' => {
		'pod' => '#008080',
	},
);
ok(defined $obj);
ok($obj->isa('PPI::HTML'));

# Test.
$obj = PPI::HTML->new(
	'css' => CSS::Tiny->new,
);
ok(defined $obj);
ok($obj->isa('PPI::HTML'));
