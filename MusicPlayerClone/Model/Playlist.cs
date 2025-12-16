namespace MusicPlayerClone.Model
{
    public class Playlist
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string Description { get; set; }
        public string CoverUrl { get; set; }
        public int UserId { get; set; }
        public DateTime createdAt { get; set; } = DateTime.Now;
        public User user { get; set; }
        public ICollection<PlayListSongs> playListSongs { get; set; }

    }
}
