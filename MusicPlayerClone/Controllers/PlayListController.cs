using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MusicPlayerClone.Data;
using MusicPlayerClone.Model;

namespace MusicPlayerClone.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlayListController : ControllerBase
    {
        private readonly ApplicationDBContext dBContext;

        public PlayListController(ApplicationDBContext dBContext)
        {
            this.dBContext = dBContext;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Playlist>>> GetPlaylists()
        {

            int usrId = 1;

            return await dBContext.playLists
                .Where(p => p.UserId == usrId)
                .Include(p => p.playListSongs)
                .ThenInclude(ps => ps.songs)
                .ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Playlist>> GetPlaylist(int id)
        {
            var playlist = await dBContext.playLists
                .Include(p => p.playListSongs)
                .ThenInclude(ps => ps.songs)
                .FirstOrDefaultAsync(p => p.Id == id);

            if (playlist == null)
            {
                return NotFound();
            }

            return playlist;
        }

        // POST: api/playlists
        [HttpPost]
        public async Task<ActionResult<Playlist>> CreatePlaylist(Playlist playlist)
        {
            // For demo, using hardcoded userId = 1
            playlist.UserId = 1;
            playlist.createdAt = DateTime.UtcNow;

            dBContext.playLists.Add(playlist);
            await dBContext.SaveChangesAsync();

            return CreatedAtAction(nameof(GetPlaylist), new { id = playlist.Id }, playlist);
        }

        // POST: api/playlists/5/songs/3
        [HttpPost("{playlistId}/songs/{songId}")]
        public async Task<IActionResult> AddSongToPlaylist(int playlistId, int songId)
        {
            var playlist = await dBContext.playLists.FindAsync(playlistId);
            var song = await dBContext.songs.FindAsync(songId);

            if (playlist == null || song == null)
            {
                return NotFound();
            }

            var existingEntry = await dBContext.playListSongs
                .FirstOrDefaultAsync(ps => ps.playListId == playlistId && ps.songsId == songId);

            if (existingEntry != null)
            {
                return BadRequest("Song already in playlist");
            }

            var maxOrder = await dBContext.playListSongs
                .Where(ps => ps.playListId == playlistId)
                .MaxAsync(ps => (int?)ps.Order) ?? 0;

            var playlistSong = new PlayListSongs
            {
                playListId = playlistId,
                songsId = songId,
                Order = maxOrder + 1,
                AddedAt = DateTime.UtcNow
            };

            dBContext.playListSongs.Add(playlistSong);
            await dBContext.SaveChangesAsync();

            return NoContent();
        }

        // DELETE: api/playlists/5/songs/3
        [HttpDelete("{playlistId}/songs/{songId}")]
        public async Task<IActionResult> RemoveSongFromPlaylist(int playlistId, int songId)
        {
            var playlistSong = await dBContext.playListSongs
                .FirstOrDefaultAsync(ps => ps.playListId == playlistId && ps.songsId == songId);

            if (playlistSong == null)
            {
                return NotFound();
            }

            dBContext.playListSongs.Remove(playlistSong);
            await dBContext.SaveChangesAsync();

            return NoContent();
        }

        // DELETE: api/playlists/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePlaylist(int id)
        {
            var playlist = await dBContext.playLists.FindAsync(id);
            if (playlist == null)
            {
                return NotFound();
            }

            dBContext.playLists.Remove(playlist);
            await dBContext.SaveChangesAsync();

            return NoContent();
        }
    }
}
