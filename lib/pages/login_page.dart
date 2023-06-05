import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'new_signuppage.dart';

// import 'package:google_fonts/google_fonts.dart';
// import '/utils/routes.dart';
////////////////////////////////////////////////////////////////
// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// ///////////////////////////////////////////////////////////

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool changeButton = false; // boolean variable for animated button
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(
        () {
          changeButton =
              true; // on tap above declared changebutton becomes true
        },
      );
      await Future.delayed(Duration(
          seconds:
              1)); // after tap screen waits for 1 sec and then goes to next route
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));
      setState(() {
        changeButton = false; // on tap above declared changebutton becomes true
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // build function
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        // using single child scrool view our psge container/elements doesnot crop on different screen sizes (remove error of botom overflow)
        child: Column(
          // column for all elements
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              // to add image in flutter first we have to add it in assets folder and uncomment dependencies in pubsec.yaml
              "assets/images/loginimg.png", //image_path
              fit: BoxFit.cover,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Account Registration",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              //padding of username and password forms
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            hintText: "Enter Email Address",
                            labelText: "Email",
                            prefixIcon: Icon(Icons.alternate_email)),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Email  cannot b empty";
                          } else if (value!.contains(RegExp(r'[@]'))) {
                            return "Email should contain  '@'";
                          }
                          return null;
                        }),

                    TextFormField(
                        controller: passwordcontroller,
                        obscureText: true, //to hide text of password
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock_open)),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Password  cannot b empty";
                          } else if (value!.length < 6) {
                            return "Length of password should be greater then six";
                          } else if (!value.contains(RegExp(r'[@#!%&]'))) {
                            return "password should contain at least one special character '@', '#', '!', '%', or '&'";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    //animated container
                    Material(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ElevatedButton(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              minimumSize: Size(150, 50),
                            ),
                            onPressed: () async {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: emailcontroller.text.trim(),
                                  password: passwordcontroller.text.trim(),
                                );

                                // Authentication successful
                                // Navigate to the desired page
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            "Login Sucessfull ".text.make()));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homepage()),
                                );
                              } catch (error) {
                                // Handle authentication error
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Invalid Entry"),
                                      content: Text(
                                          "The entered email or password is invalid."),
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
                              }
                            },
                          ).p4(),
                          // Other login UI elements...
                          SizedBox(
                            height: 20,
                          ),
                          // Column(
                          //   children: [
                          //     SizedBox(
                          //       height: 20,
                          //     ),
                          //     "---Or Continue With--- ".text.make(),

                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have account ?"),
                              TextButton(
                                child: Text("Sign Up"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CreateAcc()));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
