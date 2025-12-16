using Microsoft.EntityFrameworkCore;
using MusicPlayerClone.Model;

namespace MusicPlayerClone.Data
{
    public class ApplicationDBContext : DbContext
    {
        public ApplicationDBContext(DbContextOptions<ApplicationDBContext>options) : base(options)
        {   

        }
        public DbSet<User> uers { get; set; }
        public DbSet<Songs> songs { get; set; }
        public DbSet<Playlist> playLists { get; set; }
        public DbSet<PlayListSongs> playListSongs { get; set; }
        public DbSet<LikedSongscs> likedSongs { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);


        }

    }
}
