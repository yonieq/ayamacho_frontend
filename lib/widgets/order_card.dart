import 'package:echom_frontend/models/order_model.dart';
import 'package:echom_frontend/models/response_order_model/datum.dart';
import 'package:echom_frontend/providers/auth_provider.dart';
import 'package:echom_frontend/providers/order_provider.dart';
import 'package:echom_frontend/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:echom_frontend/theme.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatelessWidget {
  final Datum order;
  const OrderCard({Key? key, required this.order}) : super(key: key);

  // const OrderCard(
  //   this.transaction,
  // );

  @override
  Widget build(BuildContext context) {
    // get data from provider
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${authProvider.user.name}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Total Harga : ${order.totalPrice}',
                      style: subtitleTextStyle,
                    ),
                    Text(
                      'Ongkir : ${order.shippingPrice}',
                      style: subtitleTextStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Status : ${order.status}',
                      style: priceTextStyle,
                    ),
                    Text(
                      'Pembayaran : ${order.payment}',
                      style: primaryTextStyle,
                    ),
                    Text(
                      'Catatan : ${order.catatan}',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
