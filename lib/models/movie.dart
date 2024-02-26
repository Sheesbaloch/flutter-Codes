class Movie {
  String title;
  String backdrop;
  String originalTitle;
  String overview;
  String releaseDate;
  String posterPath;
  double voteAverage;

  Movie(
      {required this.title,
      required this.backdrop,
      required this.originalTitle,
      required this.overview,
      required this.releaseDate,
      required this.posterPath,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'],
        backdrop: json['backdrop_path'],
        originalTitle: json["original_title"],
        overview: json['overview'],
        releaseDate: json['release_date'],
        posterPath: json['poster_path'],
        voteAverage: json['vote_average']);
  }
}
