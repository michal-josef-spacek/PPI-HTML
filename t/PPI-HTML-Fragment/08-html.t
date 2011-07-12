# Pragmas.
use strict;
use warnings;

# Modules.
use PPI::HTML::Fragment;
use Test::More 'tests' => 8;

# Test.
my $obj = PPI::HTML::Fragment->new('', 'css');
is($obj->html, '<span class="css"></span>');

# Test.
$obj = PPI::HTML::Fragment->new('string', 'css');
is($obj->html, '<span class="css">string</span>');

# Test.
$obj->clear;
is($obj->html, 'string');

# Test.
$obj = PPI::HTML::Fragment->new('&<>"', 'css');
$obj->clear;
is($obj->html, '&amp;&lt;&gt;&quot;',
	'\'&\', \'<\', \'>\' and \'"\' in text.');

# Test.
$obj = PPI::HTML::Fragment->new("text\ntext", 'css');
$obj->clear;
is($obj->html, "text<br>\ntext", '\'\\n\' in text.');

# Test.
$obj = PPI::HTML::Fragment->new("text\r\ntext", 'css');
$obj->clear;
is($obj->html, "text<br>\ntext", '\'\\r\\n\' in text.');

# Test.
$obj = PPI::HTML::Fragment->new("text\r\r\ntext", 'css');
$obj->clear;
is($obj->html, "text<br>\ntext", '\'\\r\\r\\n\' in text.');

# Test.
$obj = PPI::HTML::Fragment->new("text\rtext", 'css');
$obj->clear;
is($obj->html, "text<br>\ntext", '\'\\r\' in text.');
