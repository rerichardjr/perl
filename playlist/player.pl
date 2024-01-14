use strict;
use warnings;

BEGIN {
    push @INC, "./lib";
}

use Playlist;

my $playlist = Playlist->new('My playlist');

$playlist->listSongs();

$playlist->addSongsToPlaylist('Stone Temple Pilots', 'Dead and Bloated');
$playlist->addSongsToPlaylist('Pearl Jam', 'Jeremy');
$playlist->addSongsToPlaylist('Sound Garden', 'Black Days');
$playlist->addSongsToPlaylist('Metallica', 'One');
$playlist->addSongsToPlaylist('Nirvana', 'Smells Like Teen Spirit');
$playlist->addSongsToPlaylist('Bush', 'Come Down');

$playlist->listSongs();

$playlist->startPlaying();

$playlist->nextSong();
$playlist->nextSong();
$playlist->nextSong();
$playlist->nextSong();
$playlist->nextSong();
$playlist->nextSong();
$playlist->nextSong();

$playlist->previousSong();
$playlist->previousSong();
$playlist->previousSong();
$playlist->previousSong();
$playlist->previousSong();
$playlist->previousSong();
$playlist->previousSong();