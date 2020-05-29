import 'dart:convert';
import 'package:http/http.dart' show get;

import '../config/app_config.dart';
import '../models/movie.dart';

final _baseURL = AppConfig.baseURL;

Future<List<Movie>> fetchMovies(String genreId) async {
  try {
    final queryParam = genreId.isEmpty ? "" : "?genreId=$genreId";
    final res = await get("$_baseURL/api/movies$queryParam");

    final parsedData = jsonDecode(res.body) as List;
    final movies = parsedData.map((m) => Movie.fromMap(m)).toList();

    return movies;
  } catch (ex) {
    print(ex);
    throw ex;
  }
}

Future<Movie> fetchSingleMovie(String movieId) async {
  try {
    final res = await get("$_baseURL/api/movies/$movieId");
    final parsedData = jsonDecode(res.body);

    final movie = Movie.fromMap(parsedData);
    return movie;
  } catch (ex) {
    throw ex;
  }
}
