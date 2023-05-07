import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //component of widget related to html {header/body/flutter}
      appBar: AppBar(
        title: Text(' Ecommerece app'),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days o flutter"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
