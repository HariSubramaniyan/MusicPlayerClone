-- ============================================
-- SPOTIFY CLONE - TAMIL SONGS SAMPLE DATA
-- ============================================

-- தமிழ் பாடல்கள் - Tamil Songs Database
-- Run this script after creating your database

USE SpotifyCloneDb;
GO

-- ============================================
-- 1. INSERT USERS (பயனர்கள்)
-- ============================================

INSERT INTO Users (Username, Email, PasswordHash, CreatedAt) VALUES
('rajini_fan', 'rajini@example.com', 'hashed_password_123', GETUTCDATE()),
('vijay_lover', 'vijay@example.com', 'hashed_password_456', GETUTCDATE()),
('ar_rahman_fan', 'arrahman@example.com', 'hashed_password_789', GETUTCDATE()),
('ilayaraja_follower', 'ilayaraja@example.com', 'hashed_password_abc', GETUTCDATE()),
('tamil_music_lover', 'tamilmusic@example.com', 'hashed_password_def', GETUTCDATE());

GO

-- ============================================
-- 2. INSERT TAMIL SONGS (தமிழ் பாடல்கள்)
-- ============================================

-- AR Rahman Songs (ஏ.ஆர்.ரகுமான் பாடல்கள்)
INSERT INTO Songs (Title, Artist, Album, Duration, CoverUrl, AudioUrl, CreatedAt) VALUES
('Vaseegara', 'AR Rahman, Bombay Jayashri', 'Minnale', 285, 'https://picsum.photos/seed/tamil1/300', 'https://example.com/audio/vaseegara.mp3', GETUTCDATE()),
('Munbe Vaa', 'AR Rahman, Naresh Iyer, Andrea Jeremiah', 'Sillunu Oru Kaadhal', 265, 'https://picsum.photos/seed/tamil2/300', 'https://example.com/audio/munbe-vaa.mp3', GETUTCDATE()),
('Uyire Uyire', 'AR Rahman, Unni Menon, Anuradha Sriram', 'Bombay', 325, 'https://picsum.photos/seed/tamil3/300', 'https://example.com/audio/uyire-uyire.mp3', GETUTCDATE()),
('Snehithane', 'AR Rahman, Unni Krishnan, Hariharan', 'Alaipayuthey', 298, 'https://picsum.photos/seed/tamil4/300', 'https://example.com/audio/snehithane.mp3', GETUTCDATE()),
('Enna Solla Pogirai', 'AR Rahman, Sid Sriram', 'Kandukondain Kandukondain', 276, 'https://picsum.photos/seed/tamil5/300', 'https://example.com/audio/enna-solla.mp3', GETUTCDATE()),

-- Ilayaraja Songs (இளையராஜா பாடல்கள்)
('Poo Maalaye Thol Serava', 'Ilayaraja, SPB, S Janaki', 'Pagal Nilavu', 267, 'https://picsum.photos/seed/tamil6/300', 'https://example.com/audio/poo-maalaye.mp3', GETUTCDATE()),
('Nilave Vaa', 'Ilayaraja, Yesudas', 'Mouna Raagam', 289, 'https://picsum.photos/seed/tamil7/300', 'https://example.com/audio/nilave-vaa.mp3', GETUTCDATE()),
('Mannil Indha Kaadhal', 'Ilayaraja, SPB', 'Keladi Kanmani', 254, 'https://picsum.photos/seed/tamil8/300', 'https://example.com/audio/mannil-indha.mp3', GETUTCDATE()),
('Sundari Kannal', 'Ilayaraja, SPB', 'Thalapathi', 243, 'https://picsum.photos/seed/tamil9/300', 'https://example.com/audio/sundari-kannal.mp3', GETUTCDATE()),
('Kadhal Rojave', 'Ilayaraja, SPB, Swarnalatha', 'Roja', 312, 'https://picsum.photos/seed/tamil10/300', 'https://example.com/audio/kadhal-rojave.mp3', GETUTCDATE()),

