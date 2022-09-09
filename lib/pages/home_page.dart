import 'package:flutter/material.dart';
import 'package:flutter_rest_example/widgets/movie_list.dart';

import '../widgets/upcoming_movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(35, 31, 30, 1),
      body: Column(
        children: const <Widget>[
          Expanded(
            flex: 1,
            child: UpcomingMovies(),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 450,
              child: MovieList(),
            ),
          ),
        ],
      ),
    );
  }
}
