import 'package:echom_frontend/providers/category_provider.dart';
import 'package:echom_frontend/providers/order_provider.dart';
import 'package:echom_frontend/providers/product_provider.dart';
import 'package:echom_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    // ignore: use_build_context_synchronously
    await Provider.of<CategoryProvider>(context, listen: false).getCategories();
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/sign-in',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor1,
        body: Center(
          child: Container(
            width: 130,
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hen.png'),
              ),
            ),
          ),
        ));
  }
}
