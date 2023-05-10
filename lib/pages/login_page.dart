import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
// import '/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              height: 60,
            ),
            Image.asset(
              // to add image in flutter first we have to add it in assets folder and uncomment dependencies in pubsec.yaml
              "assets/images/loginimg.png", //image_path
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
            Padding(
                //padding of username and password forms
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter Username",
                                labelText: "Username"),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Username  cannot b empty";
                              }
                              return null;
                            }),

                        TextFormField(
                            obscureText: true, //to hide text of password
                            decoration: InputDecoration(
                                hintText: "Enter Password",
                                labelText: "Password"),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Password  cannot b empty";
                              } else if (value!.length < 6) {
                                return "Length of password should be greater then six";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        //animated container
                        Material(
                            child: InkWell(
                                // type of container for button animation
                                onTap: () => moveToHome(context),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  height: 50,
                                  width: changeButton
                                      ? 50
                                      : 150, //conditional statement
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(
                                          changeButton ? 50 : 8)),
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
                                )))
                        // ElevatedButton(
                        //   child: Text("Login"),
                        //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                        //   onPressed: () {
                        //     print("hi aashir");
                        //Navigator.pushNamed(context, MyRoutes.homeRoute);
                        // },
                        // )
                      ],
                    )))
          ],
        )));
  }
}
