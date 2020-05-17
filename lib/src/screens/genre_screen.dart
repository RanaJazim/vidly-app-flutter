import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../widgets/custom_drawer.dart';
import '../services/genre_service.dart';
import '../models/genre.dart';
import './movie_screen.dart';

class GenreScreen extends StatelessWidget {
  static const routeName = "/genre";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConfig.title),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: FutureBuilder(
        future: fetchAllGenres(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              print(dataSnapshot.error.toString());
              return Center(
                child: Text("An error occured"),
              );
            } else {
              return _buildGenres(context, dataSnapshot.data);
            }
          }
        },
      ),
    );
  }

  Widget _buildGenres(context, List<Genre> genres) {
    return ListView.builder(
      itemCount: genres.length,
      itemBuilder: (ctx, i) {
        var genre = genres[i];

        return Container(
          margin: EdgeInsets.only(top: 15),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.network(
                  "${genre.imgUrl}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text("${genre.name}"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieScreen(),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
