import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../modules/cart.dart';
import '../../modules/catalog.dart';
import '../themes.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = false;
    var cupertinoIcons;
    return ElevatedButton(
      onPressed: () {
        // if (!isInCart) {
        isInCart = isInCart.toggle();
        final _catalog = CatalogModel();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: "Product Added To Cart ".text.make()));
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      // },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(MyTheme.darkColor),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isInCart == true
          ? Icon(Icons.done)
          : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
