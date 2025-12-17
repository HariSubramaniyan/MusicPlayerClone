namespace MusicPlayerClone.Model
{
    public class PlayListSongs
    {
        public int playListId { get; set; }

        public Playlist playList { get; set; }

        public int songsId { get; set; }
        public Songs songs { get; set; }
        public int Order { get; set; }
        public DateTime AddedAt { get; set; } = DateTime.Now;
    }
}
