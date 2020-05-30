import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/movie.dart';
import '../widgets/favourite.dart';
import '../screens/single_movie_screen.dart';
import '../providers/auth.dart';

class MovieList extends StatelessWidget {
  final List<Movie> _movies;

  MovieList(this._movies);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 3.0, mainAxisSpacing: 3.0),
      itemCount: _movies.length,
      itemBuilder: (context, i) {
        Movie movie = _movies[i];

        return GestureDetector(
          child: GridTile(
            child: Image.network(
              movie.imgUrl,
              fit: BoxFit.cover,
            ),
            header: Align(
              alignment: Alignment.topRight,
              child: Consumer<Auth>(
                builder: (ctx, auth, _) => Favourite(movie.id, auth),
              ),
            ),
            footer: Container(
              padding: EdgeInsets.all(5),
              color: Colors.black54.withOpacity(0.7),
              child: Text(
                "${movie.name}",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleMovieScreen(movie.id),
              ),
            );
          },
        );
      },
    );
  }
}