import 'dart:convert';
import 'package:echom_frontend/models/cart_model.dart';
import 'package:echom_frontend/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class TransactionService {
  // AuthProvider authProvider = Provider.of<AuthProvider>(context);
  late AuthProvider authProvider;
  final BuildContext context;
  TransactionService({required this.context}) {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
  }
  // UserModel user = authProvider.user;
  // AuthProvider authProvider = Provider.of<AuthProvider>(context);

  String baseUrl = "https://ayam.itjurnalis.com/api";

  Future<bool> checkout(String token, List<CartModel> carts, double totalPrice,
      String catatan) async {
    var url = Uri.parse("$baseUrl/checkout");
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      //
      'address': authProvider.user.alamat,
      'items': carts
          .map(
            (cart) => {'id': cart.product!.id, 'quantity': cart.quantity},
          )
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 10000,
      'catatan': catatan,
    });

    var response = await http.post(
      url,
      headers: header,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to checkout');
    }
  }
}
