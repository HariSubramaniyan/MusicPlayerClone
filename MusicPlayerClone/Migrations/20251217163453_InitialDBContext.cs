using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MusicPlayerClone.Migrations
{
    /// <inheritdoc />
    public partial class InitialDBContext : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "songs",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    Artist = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    Album = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    Duration = table.Column<int>(type: "int", nullable: false),
                    CoverUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    AudioUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    createdAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_songs", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "uers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Password = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    createdAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_uers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "LikedSongs",
                columns: table => new
                {
                    userId = table.Column<int>(type: "int", nullable: false),
                    songsId = table.Column<int>(type: "int", nullable: false),
                    LikedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LikedSongs", x => new { x.userId, x.songsId });
                    table.ForeignKey(
                        name: "FK_LikedSongs_songs_songsId",
                        column: x => x.songsId,
                        principalTable: "songs",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_LikedSongs_uers_userId",
                        column: x => x.userId,
                        principalTable: "uers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "playLists",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CoverUrl = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    createdAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_playLists", x => x.Id);
                    table.ForeignKey(
                        name: "FK_playLists_uers_UserId",
                        column: x => x.UserId,
                        principalTable: "uers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "playListSongs",
                columns: table => new
                {
                    playListId = table.Column<int>(type: "int", nullable: false),
                    songsId = table.Column<int>(type: "int", nullable: false),
                    Order = table.Column<int>(type: "int", nullable: false),
                    AddedAt = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_playListSongs", x => new { x.playListId, x.songsId });
                    table.ForeignKey(
                        name: "FK_playListSongs_playLists_songsId",
                        column: x => x.songsId,
                        principalTable: "playLists",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_playListSongs_songs_songsId",
                        column: x => x.songsId,
                        principalTable: "songs",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_LikedSongs_songsId",
                table: "LikedSongs",
                column: "songsId");

            migrationBuilder.CreateIndex(
                name: "IX_playLists_UserId",
                table: "playLists",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_playListSongs_songsId",
                table: "playListSongs",
                column: "songsId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "LikedSongs");

            migrationBuilder.DropTable(
                name: "playListSongs");

            migrationBuilder.DropTable(
                name: "playLists");

            migrationBuilder.DropTable(
                name: "songs");

            migrationBuilder.DropTable(
                name: "uers");
        }
    }
}
