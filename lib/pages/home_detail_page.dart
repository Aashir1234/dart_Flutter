// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../modules/catalog.dart';
import '../widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            "\$${catalog.price}".text.bold.xl3.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkColor),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ),
      ),
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(
              catalog.image,
            ),
          ).p16(),
          Expanded(
            child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                  ],
                ).py64(),
              ),
            ),
          )
        ],
      )),
    );
  }
}
