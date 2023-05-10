import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import '/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;  // boolean variable for animated button
  @override
  Widget build(BuildContext context) {   // build function
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(   // using single child scrool view our psge container/elements doesnot crop on different screen sizes (remove error of botom overflow)
            child: Column(  // column for all elements 
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset( // to add image in flutter first we have to add it in assets folder and uncomment dependencies in pubsec.yaml
              "assets/images/loginimg.png",  //image_path
              fit: BoxFit.cover,
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Account Registration",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(  //padding of username and password forms
                padding: const EdgeInsets.symmetric(    
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                    ),
                    TextFormField(
                      obscureText: true, //to hide text of password
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //animated container
                    InkWell(  // type of container for button animation 
                        onTap: () async {
                          setState(
                            () {
                              changeButton = true;  // on tap above declared changebutton becomes true 
                            },
                          );
                          await Future.delayed(Duration(seconds: 1));  // after tap screen waits for 1 sec and then goes to next route
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ));
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50,
                          width:
                              changeButton ? 50 : 150, //conditional statement
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
                                  "log in",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                        ))
                    // ElevatedButton(
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    //   onPressed: () {
                    //     print("hi aashir");
                    //Navigator.pushNamed(context, MyRoutes.homeRoute);
                    // },
                    // )
                  ],
                ))
          ],
        )));
  }
}
