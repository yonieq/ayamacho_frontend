import 'dart:convert';

import 'package:echom_frontend/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://ayam.itjurnalis.com/api';

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

  Future<UserModel> updateProfile(
      {required String token,
      String? name,
      String? username,
      String? email,
      String? alamat}) async {
    var url = Uri.parse("$baseUrl/user");
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      //
      'name': name,
      'username': username,
      'email': email,
      'alamat': alamat,
    });

    var response = await http.post(
      url,
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to update profile');
    }
  }
}
