import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  final String _id;

  Favourite(this._id);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: Colors.red,
        size: 25,
      ),
      onPressed: () {},
    );
  }
}
