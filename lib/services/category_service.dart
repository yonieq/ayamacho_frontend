import 'dart:convert';
import 'package:echom_frontend/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  String baseUrl = 'https://ayam.itjurnalis.com/api';

  Future<List<CategoryModel>> getCategories() async {
    var url = Uri.parse("$baseUrl/categories");

    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    // enter your code here
    // print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<CategoryModel> categories = [];

      for (var item in data) {
        categories.add(CategoryModel.fromJson(item));
      }
      // print(categories);
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
