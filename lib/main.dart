import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/confirmorder.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:flutter_application_1/widgets/MyAI.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'pages/home_page.dart';
import 'utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

// //basic datatypes / variables
// int days = 30;
// String name = "aashir";
// double pi = 3.14;awan
// bool ismale = true;
// var day = "tuesday"; // dynamic data type (var) we can assign it string/num
// // we can declare constants whose values donot change
// const pi = 3.14;
void main() async {
  //every function starts with main function
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MyApp()); //first thing you have to do is run app you can give any name rather than (myapp())
}

//here write "stl" and press enter it automatically generate statelesswidget
class MyApp extends StatelessWidget {
  const MyApp({super.key}); //Constructor

  @override
  Widget build(BuildContext context) {
    //build method is very imp because Ui code written under build
    // int days = 30;
    return MaterialApp(
      //first we have to give materialapp/widgetsapp
      //home: Homepage(),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Homepage();
            } else {
              return const LoginPage();
            }
          }),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.poppins().fontFamily,
          primaryTextTheme: GoogleFonts.poppinsTextTheme()),
      // MyTheme.lightTheme(context),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.myAI,
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => Homepage(),
        "/cartRoute": (context) => CartPage(),
        "/signup": (context) => SignupPage(),
        '/confirmorder': (context) => Confirmorder(),
        '/myai': (context) => MYAI(),
      },
    );
  }
}
      //routes: {
      // MyRoutes.loginRoute: (context) =>
      //     LoginPage(), //calling object of login page class
      // MyRoutes.homeRoute: (context) =>
      //     Homepage(), //same like dictionary key/value pair
      // },



                                      // InkWell(
                                //   // type of container for button animation
                                //   // onTap: () => moveToHome(context),
                                //   child: AnimatedContainer(
                                //     duration: Duration(seconds: 1),
                                //     height: 50,
                                //     width: changeButton
                                //         ? 50
                                //         : 150, //conditional statement
                                //     alignment: Alignment.center,
                                //     decoration: BoxDecoration(
                                //         color: Colors.deepPurple,
                                //         borderRadius: BorderRadius.circular(
                                //             changeButton ? 50 : 8)),
                                //     child: changeButton
                                //         ? Icon(
                                //             Icons.done,
                                //             color: Colors.white,
                                //           )
                                //         : Text(
                                //             "log in",
                                //             style: TextStyle(
                                //                 color: Colors.white,
                                //                 fontWeight: FontWeight.bold,
                                //                 fontSize: 18),
                                //           ),
                                //   ),
                                // ).p16(),
                                                                // ElevatedButton(
                                //   child: Text(
                                //     "Sign Up",
                                //     style: TextStyle(
                                //         color: Colors.white,
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 18),
                                //   ),
                                //   style: TextButton.styleFrom(
                                //     minimumSize: Size(150, 50),
                                //   ),
                                //   onPressed: () {
                                //     // print("hi aashir");
                                //     Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 SignupPage()));
                                //   },
                                // ).p4(),