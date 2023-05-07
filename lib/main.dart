import 'package:flutter/material.dart';
import 'home_page.dart';

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
        home: Homepage());
  }
}
