package PPI::HTML::Fragment;

=pod

=head1 NAME

PPI::HTML::Fragment - Generate HTML for fragment.

=head1 SYNOPSIS

 use PPI::HTML::Fragment;
 my $fragment = PPI::HTML::Fragment->new('string', 'css');
 my $string = $fragment->string;
 my $css = $fragment->css;
 my $ends_line = $fragment->ends_line;
 my $html_string = $fragment->html;
 $fragment->concat('concat_string');
 $fragment->clear;

=head1 METHODS

=cut

# A HTML fragment object is a small object that contains a string due to
# become HTML content, and a simple rule for it's display, such as a class
# name.

use strict;

use vars qw{$VERSION};
BEGIN {
	$VERSION = '1.08';
}





#####################################################################
# Constructor and Accessors

=head2 new $string $css

The C<new> constructor takes a fragment $string and $css.
Returns a new L<PPI::HTML::Fragment> object.

=cut

sub new {
	my $class  = ref $_[0] ? ref shift : shift;
	my $string = defined $_[0] ? shift : return undef;
	my $css    = shift or return undef;

	# Create the basic object
	my $self = bless {
		string => $string,
		css    => $css,
		}, $class;

	$self;
}

=head2 string

The C<string> accessor returns string of fragment.

=cut

sub string { $_[0]->{string} }

=head2 css

The C<css> accessor returns css for fragment.

=cut

sub css    { $_[0]->{css}    }





#####################################################################
# Main Methods

=head2 ends_line

The C<ends_line> accessor returns true if string in fragment ends by newline.

=cut

# Does the segment end with a newline?
sub ends_line { $_[0]->string =~ /\n$/ }

=head2 html

The C<html> accessor returns HTML code for fragment.

=cut

# Render to HTML
sub html {
	my $self = shift;
	my $html = $self->_escape( $self->string );
	return $html unless $self->css;
	$self->_tagpair( 'span', { class => $self->css }, $html );
}

=head2 concat $string

The C<concat> accessor add $string to object string.

=cut

sub concat {
	my $self = shift;
	my $string = defined $_[0] ? shift : return undef;
	$self->{string} .= $string;
	1;
}

=head2 clear

The C<clear> accessor clears css in object.

=cut

sub clear {
	my $self = shift;
	delete $self->{css};
	1;
}





#####################################################################
# Support Methods

# Embedding some HTML stuff until I find a suitably lightweight dependency
sub _escape {
	my $html = $_[1];
	$html =~ s/&/&amp;/g;
	$html =~ s/</&lt;/g;
	$html =~ s/>/&gt;/g;
	$html =~ s/\"/&quot;/g;
	$html =~ s/(\015{1,2}\012|\015|\012)/<br>\n/g;
	$html;
}

sub _tagpair {
	my $class = shift;
	my $tag   = shift or return undef;
	my %attr  = ref $_[0] eq 'HASH' ? %{shift()} : ();
	my $start = join( ' ', $tag,
		map { defined $attr{$_} ? qq($_="$attr{$_}") : "$_" }
		sort keys %attr );
	"<$start>" . join('', @_) . "</$tag>";
}

1;
