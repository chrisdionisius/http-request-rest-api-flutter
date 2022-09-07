import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class HttpService {
  final String apiKey = '5ecf24d6520f5c59d4eac36a20176c5c';
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String imageUrl = 'https://image.tmdb.org/t/p/w500';
  final String popularMoviesUrl = '/movie/popular';

  Future<List?> getPopularMovies() async {
    final String uri = '$baseUrl$popularMoviesUrl?api_key=$apiKey';
    http.Response result = await http.get(Uri.parse(uri));

    if (result.statusCode == HttpStatus.ok) {
      if (kDebugMode) {
        print("Sukses");
      }
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      if (kDebugMode) {
        print("Gagal");
      }
      return null;
    }
  }
}
