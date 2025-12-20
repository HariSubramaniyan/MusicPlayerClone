import { Song } from "./Song.Model";

export interface Playlist {
    id: number;
    name: string;
    description: string;
    coverUrl: string;
    songs: Song[];
}