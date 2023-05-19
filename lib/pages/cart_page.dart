import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../modules/cart.dart';
import '../widgets/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CarListState().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "\$${_cart.totalPrice}"
            .text
            .xl5
            .color(context.theme.accentColor)
            .make(),
        70.widthBox,
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying not supprted yet :( ".text.make()));
          },
          child: "Buy".text.make(),
        ).w32(context)
      ]),
    );
  }
}

class _CarListState extends StatefulWidget {
  const _CarListState({super.key});

  @override
  State<_CarListState> createState() => _CarListStateState();
}

class _CarListStateState extends State<_CarListState> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}
