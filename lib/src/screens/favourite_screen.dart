import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_drawer.dart';
import '../providers/auth.dart';
import '../models/movie.dart';
import '../widgets/movies_list.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = "/favourite";

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Movies'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Container(
        margin: EdgeInsets.only(top: 10, left: 5, right: 5),
        child: FutureBuilder(
          future: auth.getFavMovies(),
          builder: (ctx, AsyncSnapshot<List<Movie>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: const Text(
                      "Something wrong. Please Check your Internet connection"),
                );
              } else {
                return MovieList(snapshot.data);
              }
            }
          },
        ),
      ),
    );
  }
}
