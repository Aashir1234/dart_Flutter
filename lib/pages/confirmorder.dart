import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';
import '../modules/cart.dart';
import '../modules/catalog.dart';
import '../widgets/themes.dart';

class Confirmorder extends StatefulWidget {
  @override
  State<Confirmorder> createState() => _ConfirmorderState();
}

class _ConfirmorderState extends State<Confirmorder> {
  bool _validateEmail(String email) {
    if (email.isEmpty) {
      return false;
    }
    // Add more validation if needed
    return true;
  }

  bool _validateContactNumber(String contactNumber) {
    if (contactNumber.isEmpty ||
        contactNumber.length != 11 ||
        contactNumber[0] != '0') {
      return false;
    }
    // Add more validation if needed
    return true;
  }

  bool _validateAddress(String address) {
    if (address.isEmpty) {
      return false;
    }
    // Add more validation if needed
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
    contactNumberController.dispose();
    addressController.dispose();
    super.dispose();
  }

  final cart = CartModel();

  final date = DateFormat.yMd().format(DateTime.now());

  final time = DateFormat.jm().format(DateTime.now());

  final emailController = TextEditingController();

  final contactNumberController = TextEditingController();

  final addressController = TextEditingController();

  final orderCollection = FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrderDetails(String email, String contactNumber,
      String address, List<String> purchasedItems, double totalPrice) async {
    try {
      final orderDoc = orderCollection.doc(); // Generate a new document ID
      await orderDoc.set({
        'email': email,
        'contactNumber': contactNumber,
        'address': address,
        'purchasedItems': purchasedItems,
        'totalPrice': totalPrice,
        'timestamp': DateTime.now(),
      });
      print('Order details saved successfully');
    } catch (error) {
      print('Error saving order details: $error');
      // Handle the error accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: Vx.isAndroid,
      body: Material(
        // backgroundColor: MyTheme.creamColor,
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 0, 0, 0),
        //   title: "Place Order".text.make(),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "".text.make().p32(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Order  Confirmed".text.bold.xl3.make().p20(),
                Image.network(
                  'https://img.icons8.com/?size=512&id=63262&format=png',
                  height: 40,
                  width: 40,
                ),
              ],
            ),
            OrderItems(cart).expand(),
            "To Pay: \$${cart.totalPrice}"
                .text
                .xl2
                .color(Color.fromARGB(187, 0, 0, 0))
                .make()
                .p8(),
            "".text.make().p8(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              "Order Date: $date".text.textStyle(context.captionStyle).make(),
              "         ".text.make(),
              "Order Time: $time".text.textStyle(context.captionStyle).make(),
            ]),
            "".text.make().p8(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter Email Address",
                        labelText: "Email",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: contactNumberController,
                      decoration: InputDecoration(
                        hintText: "Contact",
                        labelText: "Enter your Contact Number",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Contact cannot be empty";
                        } else if (value!.length != 11) {
                          return "Length of Contact Number should be equal to 11";
                        } else if (value[0] != '0') {
                          return "First character of Contact Number should be '0'";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: "Address",
                        labelText: "Enter your Delivery Address",
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Address cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ],
                ).p32(),
              ),
            ),
            ElevatedButton(
              child: "Place Order".text.make(),
              onPressed: () {
                // Retrieve the email, contact number, and address values
                final email = emailController.text;
                final contactNumber = contactNumberController.text;
                final address = addressController.text;

                // Validate the form fields
                final emailValid = _validateEmail(email);
                final contactNumberValid =
                    _validateContactNumber(contactNumber);
                final addressValid = _validateAddress(address);

                // Check if any field is invalid
                if (!emailValid || !contactNumberValid || !addressValid) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Invalid Entry"),
                        content: Text("Please fill all the fields correctly."),
                        actions: <Widget>[
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                  return;
                }

                // Retrieve the purchased items using the getter method
                final purchasedItems = OrderItems(cart).purchasedItems;
                final totalPrice = cart.totalPrice.toDouble();

                // Save the order details
                saveOrderDetails(
                  email,
                  contactNumber,
                  address,
                  purchasedItems,
                  totalPrice,
                );

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Congratulations!!!"),
                      content: Text("Order Placed"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkColor),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                ),
              ),
            ).h8(context),

