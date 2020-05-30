import 'dart:convert';
import 'package:flutter/material.dart';

import '../services/user_service.dart';
import '../config/local_storage.dart';

class Auth extends ChangeNotifier {
  String _id;
  String _name;
  String _email;
  String _token;
  List<dynamic> _favourites = [];
  final _userService = UserService();
  final _localStorage = LocalStorage();

  void _setUserAttr(Map<String, dynamic> user) {
    _id = user['_id'];
    _name = user['name'];
    _email = user['email'];
    _token = user['token'];
    _favourites = user['favourites'];
  }

  bool get isAuth {
    return _token != null;
  }

  Future<bool> autoLogin() async {
    bool userExist = await _localStorage.isUserExist();

    if (userExist == false) return false;

    // getting user from storage and save into our auth attributes
    final user = await _localStorage.getUser();
    _setUserAttr(user);

    notifyListeners();
    return true;
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      return await _userService.register(name, email, password);
    }
    catch (ex) {
      throw ex;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final user = await _userService.login(email, password);
      _setUserAttr(user);
      notifyListeners();

      // adding user to local storage i.e inside mobile local storage
      await _localStorage.setUser(jsonEncode(user));
    }
    catch (ex) {
      throw ex;
    }
  }

  bool isFavourite(String movieId) {
    bool isExist = false;
    for (var fav in _favourites) {
      if (fav == movieId) {
        isExist = true;
        break;
      }
    }
    return isExist;
  }

  Future<void> toggleFavourite(String movieId) async {
    final movieIndex = _getIndexOfMovie(movieId);
    var isMovieRemove = false;
    if (_isMovieExist(movieIndex)) {
      _favourites.removeAt(movieIndex);
      isMovieRemove = true;
    } else {
      _favourites.add(movieId);
    }    
    notifyListeners();

    await _userService.toggleFavourites(_token, movieId, isMovieRemove);
  }

  Future<List<Movie>> getFavMovies() async {
    try {
      return await _userService.favourites(_token);
    } catch (ex) {
      throw ex;
    }
  }

  bool _isMovieExist(int mIndex) {
    return mIndex != -1 ? true : false;
  }

  int _getIndexOfMovie(String movieId) {
    return _favourites.indexWhere((favMovie) => favMovie == movieId);
  }



  Future<void> logout() async {
    final logoutUser = {
      '_id': null,
      'name': null,
      'email': null,
      'token': null,
      '_favourites': [],
    };
    _setUserAttr(logoutUser);

    notifyListeners();
    
    // removing user from local storage
    await _localStorage.removeUser();
  }

}