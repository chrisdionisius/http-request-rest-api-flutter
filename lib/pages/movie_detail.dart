import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imageUrl = 'https://image.tmdb.org/t/p/w500';

  const MovieDetail(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(imageUrl + movie.posterPath!),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(movie.overview!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