-- Anirudh Songs (அனிருத் பாடல்கள்)
('Why This Kolaveri Di', 'Anirudh, Dhanush', '3', 245, 'https://picsum.photos/seed/tamil11/300', 'https://example.com/audio/kolaveri.mp3', GETUTCDATE()),
('Thangamey', 'Anirudh, Dhanush', 'Naanum Rowdy Dhaan', 234, 'https://picsum.photos/seed/tamil12/300', 'https://example.com/audio/thangamey.mp3', GETUTCDATE()),
('Marana Mass', 'Anirudh, SPB', 'Petta', 267, 'https://picsum.photos/seed/tamil13/300', 'https://example.com/audio/marana-mass.mp3', GETUTCDATE()),
('Vaathi Coming', 'Anirudh, Gana Balachandar', 'Master', 198, 'https://picsum.photos/seed/tamil14/300', 'https://example.com/audio/vaathi-coming.mp3', GETUTCDATE()),
('Kannazhaga', 'Anirudh, Sid Sriram', '3', 287, 'https://picsum.photos/seed/tamil15/300', 'https://example.com/audio/kannazhaga.mp3', GETUTCDATE()),

-- Yuvan Shankar Raja Songs (யுவன் சங்கர் ராஜா பாடல்கள்)
('Evan Di Unna Pethan', 'Yuvan, Benny Dayal', 'Vaaranam Aayiram', 223, 'https://picsum.photos/seed/tamil16/300', 'https://example.com/audio/evan-di-unna.mp3', GETUTCDATE()),
('Loosu Penne', 'Yuvan, Benny Dayal', 'Vallavan', 256, 'https://picsum.photos/seed/tamil17/300', 'https://example.com/audio/loosu-penne.mp3', GETUTCDATE()),
('Kadhal Anukkal', 'Yuvan, Harish Raghavendra', 'Enthiran', 298, 'https://picsum.photos/seed/tamil18/300', 'https://example.com/audio/kadhal-anukkal.mp3', GETUTCDATE()),
('Oh Penne Penne', 'Yuvan, Karthik', 'Vaanam', 234, 'https://picsum.photos/seed/tamil19/300', 'https://example.com/audio/oh-penne.mp3', GETUTCDATE()),
('Theepidikka', 'Yuvan, Karthik, Madhu Balakrishnan', 'Paiyaa', 245, 'https://picsum.photos/seed/tamil20/300', 'https://example.com/audio/theepidikka.mp3', GETUTCDATE()),

-- Harris Jayaraj Songs (ஹாரிஸ் ஜெயராஜ் பாடல்கள்)
('Uyirin Uyire', 'Harris Jayaraj, Karthik', 'Kaakha Kaakha', 278, 'https://picsum.photos/seed/tamil21/300', 'https://example.com/audio/uyirin-uyire.mp3', GETUTCDATE()),
('Suttum Vizhi', 'Harris Jayaraj, Bombay Jayashri', 'Ghajini', 312, 'https://picsum.photos/seed/tamil22/300', 'https://example.com/audio/suttum-vizhi.mp3', GETUTCDATE()),
('Munbe Vaa En Anbe Vaa', 'Harris Jayaraj, Naresh Iyer', 'Sillunu Oru Kaadhal', 289, 'https://picsum.photos/seed/tamil23/300', 'https://example.com/audio/munbe-vaa-harris.mp3', GETUTCDATE()),
('Kadhal Sadugudu', 'Harris Jayaraj, Harini, Shankar Mahadevan', 'Alaipayuthey', 254, 'https://picsum.photos/seed/tamil24/300', 'https://example.com/audio/kadhal-sadugudu.mp3', GETUTCDATE()),
('Oh Humsafar', 'Harris Jayaraj, KK, Shreya Ghoshal', 'Tony', 267, 'https://picsum.photos/seed/tamil25/300', 'https://example.com/audio/oh-humsafar.mp3', GETUTCDATE()),

-- Recent Hit Songs (சமீபத்திய ஹிட் பாடல்கள்)
('Rowdy Baby', 'Dhanush, Dhee', 'Maari 2', 245, 'https://picsum.photos/seed/tamil26/300', 'https://example.com/audio/rowdy-baby.mp3', GETUTCDATE()),
('Vaathi Raid', 'Anirudh, Various', 'Master', 234, 'https://picsum.photos/seed/tamil27/300', 'https://example.com/audio/vaathi-raid.mp3', GETUTCDATE()),
('Enjoy Enjaami', 'Dhee, Arivu', 'Independent', 298, 'https://picsum.photos/seed/tamil28/300', 'https://example.com/audio/enjoy-enjaami.mp3', GETUTCDATE()),
('Arabic Kuthu', 'Anirudh, Jonita Gandhi, Anirudh', 'Beast', 267, 'https://picsum.photos/seed/tamil29/300', 'https://example.com/audio/arabic-kuthu.mp3', GETUTCDATE()),
('Kaattu Payale', 'Santhosh Narayanan, Anthony Daasan', 'Sarpatta Parambarai', 289, 'https://picsum.photos/seed/tamil30/300', 'https://example.com/audio/kaattu-payale.mp3', GETUTCDATE()),

