class Movie {
  int? id;
  String? title;
  String? posterPath;
  String? overview;
  String? releaseDate;
  String? originalLanguage;
  double? voteAverage;
  Movie({
    this.id,
    this.title,
    this.posterPath,
    this.overview,
    this.voteAverage,
    this.originalLanguage,
    this.releaseDate,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    posterPath = json['poster_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    originalLanguage = json['original_language'];
    voteAverage = json['vote_average'].toDouble();
  }
}
