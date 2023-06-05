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
        "Categories                               "
            .text
            .xl3
            .bold
            .color(Color.fromARGB(255, 39, 3, 100))
            .make(),
        SizedBox(
          height: 20,
        ),
        Category(),
        SizedBox(
          height: 30,
        ),
        // Expanded(
        //   child: Container(
        //     color: Colors.red,
        //     margin: EdgeInsets.all(10.0),
        //     child: Column(
        //       children: [
        //         "Categories".text.xl3.align(TextAlign.start).make(),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.only(left: 8.0),
        //               child: Card(
        //                 color: Colors.white,
        //                 elevation: 13.0,
        //                 shape: RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(25.0),
        //                 ),
        //                 child: SizedBox(
        //                   height: 100,
        //                   width: 100,
        //                   child: Column(
        //                     children: [],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ).h20(context),
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

class Category extends StatelessWidget {
  const Category({Key? key});

  void navigateToCategoryPage(BuildContext context, String category) {
    // You can define your own logic to navigate to the respective category page
    if (category == 'Food') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoodPage()),
      );
    } else if (category == 'Clothing') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ClothingPage()),
      );
    } else if (category == 'Electronics') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ElectronicsPage()),
      );
    } else if (category == 'Shoes') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShoesPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category_items(
            imageLocation: 'assets/images/food.png',
            imageCaption: 'Food',
            onTap: () => navigateToCategoryPage(context, 'Food'),
          ),
          Category_items(
            imageLocation: 'assets/images/clothes.png',
            imageCaption: 'Clothing',
            onTap: () => navigateToCategoryPage(context, 'Clothing'),
          ),
          Category_items(
            imageLocation: 'assets/images/electronics.png',
            imageCaption: 'Electronics',
            onTap: () => navigateToCategoryPage(context, 'Electronics'),
          ),
          Category_items(
            imageLocation: 'assets/images/shoes.png',
            imageCaption: 'Shoes',
            onTap: () => navigateToCategoryPage(context, 'Shoes'),
          ),
        ],
      ),
    );
  }
}

class Category_items extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  final VoidCallback onTap;

  Category_items({
    required this.imageLocation,
    required this.imageCaption,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(imageLocation, height: 100.0, width: 100.0),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: imageCaption.text.make(),
            ),
          ),
        ),
      ),
    );
  }
}

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List<Item> filteredCatalog = CatalogModel.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add Scaffold as the parent widget
      appBar: AppBar(
        title: Text('Food'), // Set the title of the app bar
      ),
      body: Column(
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredCatalog.length,
              itemBuilder: (context, index) {
                final catalog = filteredCatalog[index];

                // Filter the catalog items based on the category "Tech"
                if (catalog.category == "Food") {
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
                } else {
                  // Return an empty container for items not belonging to the "Tech" category
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ClothingPage extends StatefulWidget {
  const ClothingPage({super.key});

  @override
  State<ClothingPage> createState() => _ClothingPageState();
}

class _ClothingPageState extends State<ClothingPage> {
  List<Item> filteredCatalog = CatalogModel.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add Scaffold as the parent widget
      appBar: AppBar(
        title: Text('Clothing'), // Set the title of the app bar
      ),
      body: Column(
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredCatalog.length,
              itemBuilder: (context, index) {
                final catalog = filteredCatalog[index];

                // Filter the catalog items based on the category "Tech"
                if (catalog.category == "Cloth") {
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
                } else {
                  // Return an empty container for items not belonging to the "Tech" category
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ElectronicsPage extends StatefulWidget {
  const ElectronicsPage({Key? key}) : super(key: key);

  @override
  State<ElectronicsPage> createState() => _ElectronicsPageState();
}

class _ElectronicsPageState extends State<ElectronicsPage> {
  List<Item> filteredCatalog = CatalogModel.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add Scaffold as the parent widget
      appBar: AppBar(
        title: Text('Electronics'), // Set the title of the app bar
      ),
      body: Column(
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredCatalog.length,
              itemBuilder: (context, index) {
                final catalog = filteredCatalog[index];

                // Filter the catalog items based on the category "Tech"
                if (catalog.category == "Tech") {
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
                } else {
                  // Return an empty container for items not belonging to the "Tech" category
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ShoesPage extends StatefulWidget {
  const ShoesPage({super.key});

  @override
  State<ShoesPage> createState() => _ShoesPageState();
}

class _ShoesPageState extends State<ShoesPage> {
  List<Item> filteredCatalog = CatalogModel.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add Scaffold as the parent widget
      appBar: AppBar(
        title: Text('Shoes'), // Set the title of the app bar
      ),
      body: Column(
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
              labelText: 'Shoes',
              suffixIcon: Icon(Icons.search),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredCatalog.length,
              itemBuilder: (context, index) {
                final catalog = filteredCatalog[index];

                // Filter the catalog items based on the category "Tech"
                if (catalog.category == "Shoes") {
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
                } else {
                  // Return an empty container for items not belonging to the "Tech" category
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