-- Classic Devotional Songs (பக்தி பாடல்கள்)
('Vetri Kodi Kattu', 'Ilaiyaraaja, SPB', 'Thalapathi', 278, 'https://picsum.photos/seed/tamil31/300', 'https://example.com/audio/vetri-kodi.mp3', GETUTCDATE()),
('Murugan Murugan', 'Yuvan, Various', 'Pudhupettai', 245, 'https://picsum.photos/seed/tamil32/300', 'https://example.com/audio/murugan-murugan.mp3', GETUTCDATE()),
('Kandha Sasti Kavasam', 'Various', 'Devotional', 892, 'https://picsum.photos/seed/tamil33/300', 'https://example.com/audio/kandha-sasti.mp3', GETUTCDATE()),
('Om Namah Shivaya', 'Various', 'Devotional', 312, 'https://picsum.photos/seed/tamil34/300', 'https://example.com/audio/om-namah.mp3', GETUTCDATE()),
('Vinayagar Agaval', 'Various', 'Devotional', 567, 'https://picsum.photos/seed/tamil35/300', 'https://example.com/audio/vinayagar-agaval.mp3', GETUTCDATE()),

-- Folk Songs (நாட்டுப்புற பாடல்கள்)
('Otha Sollaala', 'Anthony Daasan', 'Aadukalam', 234, 'https://picsum.photos/seed/tamil36/300', 'https://example.com/audio/otha-sollaala.mp3', GETUTCDATE()),
('Azhagiya Soodana Poovey', 'GV Prakash, Anthony Daasan', 'Madrasapattinam', 267, 'https://picsum.photos/seed/tamil37/300', 'https://example.com/audio/azhagiya-soodana.mp3', GETUTCDATE()),
('Kalakka Povathu Yaaru', 'Anthony Daasan', 'Naan Mahaan Alla', 245, 'https://picsum.photos/seed/tamil38/300', 'https://example.com/audio/kalakka-povathu.mp3', GETUTCDATE()),
('Senjitaley', 'Darbuka Siva, Anthony Daasan', 'Asuran', 298, 'https://picsum.photos/seed/tamil39/300', 'https://example.com/audio/senjitaley.mp3', GETUTCDATE()),
('Kannamma', 'Sid Sriram', 'Kaala', 287, 'https://picsum.photos/seed/tamil40/300', 'https://example.com/audio/kannamma.mp3', GETUTCDATE());

GO

-- ============================================
-- 3. INSERT PLAYLISTS (பிளேலிஸ்ட்கள்)
-- ============================================

INSERT INTO Playlists (Name, Description, CoverUrl, UserId, CreatedAt) VALUES
-- User 1 (rajini_fan) playlists
('Superstar Hits', 'Thalaivar Rajinikanth paadalgal', 'https://picsum.photos/seed/playlist1/300', 1, GETUTCDATE()),
('AR Rahman Melodies', 'ARR-in inimaiyana paadalgal', 'https://picsum.photos/seed/playlist2/300', 1, GETUTCDATE()),
('Workout Kuthu Paattu', 'Gym-ku power tharum paadalgal', 'https://picsum.photos/seed/playlist3/300', 1, GETUTCDATE()),
('Love Songs Tamil', 'Kaadhal paadalgal', 'https://picsum.photos/seed/playlist4/300', 1, GETUTCDATE()),

-- User 2 (vijay_lover) playlists
('Thalapathy Special', 'Vijay hits ellam inge', 'https://picsum.photos/seed/playlist5/300', 2, GETUTCDATE()),
('Anirudh Kuthu', 'Anirudh-in mass paadalgal', 'https://picsum.photos/seed/playlist6/300', 2, GETUTCDATE()),
('Party Tamil Songs', 'Party-ku ulla paadalgal', 'https://picsum.photos/seed/playlist7/300', 2, GETUTCDATE()),

