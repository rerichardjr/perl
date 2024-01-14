package Playlist;

use strict;
use warnings;
use Song;

sub new {
    my ( $class, $name, $head, $tail, $current ) = @_;
    my $self = {
        name => $name,
        head => $head,
        tail => $tail,
        current => $current,
        count => 0,
    };

    bless $self, $class;
    print "Creating playlist: " . $self->name . "\n";
    return $self;
}

sub name {
    my $self = shift;
    return $self->{name};
}

sub head {
    my $self = shift;
    return $self->{head};
}

sub tail {
    my $self = shift;
    return $self->{tail};
}

sub current {
    my $self = shift;
    return $self->{current};
}

sub count {
    my $self = shift;
    return $self->{count};
}

sub setHead {
    my ( $self, $head ) = @_;
    $self->{head} = $head;
}

sub setTail {
    my ( $self, $tail ) = @_;
    $self->{tail} = $tail;
}

sub setCurrent {
    my ( $self, $current ) = @_;
    $self->{current} = $current;
}

sub countSongs {
    my ( $self, $current ) = @_;
    $self->{count}++;
}

sub addSongsToPlaylist {
    my $self = shift;
    my ($artist, $title) = @_;
    print "Adding song: " . $artist . " - " . $title . "\n";
    my $song = Song->new($artist, $title);
    if ( ! defined($self->head) ) {
        $self->setHead($song);
    } else {
        $self->setCurrent($self->tail);
        $self->current->setNext($song);
        $self->head->setPrevious($song);
        $song->setPrevious($self->current);
        $song->setNext($self->head);
    }
    $self->setTail($song);
    $self->countSongs;
    return;
}

sub listSongs {
    my $self = shift;
    if ( $self->count == 0 ) {    
        print "Playlist is empty.\n";
        return;
    }
    $self->setCurrent($self->head);
    $self->printSongList;
    while ( defined($self->current->next) ) {
        if ($self->current->next eq $self->head) {
           return;
        } else {
            $self->setCurrent($self->current->next);
            $self->printSongList;
        }
    }
    return;
}

sub printSongList {
    my $self = shift;
    print $self->current->artist .  " - " . $self->current->title . "\n";
}

sub printSong {
    my $self = shift;
    print "Now playing: " . $self->current->artist . " - " . $self->current->title . "\n\n";
}

sub startPlaying {
    my $self = shift;
    $self->setCurrent($self->head);
    $self->printSong;
}

sub nextSong {
    my $self = shift;
    print "Skipping to next song...\n";
    $self->setCurrent($self->current->next);
    $self->printSong;
}

sub previousSong {
    my $self = shift;
    print "Skipping to previous song...\n";
    $self->setCurrent($self->current->previous);
    $self->printSong;
}

sub DESTROY {
    my $self = shift;
    print "Destroying playlist: " . $self->{name} . "\n";
}

1;
