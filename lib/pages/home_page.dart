import 'package:flutter/material.dart';
// import 'package:flutter_application_1/widgets/drawer.dart';
import 'dart:convert'; //json encoder decoder library
import 'package:flutter/services.dart'; // jsan library used to load json file
import 'package:flutter_application_1/pages/cart_page.dart';
import '../modules/cart.dart';
import '../modules/catalog.dart';
// import '../widgets/item_widget.dart';
import "package:velocity_x/velocity_x.dart";
// import 'package:google_fonts/google_fonts.dart';
import '../widgets/themes.dart';
import '../widgets/homewidgets/catalog_header.dart';
import '../widgets/homewidgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
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

  // List<Map<String, dynamic>> _foundUsers = [];
  // @override
  // initState() async {
  //   _foundUsers = CatalogModel.items.cast<Map<String, dynamic>>();
  //   super.initState();
  //   //   super.initState();
  // }

  // const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
        //component of widget related to html {header/body/flutter}
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              )),
          backgroundColor: Color.fromARGB(255, 0, 50, 142),
          child: Icon(CupertinoIcons.cart),
        ).badge(color: Colors.red, size: 20),
        body: SafeArea(
            child: Container(
                padding: Vx.m32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TextField(
                    //   // onChanged: ((value) => ),
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //       borderSide: const BorderSide(),
                    //     ),
                    //     labelText: 'Search',
                    //     suffixIcon: Icon(Icons.search),
                    //   ),
                    // ),
                    CatalogeHeader(),
                    if (CatalogModel.items != null &&
                        CatalogModel.items.isNotEmpty)
                      CatalogList().expand()
                    else
                      CircularProgressIndicator().centered().py16().expand()
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
