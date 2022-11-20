// import 'package:echom_frontend/models/order_model.dart';
import 'package:echom_frontend/models/response_order_model/response_order_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OrderService {
  String baseUrl = 'https://ayam.itjurnalis.com/api';

  Future<ResponseOrderModel> getOrders(String token) async {
    var url = Uri.parse("$baseUrl/transactions");

    var headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token',
      // get token auth from auth provider
      'Authorization': token,
    };

    var response = await http.get(url, headers: headers);

    // print(response.body);

    if (response.statusCode == 200) {
      // print(url);
      // print(response.body);
      // print(response.body);
      return ResponseOrderModel.fromJson(jsonDecode(response.body));
      // List data = jsonDecode(response.body)['data']['data'];
      // List<OrderModel> oders = [];

      // for (var item in data) {
      //   oders.add(OrderModel.fromJson(item));
      // }
      // print(oders);
      // return oders;
    } else {
      throw Exception('Failed to load transactions');
    }
  }
}