-- User 3 (ar_rahman_fan) playlists
('ARR Tamil Classics', 'AR Rahman evergreen songs', 'https://picsum.photos/seed/playlist8/300', 3, GETUTCDATE()),
('ARR Romantic Hits', 'Rahman romantic melodies', 'https://picsum.photos/seed/playlist9/300', 3, GETUTCDATE()),
('Morning Devotional', 'Kaalai poojai paadalgal', 'https://picsum.photos/seed/playlist10/300', 3, GETUTCDATE()),

-- User 4 (ilayaraja_follower) playlists
('Ilayaraja Gems', 'Isaignani-yin sirandha paadalgal', 'https://picsum.photos/seed/playlist11/300', 4, GETUTCDATE()),
('80s 90s Tamil Hits', 'Pazhaya paadalgal', 'https://picsum.photos/seed/playlist12/300', 4, GETUTCDATE()),
('Ilayaraja Melodies', 'Melody paadalgal mattum', 'https://picsum.photos/seed/playlist13/300', 4, GETUTCDATE()),

-- User 5 (tamil_music_lover) playlists
('Tamil Folk Songs', 'Naatupura paadalgal', 'https://picsum.photos/seed/playlist14/300', 5, GETUTCDATE()),
('Best of Tamil Cinema', 'Tamil cinema best hits', 'https://picsum.photos/seed/playlist15/300', 5, GETUTCDATE()),
('Road Trip Tamil', 'Long drive-ku perfect songs', 'https://picsum.photos/seed/playlist16/300', 5, GETUTCDATE()),
('Gaana Songs', 'Chennai gana paadalgal', 'https://picsum.photos/seed/playlist17/300', 5, GETUTCDATE()),
('Study Music Tamil', 'Padikkum pothu kekkalam', 'https://picsum.photos/seed/playlist18/300', 5, GETUTCDATE());

GO

-- ============================================
-- 4. INSERT PLAYLIST SONGS (பிளேலிஸ்ட் பாடல்கள்)
-- ============================================

-- Superstar Hits (Playlist 1)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(1, 13, 1, GETUTCDATE()),  -- Marana Mass
(1, 31, 2, GETUTCDATE()),  -- Vetri Kodi Kattu
(1, 9, 3, GETUTCDATE()),   -- Sundari Kannal
(1, 6, 4, GETUTCDATE()),   -- Poo Maalaye
(1, 10, 5, GETUTCDATE());  -- Kadhal Rojave

-- AR Rahman Melodies (Playlist 2)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(2, 1, 1, GETUTCDATE()),   -- Vaseegara
(2, 2, 2, GETUTCDATE()),   -- Munbe Vaa
(2, 3, 3, GETUTCDATE()),   -- Uyire Uyire
(2, 4, 4, GETUTCDATE()),   -- Snehithane
(2, 5, 5, GETUTCDATE()),   -- Enna Solla Pogirai
(2, 10, 6, GETUTCDATE());  -- Kadhal Rojave

-- Workout Kuthu Paattu (Playlist 3)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(3, 11, 1, GETUTCDATE()),  -- Why This Kolaveri Di
(3, 13, 2, GETUTCDATE()),  -- Marana Mass
(3, 14, 3, GETUTCDATE()),  -- Vaathi Coming
(3, 26, 4, GETUTCDATE()),  -- Rowdy Baby
(3, 27, 5, GETUTCDATE()),  -- Vaathi Raid
(3, 29, 6, GETUTCDATE());  -- Arabic Kuthu

-- Love Songs Tamil (Playlist 4)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(4, 1, 1, GETUTCDATE()),   -- Vaseegara
(4, 2, 2, GETUTCDATE()),   -- Munbe Vaa
(4, 7, 3, GETUTCDATE()),   -- Nilave Vaa
(4, 15, 4, GETUTCDATE()),  -- Kannazhaga
(4, 21, 5, GETUTCDATE()),  -- Uyirin Uyire
(4, 22, 6, GETUTCDATE());  -- Suttum Vizhi

-- Thalapathy Special (Playlist 5)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(5, 13, 1, GETUTCDATE()),  -- Marana Mass
(5, 14, 2, GETUTCDATE()),  -- Vaathi Coming
(5, 27, 3, GETUTCDATE()),  -- Vaathi Raid
(5, 29, 4, GETUTCDATE()),  -- Arabic Kuthu
(5, 21, 5, GETUTCDATE());  -- Uyirin Uyire