// Validator methods for form fields
// bool _validateEmail(String email) {
//   if (email.isEmpty) {
//     return false;
//   }
//   // Add more validation if needed
//   return true;
// }

// bool _validateContactNumber(String contactNumber) {
//   if (contactNumber.isEmpty || contactNumber.length != 11 || contactNumber[0] != '0') {
//     return false;
//   }
//   // Add more validation if needed
//   return true;
// }

// bool _validateAddress(String address) {
//   if (address.isEmpty) {
//     return false;
//   }
//   // Add more validation if needed
//   return true;
// }

            // "".text.make().p8()

            "".text.make(),
          ],
        ),
      ),
    );
  }
}

class OrderItems extends StatelessWidget {
  final CartModel cart;

  OrderItems(this.cart);

  List<String> get purchasedItems {
    return cart.items.map((item) => item.name).toList();
  }

  @override
  Widget build(BuildContext context) {
    return purchasedItems.isEmpty
        ? "Nothing to Show".text.xl2.bold.makeCentered()
        : Container(
            color: Colors.white,
            child: ListTile(
              title: Text(
                "Purchased Items",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                purchasedItems.join(", "), // Join items into a single string
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ).p32();
  }
}
// ########################3333333####3333333#######33333###############################3333333333#########
// class Order {
//   final String email;
//   final List<Item> items;

//   Order({required this.email, required this.items});

//   factory Order.fromMap(Map<String, dynamic> map) {
//     final email = map['email'];
//     final itemsData = map['items'];

//     List<Item> items = [];
//     for (var itemData in itemsData) {
//       items.add(Item.fromJson(itemData));
//     }

//     return Order(email: email, items: items);
//   }
// }

// class ItemWidget extends StatelessWidget {
//   final Item item;

//   const ItemWidget({Key? key, required this.item})
//       : assert(item != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: Image.network(item.image),
//         title: Text(item.name),
//         subtitle: Text(item.desc),
//         trailing: Text(
//           "\$${item.price}",
//           textScaleFactor: 1.4,
//           style: TextStyle(
//             color: Colors.deepPurple,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ConfirmOrderPage extends StatefulWidget {
//   @override
//   _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
// }

// class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
//   final TextEditingController _emailController = TextEditingController();
//   List<Item> purchasedItems = [];

//   Future<List<Order>> getOrderHistory(String userEmail) async {
//     List<Order> orderHistory = [];

//     try {
//       QuerySnapshot snapshot = await FirebaseFirestore.instance
//           .collection('orders')
//           .where('email', isEqualTo: userEmail)
//           .get();

//       snapshot.docs.forEach((doc) {
//         Order order = Order.fromMap(doc.data() as Map<String, dynamic>);

//         orderHistory.add(order);
//       });
//     } catch (e) {
//       print('Error retrieving order history: $e');
//     }

//     return orderHistory;
//   }

//   void suggestItems(String userEmail) {
//     getOrderHistory(userEmail).then((List<Order> orderHistory) {
//       List<Item> suggestedItems = [];

//       for (Order order in orderHistory) {
//         if (order.email == userEmail) {
//           for (Item item in order.items) {
//             // Implement logic to suggest items based on previous purchases
//             // For example, you can check if the item category matches a previous purchase category
//             // Add the suggested items to the 'suggestedItems' list
//           }
//         }
//       }

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Suggested Items'),
//             content: SingleChildScrollView(
//               child: Column(
//                 children: suggestedItems.map((Item item) {
//                   return ListTile(
//                     title: Text(item.name),
//                     onTap: () {
//                       addToPurchasedItems(item);
//                       Navigator.of(context).pop();
//                     },
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         },
//       );
//     });
//   }

//   void addToPurchasedItems(Item item) {
//     setState(() {
//       purchasedItems.add(item);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Confirm Order'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               String userEmail = _emailController.text;
//               suggestItems(userEmail);
//             },
//             child: Text('Retrieve Order History'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: purchasedItems.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ItemWidget(item: purchasedItems[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
