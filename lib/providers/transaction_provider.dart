import 'package:echom_frontend/models/cart_model.dart';
import 'package:echom_frontend/services/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      await TransactionService().checkout(token, carts, totalPrice);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
