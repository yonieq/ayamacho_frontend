import 'package:echom_frontend/models/product_model.dart';
import 'package:echom_frontend/services/product_service.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
      // print('ini dari provider{$_products}');
    } catch (e) {
      print(e);
    }
  }
}