-- Anirudh Kuthu (Playlist 6)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(6, 11, 1, GETUTCDATE()),  -- Why This Kolaveri Di
(6, 12, 2, GETUTCDATE()),  -- Thangamey
(6, 13, 3, GETUTCDATE()),  -- Marana Mass
(6, 14, 4, GETUTCDATE()),  -- Vaathi Coming
(6, 15, 5, GETUTCDATE()),  -- Kannazhaga
(6, 27, 6, GETUTCDATE()),  -- Vaathi Raid
(6, 29, 7, GETUTCDATE());  -- Arabic Kuthu

-- Party Tamil Songs (Playlist 7)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(7, 11, 1, GETUTCDATE()),  -- Why This Kolaveri Di
(7, 26, 2, GETUTCDATE()),  -- Rowdy Baby
(7, 28, 3, GETUTCDATE()),  -- Enjoy Enjaami
(7, 29, 4, GETUTCDATE()),  -- Arabic Kuthu
(7, 14, 5, GETUTCDATE());  -- Vaathi Coming

-- Ilayaraja Gems (Playlist 11)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(11, 6, 1, GETUTCDATE()),  -- Poo Maalaye
(11, 7, 2, GETUTCDATE()),  -- Nilave Vaa
(11, 8, 3, GETUTCDATE()),  -- Mannil Indha Kaadhal
(11, 9, 4, GETUTCDATE()),  -- Sundari Kannal
(11, 10, 5, GETUTCDATE()); -- Kadhal Rojave

-- Tamil Folk Songs (Playlist 14)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(14, 36, 1, GETUTCDATE()), -- Otha Sollaala
(14, 37, 2, GETUTCDATE()), -- Azhagiya Soodana Poovey
(14, 38, 3, GETUTCDATE()), -- Kalakka Povathu Yaaru
(14, 39, 4, GETUTCDATE()), -- Senjitaley
(14, 40, 5, GETUTCDATE()); -- Kannamma

-- Morning Devotional (Playlist 10)
INSERT INTO PlaylistSongs (PlaylistId, SongId, [Order], AddedAt) VALUES
(10, 33, 1, GETUTCDATE()), -- Kandha Sasti Kavasam
(10, 34, 2, GETUTCDATE()), -- Om Namah Shivaya
(10, 35, 3, GETUTCDATE()), -- Vinayagar Agaval
(10, 31, 4, GETUTCDATE()); -- Vetri Kodi Kattu

GO

-- ============================================
-- 5. INSERT LIKED SONGS (விருப்பமான பாடல்கள்)
-- ============================================

-- User 1 (rajini_fan) liked songs
INSERT INTO LikedSongs (UserId, SongId, LikedAt) VALUES
(1, 1, GETUTCDATE()),   -- Vaseegara
(1, 3, GETUTCDATE()),   -- Uyire Uyire
(1, 9, GETUTCDATE()),   -- Sundari Kannal
(1, 13, GETUTCDATE()),  -- Marana Mass
(1, 31, GETUTCDATE()),  -- Vetri Kodi Kattu
(1, 2, GETUTCDATE()),   -- Munbe Vaa
(1, 10, GETUTCDATE());  -- Kadhal Rojave

-- User 2 (vijay_lover) liked songs
INSERT INTO LikedSongs (UserId, SongId, LikedAt) VALUES
(2, 11, GETUTCDATE()),  -- Why This Kolaveri Di
(2, 13, GETUTCDATE()),  -- Marana Mass
(2, 14, GETUTCDATE()),  -- Vaathi Coming
(2, 26, GETUTCDATE()),  -- Rowdy Baby
(2, 27, GETUTCDATE()),  -- Vaathi Raid
(2, 29, GETUTCDATE());  -- Arabic Kuthu

-- User 3 (ar_rahman_fan) liked songs
INSERT INTO LikedSongs (UserId, SongId, LikedAt) VALUES
(3, 1, GETUTCDATE()),   -- Vaseegara
(3, 2, GETUTCDATE()),   -- Munbe Vaa
(3, 3, GETUTCDATE()),   -- Uyire Uyire
(3, 4, GETUTCDATE()),   -- Snehithane
(3, 5, GETUTCDATE()),   -- Enna Solla Pogirai
(3, 10, GETUTCDATE()),  -- Kadhal Rojave
(3, 33, GETUTCDATE()),  -- Kandha Sasti Kavasam
(3, 34, GETUTCDATE());  -- Om Namah Shivaya

