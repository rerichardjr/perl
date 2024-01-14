package Song;

use strict;
use warnings;

sub new {
    my ( $class, $artist, $title, $previous, $next ) = @_;
    my $self = {
        artist => $artist,
        title => $title,
        previous => $previous,
        next => $next,
    };

    bless $self, $class;

    return $self;
}

sub artist {
    my $self = shift;
    return $self->{artist};
}

sub title {
    my $self = shift;
    return $self->{title};
}

sub next {
    my $self = shift;
    return $self->{next};
}

sub previous {
    my $self = shift;
    return $self->{previous};
}

sub setNext {
    my ( $self, $next ) = @_;
    $self->{next} = $next;
}

sub setPrevious {
    my ( $self, $previous ) = @_;
    $self->{previous} = $previous;
}

sub DESTROY {
    my $self = shift;
    print "Destroying song: ". $self->{artist} . " " . $self->{title} . "\n";
}

1;