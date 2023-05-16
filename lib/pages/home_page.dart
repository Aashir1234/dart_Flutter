import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'dart:convert'; //json encoder decoder library
import 'package:flutter/services.dart'; // jsan library used to load json file
import '../modules/catalog.dart';
import '../widgets/item_widget.dart';
import "package:velocity_x/velocity_x.dart";

import '../widgets/themes.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata(); //function decleration
  }

  loaddata() async {
    final productsjson =
        await rootBundle.loadString("assets/files/products.json");
    final decodeddata = jsonDecode(productsjson);
    var productsData = decodeddata["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromJson(item))
        .toList();
    setState(() {});
  }

  // const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
        //component of widget related to html {header/body/flutter}
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
            child: Container(
                padding: Vx.m32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatalogeHeader(),
                    if (CatalogModel.items != null &&
                        CatalogModel.items.isNotEmpty)
                      CatalogList().expand()
                    else
                      Center(child: CircularProgressIndicator()),
                  ],
                ))));
// --------------------------------------------------------------------------------------
    //   appBar: AppBar(
    //     backgroundColor: Colors.white,
    //     elevation: 0.1,
    //     iconTheme: IconThemeData(color: Colors.black),
    //     title: Text(
    //       ' Ecommerece app',
    //       style: TextStyle(color: Colors.black),
    //     ),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
    //         ? GridView.builder(
    //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                 crossAxisCount: 2),
    //             itemBuilder: (context, index) {
    //               final item = CatalogModel.items[index];
    //               return Card(
    //                   // clipBehavior: Clip.antiAlias,
    //                   shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(15)),
    //                   child: GridTile(child: Image.network(item.image)));
    //             },
    //             itemCount: CatalogModel.items.length,
    //           )
    //         // ? ListView.builder(
    //         //     itemCount: CatalogModel.items.length,
    //         //     itemBuilder: (context, index) {
    //         //       return ItemWidget(
    //         //         item: CatalogModel.items[index],
    //         //       );
    //         //     },
    //         //   )
    //         : Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //   ),
    //   drawer: MyDrawer(),
    // -------------------------------------------------------------------------------------------------------
    // );
  }
}

class CatalogeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "DAA APP".text.xl5.bold.color(Color.fromARGB(255, 39, 3, 100)).make(),
        "Trending products".text.xl2.make(),
        " ".text.make()
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(
          image: catalog.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.darkColor),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      ),
                    ),
                    child: "Buy".text.make())
              ],
            )
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py(16);
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.roundedLg.p16.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
