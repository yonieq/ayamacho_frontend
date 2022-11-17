import 'dart:convert';
import 'package:echom_frontend/models/cart_model.dart';
import 'package:echom_frontend/models/product_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = "http://172.12.17.100:8000/api";

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = Uri.parse("$baseUrl/checkout");
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      'address': 'Talang',
      'items': carts
          .map(
            (cart) => {'id': cart.product!.id, 'quantity': cart.quantity},
          )
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 10000,
    });

    var response = await http.post(
      url,
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to checkout');
    }
  }
}
