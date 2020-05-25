import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<bool> setUser(String user) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', user);
  }

  Future<Map<String, dynamic>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final user = jsonDecode(prefs.get('user')) as Map<String, dynamic>;

    return user;
  }

  Future<bool> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove('user');
  }

}