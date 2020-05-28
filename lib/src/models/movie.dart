class Movie {
  final String id;
  final String name;
  final String imgUrl;
  final int price;
  final int stockLength;
  final List<dynamic> genreIds;
  final List<dynamic> mainCaste;

  Movie.fromMap(Map<String, dynamic> parsedData)
    : id = parsedData['_id'],
      name = parsedData['name'],
      imgUrl = parsedData['imgUrl'],
      price = parsedData['pricePerMovie'],
      stockLength = parsedData['noInStocks'],
      genreIds = parsedData['genres'],
      mainCaste = parsedData['mainCaste'];
}