import 'package:flutter/material.dart';
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
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  String? _password;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      var data = {
        'username': _usernameController.text,
        'contact': _contactController.text,
        'password': _passwordController.text,
      };

      var response = await http.post(
        Uri.parse('http://localhost:5000/signup'),
        body: data,
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }

      setState(() {
        changeButton = false;
      });
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
                        decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Enter Your  Name"),
                        validator: (String? value) {
                          if (value != null && value.isEmpty) {
                            return "Username  cannot b empty";
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
                    InkWell(
                      // type of container for button animation
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: changeButton ? 50 : 150, //conditional statement
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 50 : 8)),
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                      ),
                    ).p4(),
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
