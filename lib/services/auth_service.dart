import 'dart:convert';

import 'package:echom_frontend/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://172.12.17.100:8000/api';

  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
    String? alamat,
  }) async {
    var url = Uri.parse("$baseUrl/register");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'alamat': alamat,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = Uri.parse("$baseUrl/login");
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Failed to login');
    }
  }
}
