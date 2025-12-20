import { Component, OnInit } from '@angular/core';
import { Song } from '../../Interface/Song.Model';
import { Playlist } from '../../Interface/PlayList.Model';
import { Music } from '../../Services/music';

@Component({
  selector: 'app-home',
  imports: [],
  templateUrl: './home.html',
  styleUrl: './home.scss',
})
export class HomeComponent implements OnInit {
  songs: Song[] = [];
  playlists: Playlist[] = [];
  loading = true;

  constructor(private musicService: Music) {}

  ngOnInit() {
    this.loadSongs();
    this.loadPlaylists();
  }

  loadSongs() {
    this.musicService.getSongs().subscribe({
      next: (songs) => {
        this.songs = songs;
        this.loading = false;
      },
      error: (err) => {
        console.error('Error loading songs:', err);
        this.loading = false;
      }
    });
  }

  loadPlaylists() {
    this.musicService.getPlaylists().subscribe({
      next: (playlists) => {
        this.playlists = playlists;
      },
      error: (err) => {
        console.error('Error loading playlists:', err);
      }
    });
  }

  playSong(song: Song) {
    this.musicService.setCurrentSong(song);
    this.musicService.setIsPlaying(true);
  }
}