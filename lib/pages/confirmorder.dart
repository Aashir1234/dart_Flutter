import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import '../modules/cart.dart';
import '../widgets/themes.dart';

class Confirmorder extends StatelessWidget {
  final cart = CartModel();
  final date = DateFormat.yMd().format(DateTime.now());
  final time = DateFormat.jm().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "your Order is Confirmed ".text.bold.xl3.make().p20(),
          "".text.make(),
          Image.network('https://img.icons8.com/?size=512&id=63262&format=png')
              .h15(context),
          "".text.make(),
          "To Pay :                 \$${cart.totalPrice}"
              .text
              .xl2
              .color(Color.fromARGB(187, 0, 0, 0))
              .make()
              .p8(),
          "".text.make().p8(),
          "Order Date :                                                                 $date"
              .text
              .textStyle(context.captionStyle)
              .make(),
          "Order Time :                                                                      $time"
              .text
              .textStyle(context.captionStyle)
              .make(),
          "".text.make(),
          "Hey Dear, ThankYou for Placing Order at Placeit! Our Delivery Partner will reach you sortly in given time period. "
              .text
              .textStyle(context.captionStyle)
              .make()
              .px64(),
          "".text.make().p8(),
          ElevatedButton(
            child: "Explore More".text.make(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homepage()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyTheme.darkColor),
              shape: MaterialStateProperty.all(
                StadiumBorder(),
              ),
            ),
          ).h8(context)
        ],
      ).w20(context),
    );
  }
}
