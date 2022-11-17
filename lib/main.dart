import 'package:echom_frontend/pages/cart_page.dart';
import 'package:echom_frontend/pages/checkout_success_page.dart';
import 'package:echom_frontend/pages/detail_chat_page.dart';
import 'package:echom_frontend/pages/edit_profile_page.dart';
import 'package:echom_frontend/pages/checkout_page.dart';
import 'package:echom_frontend/pages/home/main_page.dart';
import 'package:echom_frontend/pages/sign_in_page.dart';
import 'package:echom_frontend/pages/sign_up_page.dart';
import 'package:echom_frontend/pages/splash_page.dart';
import 'package:echom_frontend/providers/auth_provider.dart';
import 'package:echom_frontend/providers/cart_provider.dart';
import 'package:echom_frontend/providers/product_provider.dart';
import 'package:echom_frontend/providers/transaction_provider.dart';
import 'package:echom_frontend/services/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
