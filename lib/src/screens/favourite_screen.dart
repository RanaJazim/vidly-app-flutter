import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = "/favourite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
    );
  }
}