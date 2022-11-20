import 'package:echom_frontend/providers/auth_provider.dart';
import 'package:echom_frontend/providers/order_provider.dart';
import 'package:echom_frontend/theme.dart';
import 'package:echom_frontend/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late OrderProvider orderProvider;

  Widget EmptyOrder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.local_shipping_outlined, size: 80, color: primaryColor),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Opss! Transaksi kamu kosong',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Ayo temukan kebutuhan barangmu',
            style: secondaryTextStyle,
          ),
          Container(
            width: 154,
            height: 44,
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Ayo Belanja',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      itemCount: orderProvider.responseOrderModel?.data?.data?.length ?? 0,
      itemBuilder: (context, index) {
        return OrderCard(
          // orderProvider.responseOrderModel!.data!.data![index],
          order: orderProvider.responseOrderModel!.data!.data![index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    orderProvider = Provider.of<OrderProvider>(context);

    // call getOrders() from order_provider.dart
    orderProvider.getOrders(authProvider.user.token!);

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: const Text('Your Order'),
        elevation: 0,
      ),
      body: orderProvider.responseOrderModel?.data?.data?.length == 0
          ? EmptyOrder()
          : content(),
    );
  }
}
