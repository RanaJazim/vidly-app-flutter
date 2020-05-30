import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class Favourite extends StatelessWidget {
  final String _id;
  final Color color;

  Favourite(this._id, {this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (ctx, auth, _) => IconButton(
        icon: _getAppropriateIcon(auth),
        onPressed: () async {
          await auth.toggleFavourite(_id);
        },
      ),
    );
  }

  Widget _getAppropriateIcon(Auth auth) {
    bool isFav = auth.isFavourite(_id);

    return Icon(
      isFav ? Icons.favorite : Icons.favorite_border,
      color: color,
      size: 25,
    );
  }
}
