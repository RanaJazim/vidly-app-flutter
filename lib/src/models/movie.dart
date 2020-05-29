class Movie {
  final String id;
  final String name;
  final String imgUrl;
  final int price;
  final int stockLength;
  final String description;
  final List<dynamic> genres;
  final List<dynamic> mainCaste;

  Movie.fromMap(Map<String, dynamic> parsedData)
    : id = parsedData['_id'],
      name = parsedData['name'],
      imgUrl = parsedData['imgUrl'],
      price = parsedData['pricePerMovie'],
      stockLength = parsedData['stockLength'],
      description = parsedData['description'],
      genres = parsedData['genres'],
      mainCaste = parsedData['mainCaste'];
}