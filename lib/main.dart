import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'pages/home_page.dart';
import 'utils/routes.dart';

// //basic datatypes / variables
// int days = 30;
// String name = "aashir";
// double pi = 3.14;awan
// bool ismale = true;
// var day = "tuesday"; // dynamic data type (var) we can assign it string/num
// // we can declare constants whose values donot change
// const pi = 3.14;
void main() {
  //every function starts with main function
  runApp(
      MyApp()); //first thing you have to do is run app you can give any name rather than (myapp())
}

//here write "stl" and press enter it automatically generate statelesswidget
class MyApp extends StatelessWidget {
  const MyApp({super.key}); //Constructor

  @override
  Widget build(BuildContext context) {
    //build method is very imp because Ui code written under build
    int days = 30;
    return MaterialApp(
      //first we have to give materialapp/widgetsapp
      //home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => Homepage()
        
        // ".home"
      },
      //routes: {
      // MyRoutes.loginRoute: (context) =>
      //     LoginPage(), //calling object of login page class
      // MyRoutes.homeRoute: (context) =>
      //     Homepage(), //same like dictionary key/value pair
      // },
    );
  }
}
