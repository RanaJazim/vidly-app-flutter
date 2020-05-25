import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './screens/genre_screen.dart';
import './screens/movie_screen.dart';
import './screens/checkout_screen.dart';
import './screens/login_screen.dart';
import './providers/auth.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Auth(),
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: "Ecommerece App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Color(0xffef6c00),
          ),
          home: auth.isAuthenticated() ? HomeScreen() : LoginScreen(),
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            GenreScreen.routeName: (context) => GenreScreen(),
            MovieScreen.routeName: (context) => MovieScreen(),
            CheckoutScreen.routeName: (context) => CheckoutScreen(),
          },
        ),
      ),
    );
  }
}

// home: HomeScreen(),
// routes: {
//   GenreScreen.routeName: (context) => GenreScreen(),
//   MovieScreen.routeName: (context) => MovieScreen(),
//   CheckoutScreen.routeName: (context) => CheckoutScreen(),
// },
