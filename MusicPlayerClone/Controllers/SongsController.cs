using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MusicPlayerClone.Data;
using MusicPlayerClone.Model;

namespace MusicPlayerClone.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SongsController : ControllerBase
    {
        private readonly ApplicationDBContext Context;
        public SongsController(ApplicationDBContext Context) {
            this.Context = Context;

        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Songs>>> GetSongs()
        {
            return await Context.songs.ToListAsync();
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<Songs>> GetSong(int id)
        {
            var song = await Context.songs.FindAsync(id);

            if (song == null)
            {
                return NotFound();
            }

            return song;
        }
        [HttpGet("search")]

        public async Task<ActionResult<IEnumerable<Songs>>> SearchSongs([FromQuery] string q)
        {
            if (string.IsNullOrWhiteSpace(q))
            {
                return BadRequest("Search Query cannnot be Empty");

            }
            var songs = await Context.songs
                .Where(s => s.Title.Contains(q) || s.Artist.Contains(q) || s.Album.Contains(q))
                .ToListAsync();
            return songs;

        }

        [HttpPost]
        public async Task<ActionResult<Songs>> CreateSong(Songs song)
        {
            song.createdAt = DateTime.Now;
            Context.songs.Add(song);
            await Context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetSong), new { id = song.Id }, song);
        }

        [HttpPost("{id}/like")]
        public async Task<IActionResult> ToggleLike(int id)
        {
            int userId = 1;

            var existingLike = await Context.LikedSongs
                .FirstOrDefaultAsync(ls => ls.userId == userId && ls.songsId == id );
            if (existingLike != null)
            {
                Context.LikedSongs.Remove(existingLike);
            }
            else
            {
                var likedSongs = new LikedSongscs
                {
                    userId = userId,
                    songsId = id,
                    LikedAt = DateTime.Now
                };
                Context.LikedSongs.Add(likedSongs);
            }

            await Context.SaveChangesAsync();
            return NoContent();

        }

        [HttpGet("liked")]
        public async Task<ActionResult<IEnumerable<Songs>>> GetLikedSongs()
        {
            int userId = 1;
            var likedSongs = await Context.LikedSongs
                .Where(ls => ls.userId == userId)
                .Include(ls => ls.songs)
                .Select(ls => ls.songs)
                .ToListAsync();
            return likedSongs;
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSong(int id)
        {
            var song = await Context.songs.FindAsync(id);
            if(song == null)
            {
                return NotFound();
            }
            Context.songs.Remove(song);
            await Context.SaveChangesAsync();

            return NoContent();
        }

    }
}
