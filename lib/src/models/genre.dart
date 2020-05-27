class Genre {
  final String id;
  final String name;

  Genre.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['_id'],
      name = parsedJson['name'];
}