import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import './single_movie_screen.dart';
import '../services/genre_service.dart';
import '../services/movie_service.dart';
import '../models/movie.dart';
import '../widgets/favourite.dart';

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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 3.0, mainAxisSpacing: 3.0),
      itemCount: movies.length,
      itemBuilder: (context, i) {
        Movie movie = movies[i];

        return GestureDetector(
          child: GridTile(
            child: Image.network(
              movie.imgUrl,
              fit: BoxFit.cover,
            ),
            header: Align(
              alignment: Alignment.topRight,
              child: Favourite(movie.id),
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

