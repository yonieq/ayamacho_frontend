import 'package:carousel_slider/carousel_slider.dart';
import 'package:echom_frontend/models/product_model.dart';
import 'package:echom_frontend/providers/cart_provider.dart';
import 'package:echom_frontend/services/wishlist_provider.dart';
import 'package:echom_frontend/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
  // ProductPage();
  final ProductModel product;
  ProductPage(this.product);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final _ratingController;
  late double _rating;

  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isVertical = false;
  IconData? _selectedIcon;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Horeeee ! :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Barang berhasil ditambahkan ke keranjang',
                    style: secondaryTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: Text(
                        'Lihat Keranjang',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : const Color(0xffC4C4C4),
        ),
      );
    }

    Widget familiarShoesCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(
          right: 16,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (() => Navigator.of(context).pop(context)),
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                GestureDetector(
                  onTap: (() => Navigator.pushNamed(context, '/cart')),
                  child: Icon(
                    Icons.shopping_bag,
                    color: backgroundColor1,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries!
                .map((image) => Image.network(
                      image.url!,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries!.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget _ratingBar(int mode) {
      return RatingBar.builder(
        initialRating: _initialRating,
        minRating: 1,
        direction: _isVertical ? Axis.vertical : Axis.horizontal,
        allowHalfRating: true,
        unratedColor: Colors.amber.withAlpha(50),
        itemCount: 5,
        itemSize: 30.0,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          _selectedIcon ?? Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          setState(() {
            _rating = rating;
          });
        },
        updateOnDrag: true,
      );
    }

    Widget content() {
      int index = -1;

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          children: [
            // NOTE: HEADER
            Container(
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.product.name}',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          '${widget.product.category!.name}',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product);
                      if (wishlistProvider.isWishlist(widget.product)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: const Text(
                              'Has been added to wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: const Text(
                              'Has been removed from wishlist',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(widget.product)
                          ? 'assets/button_wishlist_blue.png'
                          : 'assets/button_wishlist.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),

            // NOTE RATING BAR
            Padding(
              padding: EdgeInsets.all(30),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Rating',
                      style: primaryTextStyle,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    _ratingBar(_ratingBarMode),
                    SizedBox(height: 20.0),
                    Text(
                      'Rating: $_rating',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
              ),
            ),

            // NOTE: PRICE
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Harga',
                    style: primaryTextStyle,
                  ),
                  Text(
                    'Rp. ${widget.product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Keterangan',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${widget.product.description}',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Tentang Produk',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: defaultMargin,
                          ),
                          child: Row(
                            children: widget.product.galleries!.map((e) {
                              index++;
                              return Container(
                                margin: const EdgeInsets.only(right: 2),
                                child: Image.network(
                                  e.url!,
                                  width: 80,
                                  height: 80,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // NOTE: BUTTON
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail-chat');
                },
                child: Row(
                  children: [
                    // Container(
                    //   width: 54,
                    //   height: 54,
                    //   decoration: const BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage('assets/button_chat.png'),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 16,
                    // ),
                    Expanded(
                      child: Container(
                        height: 54,
                        child: TextButton(
                          onPressed: () {
                            cartProvider.addCart(widget.product);
                            showSuccessDialog();
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: primaryColor,
                          ),
                          child: Text(
                            'Tambahkan ke Keranjang',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor6,
        body: ListView(
          children: [
            header(),
            content(),
          ],
        ));
  }
}
