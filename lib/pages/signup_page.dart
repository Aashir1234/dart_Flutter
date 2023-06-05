import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  String? _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
        print(emailcontroller.text.toString());
        _auth.createUserWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString());
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ));

      // Perform sign up and Firebase Authentication
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        // using single child scrool view our psge container/elements doesnot crop on different screen sizes (remove error of botom overflow)
        child: Column(
          // column for all elements
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              // to add image in flutter first we have to add it in assets folder and uncomment dependencies in pubsec.yaml
              "assets/images/loginimg.png", //image_path
              fit: BoxFit.cover,
              height: 250,
            ).h15(context),
            SizedBox(
              height: 20,
            ),
            Text(
              "Create Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
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
                            hintText: "Email", labelText: "Enter Your  Email"),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Email  cannot b empty";
                          }

                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "Contact",
                            labelText: "Enter your Contact Number"),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Contact  cannot b empty";
                          } else if (value!.length != 11) {
                            return "Length of Contact Number should be equal to 11";
                          } else if (value[0] != '0') {
                            return "First character of Contact Number  should be '0'";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: passwordcontroller,
                        obscureText: true, //to hide text of password
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Create Strong Password"),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Password  cannot b empty";
                          } else if (value!.length < 6) {
                            return "Length of password should be greater then six";
                          } else if (!value.contains(RegExp(r'[@#!%&]'))) {
                            return "password should contain at least one special character '@', '#', '!', '%', or '&'";
                          }
                          _password =
                              value; // Store the entered password for comparison
                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        obscureText: true, //to hide text of password
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            labelText: "Confirm your Password"),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Password  cannot b empty";
                          } else if (value != _password) {
                            return "Passwords do not match";
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: Text(
                        "OK",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        // print("hi aashir");
                        // () => signUpUser();
                        moveToHome(context);
                      },
                    ).p4(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ?"),
                        TextButton(
                          child: Text("Login"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                        ),
                      ],
                    )
                    // InkWell(
                    //   // type of container for button animation
                    //   onTap: () => moveToHome(context),
                    //   child: AnimatedContainer(
                    //     duration: Duration(seconds: 1),
                    //     height: 50,
                    //     width: changeButton ? 50 : 150, //conditional statement
                    //     alignment: Alignment.center,
                    //     decoration: BoxDecoration(
                    //         color: Colors.deepPurple,
                    //         borderRadius:
                    //             BorderRadius.circular(changeButton ? 50 : 8)),
                    //     child: changeButton
                    //         ? Icon(
                    //             Icons.done,
                    //             color: Colors.white,
                    //           )
                    //         : Text(
                    //             "OK",
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 18),
                    //           ),
                    // ),
                    // ).p4(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
