import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/login.dart';
import 'package:truck_sharing_app/screens/user_reg.dart';
import 'package:truck_sharing_app/widgets/herder_container.dart';
import 'package:truck_sharing_app/screens/pdf.dart';

//import 'package:manufacturing_app/screens/guestHome.dart';

//import 'package:manufacturing_app/screens/forgetPass.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer(''),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "TRUCK SHARING APP",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 30,
                            letterSpacing: 2,
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      onPressed: () {},
                      child: Text(
                        "Continue as guest",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 30,
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold),
                      ),
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
                        "Create your account",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20,
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20,
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    // FlatButton(
                    //   padding:
                    //       EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return PdfPage();
                    //         },
                    //       ),
                    //     );
                    //   },
                    //   child: Text(
                    //     "pdf",
                    //     style: TextStyle(
                    //         fontFamily: 'Source Sans Pro',
                    //         fontSize: 20,
                    //         color: Colors.blue[700],
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
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
