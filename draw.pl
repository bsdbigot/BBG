#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my @letters = ( 'B', 'I', 'N', 'G', 'O' );
my @spaces = ();
my ( $i, $j );

for ( $i = 0; $i <= $#letters; $i++ )
{
	for ( $j = 0; $j < 15; $j++ )
	{
		push( @spaces, join( '-', $letters[$i], ( ( $j + 1 ) + ( $i * 15 ) ) ) );
	}
}

my %used = map { $_ => 0 } @spaces;
my @shuffled = keys( %used );
%used = ();

my $inst = 'q';
my $index = 0;
my $draw;
print( "Draw, Win, Quit? \n" );
while ( $inst = <STDIN> )
{
	if ( $inst =~ /^d/i )
	{
		if ( $#shuffled == 0 )
		{
			printf( "All combinations used.\n" );
			exit();
		}
		$draw = pop( @shuffled );
		printf( "\t%s\n", $draw );
		$used{$draw} = 1;
	}
	elsif ( $inst =~ /^w/i )
	{
		foreach $draw ( sort keys %used )
		{
			printf( "\t%s\n", $draw );
		}
	}
	elsif ( $inst =~ /^q/i )
	{
		exit();
	}
	print( "\nDraw, Win, Quit? \n" );
}

#print( Dumper( \%used ) );


__END__






my $col = int( rand( $#letters ) );
my $val = int( rand( 15 ) ) + ( $col * 15 ) + 1;

printf( "%s-%s\n", $letters[$col], $val );


__END__
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
