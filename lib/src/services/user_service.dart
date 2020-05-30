import 'dart:convert';
import 'package:http/http.dart' show post, patch, get;

import '../config/app_config.dart';
import '../models/movie.dart';
export '../models/movie.dart';

final _baseUrl = AppConfig.baseURL;

class UserService {
  Future<bool> register(String name, String email, String password) async {
    final _body = {'name': name, 'email': email, 'password': password};

    try {
      final response = await post("$_baseUrl/api/auth/register", body: _body);
      if (response.statusCode == 422) throw new Exception('Validation Error');
      return true;
    } catch (ex) {
      throw ex;
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final userData = {'email': email, 'password': password};

    try {
      final response = await post("$_baseUrl/api/auth/login", body: userData);

      if (response.statusCode == 422) throw new Exception('Validation Error');
      if (response.statusCode == 403)
        throw new Exception('Your email or password is incorrect');

      final decodedUser = jsonDecode(response.body) as Map<String, dynamic>;
      return decodedUser;
    } catch (ex) {
      throw ex;
    }
  }

  Future<void> toggleFavourites(
      String token, String movieId, bool isRemove) async {
    final queryParam = isRemove ? "?is_remove=true" : "";
    final url = "$_baseUrl/api/auth/toggle-favourites$queryParam";
    final fav = {'movie_id': movieId};

    try {
      final res = await patch(
        url,
        headers: {'x-auth-token': token},
        body: fav,
      );

      if (res.statusCode == 401)
        throw new Exception('Some problems related to the token');
    } catch (ex) {
      throw ex;
    }
  }

  Future<List<Movie>> favourites(String token) async {
    try {
      final res = await get("$_baseUrl/api/auth/favourites",
          headers: {'x-auth-token': token});

      if (res.statusCode == 401)
        throw new Exception("Problems related to the token");

      final parsedData = jsonDecode(res.body) as List;
      final favMovies = parsedData.map((m) => Movie.fromMap(m)).toList();      

      return favMovies;
    } catch (ex) {
      throw ex;
    }
  }
}
