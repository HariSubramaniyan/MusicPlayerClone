import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable } from 'rxjs';
import { Song } from '../Interface/Song.Model';
import { HttpClient } from '@angular/common/http';
import { Playlist } from '../Interface/PlayList.Model';

@Injectable({
  providedIn: 'root',
})
export class Music {
  private apiURl ='https://localhost:7288/api';

  private currentSongSubject  = new BehaviorSubject<Song | null>(null);
  public currentSong$ = this.currentSongSubject.asObservable();
  
  private isPlayingSubject = new BehaviorSubject<boolean>(false);
  public isPlaying$ = this.isPlayingSubject.asObservable();

  constructor(private http: HttpClient) {}

  getSongs() : Observable<Song[]> {
    return this.http.get<Song[]>(`${this.apiURl}/songs`);
  }

  getSongsId(id : number) :Observable<Song>{
    return this.http.get<Song>(`${this.apiURl}/songs/${id}`);
  }

  SearchSongs(query: string):Observable<Song[]> {
    return this.http.get<Song[]>(`${this.apiURl}/songs/search?query=${query}`);
  }

  getPlaylists(): Observable<Playlist[]> {
    return this.http.get<Playlist[]>(`${this.apiURl}/songs/playing`);

  }

  CreatePlaylist(playlist: Playlist): Observable<Playlist> {
    return this.http.post<Playlist>(`${this.apiURl}/songs/playing`, playlist);
  }

  addSongToPlaylist(playlistId: number, songId: number): Observable<void> {
    return this.http.post<void>(`${this.apiURl}/songs/playing/${playlistId}/add/${songId}`, {});
  }

  toggleLike(songId: number): Observable<void> {
    return this.http.post<void>(`${this.apiURl}/songs/${songId}/like`, {});
  }

  getLikedSongs(): Observable<Song[]> {
    return this.http.get<Song[]>(`${this.apiURl}/songs/liked`);
  }
  setCurrentSong(song: Song) {
    this.currentSongSubject.next(song);
  }
  setIsPlaying(isPlaying: boolean) {
    this.isPlayingSubject.next(isPlaying);
  }
}