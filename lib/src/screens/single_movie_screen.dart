import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/movie_service.dart';

class SingleMovieScreen extends StatelessWidget {
  final String _id;

  SingleMovieScreen(this._id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Title'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchSingleMovie(_id),
        builder: (ctx, AsyncSnapshot<Movie> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: const Text('Something went wrong'));
            } else {
              return _buildMovie(ctx, snapshot.data);
            }
          }
        },
      ),
    );
  }

  Widget _buildMovie(context, Movie movie) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _header(context, movie),
          SizedBox(height: 30),
          _shortDescription(movie.description),
          SizedBox(height: 20),
          Expanded(child: _caste(movie.mainCaste)),
          SizedBox(height: 20),
          Expanded(child: _genres(movie.genres)),
        ],
      ),
    );
  }

  Widget _header(context, Movie movie) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 3,
          child: Image.network(
            movie.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${movie.name}', overflow: TextOverflow.ellipsis),
              SizedBox(height: 20),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _shortDescription(String description) {
    return Text("$description");
  }

  Widget _caste(List<dynamic> caste) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Main Caste',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: caste
              .map(
                (c) => Text(
                  '${c.toString()}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _genres(List<dynamic> genreList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Genres',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: genreList
              .map(
                (g) => Text(
                  "${g["name"]}",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

