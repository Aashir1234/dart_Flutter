// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';

import '../pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkkVsRNVJ7O7xNGK7IXtRwchi4NsKzUUdPMMcmIdbDKH_x6DKXR2EQGWrBiM8KKga7Ey0&usqp=CAU";
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = auth.currentUser;
    String? userEmail = user?.email;

    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text(
                  "Placeit-User",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  userEmail ?? "Guest",
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                "Log Out",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                auth.signOut().then((value) => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage())),
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: "Logout SuccessFull".text.make()))
                    });
              },
            ),
            ListTile(
              leading: Icon(
                Icons.radio_button_checked_outlined,
                color: Colors.black,
              ),
              title: Text(
                "My Pocket AI",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
               
              },
            ),
          ],
        ),
      ),
    );
  }
}

