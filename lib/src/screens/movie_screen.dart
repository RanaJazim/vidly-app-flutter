import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import './single_movie_screen.dart';
import '../services/genre_service.dart';

class MovieScreen extends StatelessWidget {
  static const routeName = '/movie';

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
        child: _buildMovies(),
      ),
    );
  }

  Widget _buildMovies() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 3.0, mainAxisSpacing: 3.0),
      itemCount: 30,
      itemBuilder: (context, i) {
        return GestureDetector(
          child: GridTile(
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
            footer: Container(
              padding: EdgeInsets.all(5),
              color: Colors.black54.withOpacity(0.7),
              child: Text(
                "title",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SingleMovieScreen(),
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
            onSelected: (_) {},
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

final img =
    "https://images.unsplash.com/photo-1579445710183-f9a816f5da05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60";
