import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import '../services/genre_service.dart';
import '../services/movie_service.dart';
import '../models/movie.dart';
import '../widgets/movies_list.dart';

class MovieScreen extends StatefulWidget {
  static const routeName = '/movie';

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  var _selectedGenre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        centerTitle: true,
        actions: <Widget>[
          _popMenu(),
        ],
      ),
      drawer: CustomDrawer(),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: FutureBuilder(
          future: fetchMovies("$_selectedGenre"),
          builder: (ctx, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return _buildMovies(snapshot.data);
            }
          },
        ),
      ),
    );
  }

  Widget _buildMovies(List<Movie> movies) {
    return MovieList(movies);
  }

  Widget _popMenu() {
    return FutureBuilder(
      future: fetchAllGenres(),
      builder: (ctx, AsyncSnapshot<List<Genre>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          return PopupMenuButton(
            onSelected: (String genreId) {
              setState(() {
                _selectedGenre = genreId;
              });
            },
            itemBuilder: (ctx) => snapshot.data
                .map(
                  (genre) => PopupMenuItem(
                    value: genre.id,
                    child: Text('${genre.name}'),
                  ),
                )
                .toList(),
          );
        }
      },
    );
  }
}