-- User 4 (ilayaraja_follower) liked songs
INSERT INTO LikedSongs (UserId, SongId, LikedAt) VALUES
(4, 6, GETUTCDATE()),   -- Poo Maalaye
(4, 7, GETUTCDATE()),   -- Nilave Vaa
(4, 8, GETUTCDATE()),   -- Mannil Indha Kaadhal
(4, 9, GETUTCDATE()),   -- Sundari Kannal
(4, 10, GETUTCDATE()),  -- Kadhal Rojave
(4, 31, GETUTCDATE());  -- Vetri Kodi Kattu

-- User 5 (tamil_music_lover) liked songs
INSERT INTO LikedSongs (UserId, SongId, LikedAt) VALUES
(5, 28, GETUTCDATE()),  -- Enjoy Enjaami
(5, 30, GETUTCDATE()),  -- Kaattu Payale
(5, 36, GETUTCDATE()),  -- Otha Sollaala
(5, 37, GETUTCDATE()),  -- Azhagiya Soodana Poovey
(5, 39, GETUTCDATE()),  -- Senjitaley
(5, 40, GETUTCDATE()),  -- Kannamma
(5, 11, GETUTCDATE()),  -- Why This Kolaveri Di
(5, 26, GETUTCDATE());  -- Rowdy Baby

GO

-- ============================================
-- 6. VERIFICATION QUERIES (சரிபார்த்தல்)
-- ============================================

PRINT '===============================================';
PRINT 'தமிழ் பாடல்கள் தரவுத்தளம் - Tamil Songs Database';
PRINT '===============================================';
PRINT '';

-- Check inserted data counts
SELECT 'Users (பயனர்கள்)' AS TableName, COUNT(*) AS RecordCount FROM Users
UNION ALL
SELECT 'Songs (பாடல்கள்)', COUNT(*) FROM Songs
UNION ALL
SELECT 'Playlists (பிளேலிஸ்ட்)', COUNT(*) FROM Playlists
UNION ALL
SELECT 'PlaylistSongs', COUNT(*) FROM PlaylistSongs
UNION ALL
SELECT 'LikedSongs (விருப்ப பாடல்கள்)', COUNT(*) FROM LikedSongs;

GO

PRINT '';
PRINT '===============================================';
PRINT 'AR Rahman Songs List';
PRINT '===============================================';

-- List all AR Rahman songs
SELECT 
    s.Id,
    s.Title AS 'Song Name',
    s.Artist,
    s.Album,
    CAST(s.Duration / 60 AS VARCHAR) + ':' + 
    RIGHT('0' + CAST(s.Duration % 60 AS VARCHAR), 2) AS 'Duration (mm:ss)'
FROM Songs s
WHERE s.Artist LIKE '%AR Rahman%'
ORDER BY s.Id;

GO

PRINT '';
PRINT '===============================================';
PRINT 'Most Popular Songs (அதிகம் விரும்பப்பட்ட பாடல்கள்)';
PRINT '===============================================';

-- Get popular songs (most liked)
SELECT TOP 10
    s.Title AS 'Song Name',
    s.Artist,
    s.Album,
    COUNT(ls.UserId) AS 'Like Count'
FROM Songs s
LEFT JOIN LikedSongs ls ON s.Id = ls.SongId
GROUP BY s.Title, s.Artist, s.Album
ORDER BY COUNT(ls.UserId) DESC;

GO

PRINT '';
PRINT '===============================================';
PRINT 'Sample Playlist: AR Rahman Melodies';
PRINT '===============================================';

-- Get playlist with songs
SELECT 
    ps.[Order] AS '#',
    s.Title AS 'Song Name',
    s.Artist,
    s.Album
FROM Playlists p
INNER JOIN PlaylistSongs ps ON p.Id = ps.PlaylistId
INNER JOIN Songs s ON ps.SongId = s.Id
WHERE p.Name = 'AR Rahman Melodies'
ORDER BY ps.[Order];

GO

PRINT '';
PRINT '===============================================';
PRINT 'Songs by Music Director (இசையமைப்பாளர் வாரியாக)';
PRINT '===============================================';

SELECT 
    CASE 
        WHEN Artist LIKE '%AR Rahman%' THEN 'AR Rahman'
        WHEN Artist LIKE '%Ilayaraja%' OR Artist LIKE '%Ilaiyaraaja%' THEN 'Ilayaraja'
        WHEN Artist LIKE '%Aniru