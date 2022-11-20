import 'package:echom_frontend/models/order_model.dart';
import 'package:echom_frontend/models/response_order_model/response_order_model.dart';
import 'package:echom_frontend/services/oder_service.dart';
import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
  // List<OrderModel> _orders = [];
  // List<OrderModel> get orders => _orders;

  // set orders(List<OrderModel> transactions) {
  //   _orders = transactions;
  //   notifyListeners();
  // }
  ResponseOrderModel? responseOrderModel;

  Future<void> getOrders(String token) async {
    try {
      responseOrderModel = await OrderService().getOrders(token);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
