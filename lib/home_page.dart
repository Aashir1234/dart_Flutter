import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  final int days = 30;
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
          child: Container(
            child: Text("Welcome to $days days o flutter"),
          ),
        ),
      );
  }
}