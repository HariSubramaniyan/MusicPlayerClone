import { Component, OnDestroy, OnInit } from '@angular/core';
import { Song } from '../../Interface/Song.Model';
import { Subscription } from 'rxjs';
import { Music } from '../../Services/music';

@Component({
  selector: 'app-player',
  imports: [],
  templateUrl: './player.html',
  styleUrl: './player.scss',
})
export class Player implements OnInit , OnDestroy {

  currentSong: Song | null = null;
  isPlaying: boolean = false;
  currentTime: number = 0;
  duration: number = 0;
  volume: number = 70;
  isLiked: boolean = false;

  private audio : HTMLAudioElement | null = null;
  private subscriptions = new Subscription();
  constructor(private musicService: Music) {}

  ngOnInit(): void {
   this.subscriptions.add(
    this.musicService.currentSong$.subscribe((Song) => {
      this.currentSong = Song;
    })
   );

    this.subscriptions.add(
      this.musicService.isPlaying$.subscribe((Playing) => {
        this.isPlaying = Playing;
        if(Playing){
          this.audio?.play();
        } else{
          this.audio?.pause();
        }
      })
    );
  }

  loadSong(song: Song) {
    if(this.audio){
      this.audio.pause();
    }
    this.audio = new Audio(song.audioUrl);
    this.audio.volume = this.volume / 100;

    this.audio.addEventListener('loadedmetadata', () => {
      this.duration = this.audio?.duration || 0;
    });

    this.audio.addEventListener('timeupdate', () => {
      this.currentTime = this.audio?.currentTime || 0;
    });
    this.audio.addEventListener('ended', () => {
      this.musicService.setIsPlaying(false);
    });

  }

  togglePlay() {
    this.musicService.setIsPlaying(!this.isPlaying);
  }
  seekTo(event: MouseEvent) {
    if (!this.audio) return;
    
    const progressBar = event.currentTarget as HTMLElement;
    const rect = progressBar.getBoundingClientRect();
    const percentage = (event.clientX - rect.left) / rect.width;
    
    this.audio.currentTime = percentage * this.duration;
  }
  changeVolume(event: MouseEvent) {
    const volumeBar = event.currentTarget as HTMLElement;
    const rect = volumeBar.getBoundingClientRect();
    const percentage = (event.clientX - rect.left) / rect.width;
    
    this.volume = Math.max(0, Math.min(100, percentage * 100));
    if (this.audio) {
      this.audio.volume = this.volume / 100;
    }
  }

  toggleLike() {
    if (this.currentSong) {
      this.musicService.toggleLike(this.currentSong.id).subscribe(() => {
        this.isLiked = !this.isLiked;
      });
    }
  }

  formatTime(seconds: number): string {
    const mins = Math.floor(seconds / 60);
    const secs = Math.floor(seconds % 60);
    return `${mins}:${secs.toString().padStart(2, '0')}`;
  }

  get progress(): number {
    return this.duration ? (this.currentTime / this.duration) * 100 : 0;
  }

  ngOnDestroy() {
    this.subscriptions.unsubscribe();
    if (this.audio) {
      this.audio.pause();
      this.audio = null;
    }
  }
  
}




