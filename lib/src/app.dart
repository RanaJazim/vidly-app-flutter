import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/genre_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecommerece App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffef6c00),
      ),
      home: HomeScreen(),
      routes: {
        GenreScreen.routeName: (context) => GenreScreen(),
      },
    );
  }
}