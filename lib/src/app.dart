import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/genre_screen.dart';
import './screens/movie_screen.dart';
import './screens/checkout_screen.dart';
import './screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ecommerece App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffef6c00),
      ),
      home: LoginScreen(),
    );
  }
}

// home: HomeScreen(),
//       routes: {
//         GenreScreen.routeName: (context) => GenreScreen(),
//         MovieScreen.routeName: (context) => MovieScreen(),
//         CheckoutScreen.routeName: (context) => CheckoutScreen(),
//       },