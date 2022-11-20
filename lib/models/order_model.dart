import 'package:echom_frontend/models/product_model.dart';
import 'package:echom_frontend/models/user_model.dart';

class OrderModel {
  late int id;
  List<UserModel>? users;
  String? totalPrice;
  String? shippingPrice;
  String? status;
  String? payment;
  String? Address;
  List<ProductModel>? products;

  OrderModel({
    required this.id,
    this.users,
    this.totalPrice,
    this.shippingPrice,
    this.status,
    this.payment,
    this.Address,
    this.products,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    users = json['users_id']
        .map<UserModel>((user) => UserModel.fromJson(user))
        .toList();
    totalPrice = json['total_price'];
    shippingPrice = json['shipping_price'];
    status = json['status'];
    payment = json['payment'];
    Address = json['address'];
    products = json['products']
        .map<ProductModel>((product) => ProductModel.fromJson(product))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['users_id'] = users;
    data['total_price'] = totalPrice;
    data['shipping_price'] = shippingPrice;
    data['status'] = status;
    data['payment'] = payment;
    data['address'] = Address;
    data['products'] = products;
    return data;
  }
}
