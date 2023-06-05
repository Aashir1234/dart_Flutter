import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'package:google_fonts/google_fonts.dart';
// import '/utils/routes.dart';
//////////////////////////////////////////////////////////
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
// ////////////////////////////////////////////////////////

class CreateAcc extends StatefulWidget {
  const CreateAcc({Key? key}) : super(key: key);

  @override
  State<CreateAcc> createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool changeButton = false; // boolean variable for animated button
  final _formKey = GlobalKey<FormState>();
  String? _password;
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(
        () {
          changeButton = true;
          print(emailcontroller.text);
          _auth.createUserWithEmailAndPassword(
              email: emailcontroller.text.toString(),
              password: passwordcontroller.text
                  .toString()
                  .toString()); // on tap above declared changebutton becomes true
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
              "Create Account ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
                //padding of username and password forms
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                              hintText: "Enter Email Address",
                              labelText: "Email",
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Email  cannot b empty";
                              }
                              return null;
                            }),

                        TextFormField(
                            controller: passwordcontroller,
                            obscureText: true, //to hide text of password
                            decoration: InputDecoration(
                              hintText: "Create a Strong Password",
                              labelText: "Password",
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Password  cannot b empty";
                              } else if (value!.length < 6) {
                                return "Length of password should be greater then six";
                              } else if (!value.contains(RegExp(r'[@#!%&]'))) {
                                return "password should contain at least one special character '@', '#', '!', '%', or '&'";
                              }
                              _password = value;
                              return null;
                            }),
                        TextFormField(
                            obscureText: true, //to hide text of password
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              labelText: "Old Password",
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Password  cannot b empty";
                              } else if (value != _password) {
                                return "Passwords do not match";
                              }
                              return null;
                            }),
                        //animated container
                        SizedBox(
                          height: 30,
                        ),
                        Material(
                            color: Colors.white,
                            child: Column(children: [
                              ElevatedButton(
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(150, 50),
                                  ),
                                  onPressed: () {
                                    moveToHome(context);
                                  }).p4(),
                              // Other login UI elements...
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already  have  an account ?"),
                                  TextButton(
                                    child: Text("login"),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                  ),
                                ],
                              )
                            ]))
                      ],
                    )))
          ],
        )));
  }
}
