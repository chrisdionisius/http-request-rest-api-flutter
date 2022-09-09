import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../services/http_service.dart';

class UpcomingMovies extends StatefulWidget {
  const UpcomingMovies({Key? key}) : super(key: key);

  @override
  State<UpcomingMovies> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies> {
  List? upcomingMovies;
  int? moviesCount;
  HttpService service = HttpService();

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future initialize() async {
    upcomingMovies = [];
    upcomingMovies = await service.getUpcomingMovies();
    setState(() {
      moviesCount = upcomingMovies!.length;
      upcomingMovies = upcomingMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: upcomingMovies!.map((movie) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(5.0),
                  color: Colors.black.withOpacity(0.3),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.black26,
                            offset: Offset(10, 5),
                            blurRadius: 5),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
