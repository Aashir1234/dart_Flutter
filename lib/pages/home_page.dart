import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'dart:convert'; //json encoder decoder library
import 'package:flutter/services.dart'; // jsan library used to load json file
import '../modules/catalog.dart';
import '../widgets/item_widget.dart';

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

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          ' Ecommerece app',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      // clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: GridTile(child: Image.network(item.image)));
                },
                itemCount: CatalogModel.items.length,
              )
            // ? ListView.builder(
            //     itemCount: CatalogModel.items.length,
            //     itemBuilder: (context, index) {
            //       return ItemWidget(
            //         item: CatalogModel.items[index],
            //       );
            //     },
            //   )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
