import 'dart:convert';
import 'package:http/http.dart' show post;

import '../config/app_config.dart';

final _baseUrl = AppConfig.baseURL;

class UserService {
  Future<bool> register(String name, String email, String password) async {
    final _body = {'name': name, 'email': email, 'password': password};

    try {
      final response = await post("$_baseUrl/api/auth/register", body: _body);
      if (response.statusCode == 422) throw new Exception('Validation Error');
      return true;
    } catch (ex) {
      throw ex;
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final userData = {'email': email, 'password': password};

    try {
      final response = await post("$_baseUrl/api/auth/login", body: userData);

      if (response.statusCode == 422) throw new Exception('Validation Error');
      if (response.statusCode == 403)
        throw new Exception('Your email or password is incorrect');

      final decodedUser = jsonDecode(response.body) as Map<String, dynamic>;
      return decodedUser;
    } catch (ex) {
      throw ex;
    }
  }
}
