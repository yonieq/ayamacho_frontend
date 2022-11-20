import 'package:echom_frontend/models/cart_model.dart';
import 'package:echom_frontend/services/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  Future<bool> checkout(
      {required String token,
      required List<CartModel> carts,
      required double totalPrice,
      required BuildContext context}) async {
    try {
      await TransactionService(context: context)
          .checkout(token, carts, totalPrice);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
