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
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402144-smartphones-google-pixel-5-10017137.png",
        category: 'Tech'),
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402432-smartphones-apple-iphone-12-pro-10016492.png",
        category: 'Tech'),
    Item(
        id: 3,
        name: "M1 Macbook Air",
        desc: "Apple Macbook air with apple silicon",
        price: 1099,
        color: "#e0bfae",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402647-12-to-13-inch-laptops-apple-macbook-air-13-inch-2021-m1-10017732.png",
        category: 'Tech'),
    Item(
        id: 5,
        name: "Airpods Pro",
        desc: "Apple Aipods Pro 1st generation",
        price: 200,
        color: "#e3e4e9",
        image:
            "https://crdms.images.consumerreports.org/c_lfill,w_598/prod/products/cr/models/400116-wireless-portable-headphones-apple-airpods-pro-10009323.png",
        category: 'Tech'),
    Item(
        id: 6,
        name: "iPad Pro",
        desc: "Apple iPad Pro 2020 edition",
        price: 799,
        color: "#f73984",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/403999-9-inch-screen-and-larger-tablets-mobile-data-wifi-apple-ipad-pro-11-128g-2021-10020945.png",
        category: 'Tech'),
    Item(
        id: 7,
        name: "Galaxy S21 Ultra",
        desc: "Samsung Galaxy S21 Ultra 2021 edition",
        price: 1299,
        color: "#1c1c1c",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402950-smartphones-samsung-galaxy-s21-ultra-5g-10018566.png",
        category: 'Tech'),
    Item(
        id: 8,
        name: "Galaxy S21",
        desc: "Samsung Galaxy S21 2021 edition",
        price: 899,
        color: "#7c95eb",
        image:
            "https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402949-smartphones-samsung-galaxy-s21-5g-10018427.png",
        category: 'Tech'),
    Item(
        id: 9,
        name: "Lays",
        desc: "Lays Classic Snacks",
        price: 1,
        color: "#7c95eb",
        image:
            "https://cdn.shopify.com/s/files/1/0522/2357/4165/products/NewProject-2023-04-01T150100.195.png?v=1680343275",
        category: 'Food'),
    // Item(
    //     id: 10,
    //     name: "Coca Cola",
    //     desc: "Coca Cola Fizzy Drink",
    //     price: 1,
    //     color: "#7c95eb",
    //     image:
    //         "https://www.cartpk.com/media/catalog/product/cache/ccf016c098f64509830f131aff46d4ef/c/o/coca-cola_1.jpg",
    //     category: 'Food'),
    // Item(
    //     id: 11,
    //     name: "Classy T-Shirt",
    //     desc: "T-Shirt For Boys",
    //     price: 2,
    //     color: "#7c95eb",
    //     image:
    //         "data:image/jpeg;base64,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",
    //     category: 'Cloth'),
    Item(
        id: 12,
        name: "Denim Jeans",
        desc: "Denim Jeans Pent for Boys",
        price: 3,
        color: "#7c95eb",
        image: "https://i.imgur.com/Jy3YHaO.jpeg",
        category: 'Cloth'),  
    Item(
        id: 13,
        name: "Casual Shoes",
        desc: "High Quality Casual Shoes",
        price: 5,
        color: "#7c95eb",
        image: "https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/78b76ab3632d4251a7f2ae2b005fb600_9366/Grand_Court_TD_Lifestyle_Court_Casual_Shoes_White_GW9250_01_standard.jpg",
        category: 'Shoes'),
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
  final String category;
  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
    required this.category,
  });
  factory Item.fromJson(Map<String, dynamic> map) {
    //decode and maping of json file
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      price: map['price'] as int,
      color: map['color'],
      image: map['image'],
      category: map['category'],
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
