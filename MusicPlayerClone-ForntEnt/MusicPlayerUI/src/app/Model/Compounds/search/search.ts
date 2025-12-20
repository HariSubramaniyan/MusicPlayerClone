import { Component } from '@angular/core';
import { Song } from '../../Interface/Song.Model';
import { Music } from '../../Services/music';
import { debounceTime } from 'rxjs/internal/operators/debounceTime';
import { distinctUntilChanged } from 'rxjs/internal/operators/distinctUntilChanged';
import { switchMap } from 'rxjs/internal/operators/switchMap';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-search',
  imports: [],
  templateUrl: './search.html',
  styleUrl: './search.scss',
})
export class SearchComponent {
  searchResults: Song[] = [];
  private searchTerms = new Subject<string>();
  loading = false;

  constructor(private musicService: Music) {
    this.searchTerms.pipe(
      debounceTime(300),
      distinctUntilChanged(),
      switchMap(term => {
        this.loading = true;
        return this.musicService.SearchSongs(term);
      })
    ).subscribe(results => {
      this.searchResults = results;
      this.loading = false;
    });
  }

  search(term: string) {
    this.searchTerms.next(term);
  }

  playSong(song: Song) {
    this.musicService.setCurrentSong(song);
    this.musicService.setIsPlaying(true);
  }
}