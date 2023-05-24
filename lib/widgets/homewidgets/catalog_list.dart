import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';
import 'package:flutter_application_1/modules/catalog.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:flutter_application_1/widgets/homewidgets/ad_tocart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatefulWidget {
  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  List<Item> filteredCatalog = CatalogModel.items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              filteredCatalog = CatalogModel.items
                  .where((item) =>
                      item.name.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(),
            ),
            labelText: 'Search',
            suffixIcon: Icon(Icons.search),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: filteredCatalog.length,
            itemBuilder: (context, index) {
              final catalog = filteredCatalog[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          ),
        ),
      ],
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
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
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
                    AddToCart(catalog: catalog),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ).white.roundedLg.square(150).make().py(16);
  }
}
