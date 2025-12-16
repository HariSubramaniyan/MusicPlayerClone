namespace MusicPlayerClone.Model
{
    public class User
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public DateTime createdAt { get; set; } = DateTime.Now;
        public ICollection<Playlist> playLists { get; set; }
        public ICollection<LikedSongscs> likesSongs { get; set; }
    }
}
