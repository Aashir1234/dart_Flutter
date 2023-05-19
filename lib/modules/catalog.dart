import 'dart:convert';

class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;
  static List<Item> items = [
    Item(
      id: 1233,
      name: "product1",
      desc: "product1 desc",
      price: 1000,
      color: "33505a",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkkVsRNVJ7O7xNGK7IXtRwchi4NsKzUUdPMMcmIdbDKH_x6DKXR2EQGWrBiM8KKga7Ey0&usqp=CAU",
    ),
  ];
  Item getbyid(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
  Item getByposition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
  factory Item.fromJson(Map<String, dynamic> map) {
    //decode and maping of json file
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'] as int,
      color: map['color'],
      image: map['image'],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
