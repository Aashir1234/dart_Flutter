import 'dart:convert';

class CatalogModel {
  static final catModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catModel;
  static List<Item> items = [
    Item(
        id: 2,
        name: "Pixel 5",
        desc: "Google Pixel phone 5th generation",
        price: 699,
        color: "#00ac51",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402144-smartphones-google-pixel-5-10017137.png"),
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402432-smartphones-apple-iphone-12-pro-10016492.png"),
    Item(
        id: 3,
        name: "M1 Macbook Air",
        desc: "Apple Macbook air with apple silicon",
        price: 1099,
        color: "#e0bfae",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402647-12-to-13-inch-laptops-apple-macbook-air-13-inch-2021-m1-10017732.png"),
    Item(
        id: 5,
        name: "Airpods Pro",
        desc: "Apple Aipods Pro 1st generation",
        price: 200,
        color: "#e3e4e9",
        image:
            "https://crdms.images.consumerreports.org/c_lfill,w_598/prod/products/cr/models/400116-wireless-portable-headphones-apple-airpods-pro-10009323.png"),
    Item(
        id: 6,
        name: "iPad Pro",
        desc: "Apple iPad Pro 2020 edition",
        price: 799,
        color: "#f73984",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/403999-9-inch-screen-and-larger-tablets-mobile-data-wifi-apple-ipad-pro-11-128g-2021-10020945.png"),
    Item(
        id: 7,
        name: "Galaxy S21 Ultra",
        desc: "Samsung Galaxy S21 Ultra 2021 edition",
        price: 1299,
        color: "#1c1c1c",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402950-smartphones-samsung-galaxy-s21-ultra-5g-10018566.png"),
    Item(
        id: 8,
        name: "Galaxy S21",
        desc: "Samsung Galaxy S21 2021 edition",
        price: 899,
        color: "#7c95eb",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402949-smartphones-samsung-galaxy-s21-5g-10018427.png")
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
