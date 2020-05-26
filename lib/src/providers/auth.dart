import 'dart:convert';
import 'package:flutter/material.dart';

import '../services/user_service.dart';
import '../config/local_storage.dart';

class Auth extends ChangeNotifier {
  String _id;
  String _name;
  String _email;
  String _token;
  final _userService = UserService();
  final _localStorage = LocalStorage();

  void _setUserAttr(Map<String, dynamic> user) {
    this._id = user['_id'];
    this._name = user['name'];
    this._email = user['email'];
    this._token = user['token'];
  }

  bool get isAuth {
    return _token != null;
  }

  Future<bool> autoLogin() async {
    bool userExist = await _localStorage.isUserExist();

    if (!userExist) return false;

    // getting user from storage and save into our auth attributes
    final user = await _localStorage.getUser();
    _setUserAttr(user);

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

  logout() {
    final logoutUser = {
      '_id': null,
      'name': null,
      'email': null,
      'token': null,
    };
    _setUserAttr(logoutUser);

    notifyListeners();

    // removing user from local storage
    _localStorage.removeUser();
  }

}