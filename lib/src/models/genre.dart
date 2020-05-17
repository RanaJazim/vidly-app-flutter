class Genre {
  final String id;
  final String name;
  final String imgUrl;

  Genre.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['_id'],
      name = parsedJson['name'],
      imgUrl = parsedJson['imgUrl'];
}