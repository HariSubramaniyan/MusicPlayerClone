using System.ComponentModel.DataAnnotations;

namespace MusicPlayerClone.Model
{
    public class Songs
    {
        public int Id { get; set; }
        [Required]
        [MaxLength(200)]
        public string Title { get; set; }
        [Required]
        [MaxLength(200)]
        public string Artist { get; set; }
        [MaxLength(200)]
        public string Album { get; set; }
        public int Duration { get; set; } // Duration in seconds
        public string CoverUrl { get; set; }
        public string AudioUrl { get; set; }
        public DateTime createdAt { get; set; } = DateTime.Now;

        public ICollection<PlayListSongs> playListSongs { get; set; }
        public ICollection<LikedSongscs> likedBy { get; set; }
    }
}
