class Song {
  final String title;
  final String artist;
  final String album;
  final String comment;
  final String? cover;
  final int year;

  Song({
    this.cover,
    required this.title,
    required this.artist,
    required this.album,
    required this.comment,
    required this.year,
  });
}
