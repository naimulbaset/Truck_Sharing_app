import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/user_reg.dart';
import 'package:truck_sharing_app/widgets/herder_container.dart';
import 'package:truck_sharing_app/screens/truckOwner.dart';
import 'package:truck_sharing_app/screens/productSender.dart';
import 'package:truck_sharing_app/screens/DriverScreen/DriverHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truck_sharing_app/screens/Admin/adminScreen.dart';
import 'package:truck_sharing_app/screens/welcomeSender.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  String email;
  String password;
  String registerAs;
  String designation;

  final formKey = new GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print('User Not created');
    }
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
            Form(
              key: _formkey,
              child: Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Field cannot be empty";
                            }
                            if (!RegExp(
                                    '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]+.[com]')
                                .hasMatch(value)) {
                              return "example@gmail.com";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value.trim();
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Field cannot be empty";
                            }

                            return null;
                          },
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock),
                            hintText: 'Enter your Password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () async {},
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
                            color: Colors.amber[700],
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (user.user.emailVerified) {
                                    final value = FirebaseFirestore.instance
                                        .collection('TruckDriver')
                                        .doc(user.user.uid)
                                        .get()
                                        .then((value) {
                                      if (value.exists) {
                                        int count = 0;
                                        Navigator.popUntil(context, (route) {
                                          return count++ == 0;
                                        });
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return DriverHomeScreen();
                                            },
                                          ),
                                        );
                                      }
                                      if (user.user.emailVerified) {
                                        final value = FirebaseFirestore.instance
                                            .collection('TruckOwner')
                                            .doc(user.user.uid)
                                            .get()
                                            .then((value) {
                                          if (value.exists) {
                                            int count = 0;
                                            Navigator.popUntil(context,
                                                (route) {
                                              return count++ == 0;
                                            });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return OwnerScreen();
                                                },
                                              ),
                                            );
                                          }
                                        });
                                      }
                                      if (user.user.emailVerified) {
                                        final value = FirebaseFirestore.instance
                                            .collection('Sender')
                                            .doc(user.user.uid)
                                            .get()
                                            .then((value) {
                                          if (value.exists) {
                                            int count = 0;
                                            Navigator.popUntil(context,
                                                (route) {
                                              return count++ == 0;
                                            });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return WcSenderScreen();
                                                },
                                              ),
                                            );
                                          }
                                        });
                                      }
                                      if (user.user.emailVerified) {
                                        final value = FirebaseFirestore.instance
                                            .collection('Admin')
                                            .doc(user.user.uid)
                                            .get()
                                            .then((value) {
                                          if (value.exists) {
                                            int count = 0;
                                            Navigator.popUntil(context,
                                                (route) {
                                              return count++ == 0;
                                            });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return AdminScreen();
                                                },
                                              ),
                                            );
                                          }
                                        });
                                      }
                                    });
                                  } else {
                                    await user.user.sendEmailVerification();
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Center(
                                                child: Text(
                                                    'Email not verified,verify your email first')),
                                            actions: [
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Try Again'))
                                            ],
                                          );
                                        });
                                  }
                                } catch (e) {
                                  String errorMessage;
                                  if (e.hashCode == 505284406) {
                                    errorMessage = 'User Not Found';
                                  } else if (e.hashCode == 185768934) {
                                    errorMessage = 'Wrong Password';
                                  } else if (e.hashCode == 38947693 ||
                                      e.hashCode == 286357906) {
                                    errorMessage =
                                        'Check Your Internet Connection';
                                  } else {
                                    errorMessage = 'Please try after sometime';
                                  }
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Center(
                                              child: Text('$errorMessage')),
                                          actions: [
                                            FlatButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Try Again'))
                                          ],
                                        );
                                      });
                                }
                              }
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
                      // Expanded(
                      //   child: Center(
                      //     child: FlatButton(
                      //       padding: EdgeInsets.symmetric(
                      //           vertical: 12, horizontal: 50),
                      //       color: Colors.blue.withOpacity(0.9),
                      //       onPressed: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) {
                      //               return ProductSenderScreen();
                      //             },
                      //           ),
                      //         );
                      //       },
                      //       child: Text(
                      //         "Sender LOG IN",
                      //         style: TextStyle(
                      //             fontFamily: 'Source Sans Pro',
                      //             fontSize: 16,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //   child: Center(
                      //     child: FlatButton(
                      //       padding: EdgeInsets.symmetric(
                      //           vertical: 12, horizontal: 50),
                      //       color: Colors.blue.withOpacity(0.9),
                      //       onPressed: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) {
                      //               return DriverHomeScreen();
                      //             },
                      //           ),
                      //         );
                      //       },
                      //       child: Text(
                      //         "Driver LOG IN",
                      //         style: TextStyle(
                      //             fontFamily: 'Source Sans Pro',
                      //             fontSize: 16,
                      //             color: Colors.white,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                              color: Colors.green[700],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
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
