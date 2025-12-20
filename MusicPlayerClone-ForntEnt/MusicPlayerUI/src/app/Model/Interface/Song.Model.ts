export interface Song {
    id: number;
    title: string;
    artist: string;
    album: string;
    duration: number; // duration in seconds
    coverUrl: string;
    audioUrl: string;
}