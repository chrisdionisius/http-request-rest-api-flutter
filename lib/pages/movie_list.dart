import 'package:flutter/material.dart';
import 'package:flutter_rest_example/services/http_service.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies List"),
      ),
      body: ListView.builder(
          itemCount: moviesCount ?? 0,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                title: Text(movies![position].title),
                subtitle: Text("Rating = ${movies![position].voteAverage}"),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Text(movies![position].title[0]),
                ),
              ),
            );
          }),
    );
  }
}
