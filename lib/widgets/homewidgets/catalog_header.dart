import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Place-IT"
            .text
            .xl5
            .bold
            .color(Color.fromARGB(255, 39, 3, 100))
            .make()
            .centered(),
        "Trending products".text.xl2.make().centered(),
        // " ".text.make()
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
