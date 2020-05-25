import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../services/user_service.dart';
import '../config/local_storage.dart';

class Auth extends ChangeNotifier {
  String _id;
  String _name;
  String _email;
  String _token;

  void _setAttr(Map<String, dynamic> user) {
    this._id = user['_id'];
    this._name = user['name'];
    this._email = user['email'];
    this._token = user['token'];
  }

  bool isAuthenticated() {
    return this._token != null;
  }

  Future<bool> register(String name, String email, String password) async {
    try {
      return await signUp(name, email, password);
    }
    catch (ex) {
      throw ex;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final user = await signIn(email, password);
      _setAttr(user);
      notifyListeners();

      // adding user to local storage i.e inside mobile local storage
      final localStorage = LocalStorage();
      await localStorage.setUser(jsonEncode(user));
    }
    catch (ex) {
      throw ex;
    }
  }

}