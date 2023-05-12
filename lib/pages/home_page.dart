import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

import '../modules/catalog.dart';
import '../widgets/item_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  final int days = 30;
  // const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
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
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
