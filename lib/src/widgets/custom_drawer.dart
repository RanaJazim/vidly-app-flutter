import 'package:first_project/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/app_config.dart';
import '../screens/genre_screen.dart';
import '../screens/movie_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/home_screen.dart';
import '../screens/favourite_screen.dart';
import '../providers/auth.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: const Text(
              AppConfig.title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                HomeScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Genres'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                GenreScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                MovieScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Checkout'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                CheckoutScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favourites'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                FavouriteScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
