import 'package:http/http.dart' show get;
import 'dart:convert';

import '../config/app_config.dart';
import '../models/genre.dart';
export '../models/genre.dart';

final _baseUrl = AppConfig.baseURL;

Future<List<Genre>> fetchAllGenres() async {
  try {
    final response = await get("$_baseUrl/api/genres");
    final parsedData = json.decode(response.body) as List;

    final genres = parsedData.map((genre) => Genre.fromJson(genre)).toList();
    return genres;
  } catch (ex) {
    throw ex;
  }
}
