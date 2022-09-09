import 'package:flutter/material.dart';
import 'package:flutter_rest_example/services/http_service.dart';
import 'package:flutter_rest_example/widgets/movie_card.dart';

import '../pages/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List? movies;
  int? moviesCount;
  HttpService service = HttpService();

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies!.length;
      movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: moviesCount ?? 0,
      itemBuilder: (context, int position) {
        return InkWell(
          child: MovieCard(movie: movies![position]),
          onTap: () {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (_) => MovieDetail(movies![position]),
            );
            Navigator.push(context, route);
          },
        );
      },
    );
  }
}
