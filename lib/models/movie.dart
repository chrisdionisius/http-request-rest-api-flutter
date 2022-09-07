class Movie {
  int? id;
  String? title;
  String? posterPath;
  String? overview;
  double? voteAverage;
  Movie({
    this.id,
    this.title,
    this.posterPath,
    this.overview,
    this.voteAverage,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    posterPath = json['poster_path'];
    overview = json['overview'];
    voteAverage = json['vote_average'].toDouble();
  }
}
