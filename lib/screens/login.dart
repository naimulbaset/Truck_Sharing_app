import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/user_reg.dart';
import 'package:truck_sharing_app/widgets/herder_container.dart';
import 'package:truck_sharing_app/screens/truckOwner.dart';
import 'package:truck_sharing_app/screens/productSender.dart';
import 'package:truck_sharing_app/screens/DriverScreen/DriverHome.dart';

//import 'package:firebase_auth/firebase_auth.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:manufacturing_app/screens/forgetPass.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //final userId = FirebaseAuth.instance.currentUser.uid;

  // final _auth = FirebaseAuth.instance;
  // User loggedInUser;
  String designation;
  String email;
  String password;
  String registerAs;
  final formKey = new GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            // SizedBox(
            //   height: 30,
            // ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Email", icon: Icons.email),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return ForgotPassword();
                          //     },
                          //   ),
                          // );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 50),
                          color: Colors.blue.withOpacity(0.9),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return OwnerScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 50),
                          color: Colors.blue.withOpacity(0.9),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductSenderScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Sender LOG IN",
                            style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 50),
                          color: Colors.blue.withOpacity(0.9),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DriverHomeScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Driver LOG IN",
                            style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ]),
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UserRegScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold),
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

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
