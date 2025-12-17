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
        public DbSet<LikedSongscs> LikedSongs { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<LikedSongscs>()
                .HasKey(ls => new { ls.user.Id, ls.songsId });
            modelBuilder.Entity<LikedSongscs>()
                .HasOne(ls => ls.user)
                .WithMany(u => u.likesSongs)
                .HasForeignKey(ls => ls.user.Id);
            modelBuilder.Entity<LikedSongscs>()
                .HasOne(ls => ls.songs)
                .WithMany(s => s.likedBy)
                .HasForeignKey(ls => ls.songsId);

            modelBuilder.Entity<PlayListSongs>()
                .HasKey(ps => new { ps.playListId, ps.songsId });

            modelBuilder.Entity<PlayListSongs>()
                .HasOne(ps => ps.playList)
                .WithMany(p => p.playListSongs)
                .HasForeignKey(ps => ps.songsId);

            modelBuilder.Entity<PlayListSongs>()
                .HasOne(ps => ps.songs)
                .WithMany(s => s.playListSongs)
                .HasForeignKey(ps => ps.songsId);



        }

    }
}
