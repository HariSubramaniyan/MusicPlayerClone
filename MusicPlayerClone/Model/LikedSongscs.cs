namespace MusicPlayerClone.Model
{
    public class LikedSongscs
    {
        public int userId { get; set; }
        
        public User user { get; set; }
        public int songsId { get; set; }
        public Songs songs { get; set; }

        public DateTime LikedAt { get; set; } = DateTime.Now;
    }
}
