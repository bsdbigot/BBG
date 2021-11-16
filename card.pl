#!/usr/bin/perl -w
use strict;
use experimental 'smartmatch';

my @letters = ( 'B', 'I', 'N', 'G', 'O' );
my $i = 0;
my $j = 0;
my %card;
my @col = [];
our $debug = 0;

for ( $i = 0; $i <= $#letters; $i++ )
{
	@col = [];
	errlog( "loop", $i );
	while ( $#col < 5 )
	{
		errlog( "space", $#col );
		my $space = int( rand( 15 ) ) + ( $i * 15 ) + 1;
		if ( $space ~~ @col )
		{
			errlog( "already have", $space );
		}
		else
		{
			errlog( "adding", $space );
			push( @col, $space );
		}
	}
	@{$card{ $letters[ $i ] }} = sort { $a <=> $b } @col;
}

printf( " B\t I\t N\t G\t O\n\n" );
for ( $i = 0; $i < 5; $i++ )
{
	my $n = 'N';
	if ( 2 == $i )
	{
		${$card{'N'}}[$i] = '*';
	}
	printf( "%2d\t%2d\t%2s\t%2d\t%2d\n\n",
		${$card{'B'}}[$i],
		${$card{'I'}}[$i],
		${$card{'N'}}[$i],
		${$card{'G'}}[$i],
		${$card{'O'}}[$i]
	);
}


sub errlog
{
	if ( $debug )
	{
		print STDERR join( "\t", @_ ), "\n";
	}
}


__END__
