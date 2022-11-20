import 'package:echom_frontend/theme.dart';
import 'package:flutter/material.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage();

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Kamu telah melakukan transaksi',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Terima kasih telah berbelanja',
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 196,
              height: 44,
              margin: EdgeInsets.only(top: defaultMargin),
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
                  'Kembali ke Beranda',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: medium),
                ),
              ),
            ),
            Container(
              width: 196,
              height: 44,
              margin: const EdgeInsets.only(top: 12),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/transaction', (route) => false);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff39374B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Lihat Pesanan',
                  style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                      color: const Color(0xffB7B6BF)),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text(
          'Checkout Success',
        ),
        elevation: 0,
      ),
      body: content(),
    );
  }
}
