import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:truck_sharing_app/widgets/herder_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truck_sharing_app/screens/regSuccess.dart';
import 'package:firebase_core/firebase_core.dart';

class UserRegScreen extends StatefulWidget {
  @override
  _UserRegScreenState createState() => _UserRegScreenState();
}

class _UserRegScreenState extends State<UserRegScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  User user = FirebaseAuth.instance.currentUser;

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  String designation;
  String registerAs;
  String username;
  String email;
  String phone;
  String password;
  String TruckDriver;
  String TruckOwner;
  String Sender;
  String Admin;
  bool isLoading = false;

  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;

        //print(loggedInUser.uid);
        //print(loggedInUser.email);
      }
    } catch (e) {
      print('Fail');
    }
  }

  Future usernameCheck(String username) async {
    final result = await FirebaseFirestore.instance
        .collection('$designation')
        .where('User Name', isEqualTo: username)
        .get();
    return result.docs.isEmpty;
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.deepPurple.withOpacity(0.3),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      HeaderContainer("Create Your Account"),
                      // Container(
                      //   alignment: Alignment.center,
                      //   margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                      //   child: Text('CREATE YOUR ACCOUNT',
                      //       style: TextStyle(
                      //           fontFamily: 'Source Sans Pro',
                      //           fontSize: 20,
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold)),
                      // ),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Field cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {
                            username = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.person_outline),
                            hintText: 'User Name',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                            icon: Icon(Icons.mail_outline),
                            hintText: 'Enter your email',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isNotEmpty) {
                              if (value.length != 11) {
                                return "Enter Valid Number";
                              }
                              if (!RegExp('^[0-9]{11}').hasMatch(value)) {
                                return "Please enter 11 digit";
                              }
                            }

                            return null;
                          },
                          onChanged: (value) {
                            phone = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone_android),
                            hintText: 'Enter your mobile No',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          //padding: EdgeInsets.all(8),
                          color: Colors.white,

                          //margin: EdgeInsets.fromLTRB(20, 130, 20, 50),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  //padding: EdgeInsets.all(16),
                                  child: new DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.app_registration),
                                    ),
                                    validator: (String value) {
                                      if (value == null) {
                                        return "Please Select a type";
                                      }
                                      return null;
                                    },
                                    hint: Text('Register As'),
                                    onChanged: (val) {
                                      registerAs = val;
                                      print(val);
                                      setState(() {
                                        this.designation = val;
                                      });
                                    },
                                    value: this.designation,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Truck Driver'),
                                        value: 'TruckDriver',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Truck Owner'),
                                        value: 'TruckOwner',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Sender'),
                                        value: 'Sender',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Admin'),
                                        value: 'Admin',
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Field cannot be empty";
                            }
                            if (value.length < 6) {
                              return "Minimum 6 Digits required";
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
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        color: Colors.white,
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return "Field cannot be empty";
                            }
                            if (value.length < 6) {
                              return "Minimum 6 Digits required";
                            }

                            return null;
                          },
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                            //Do something with the user input.
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.security),
                            hintText: 'Re-Type Password',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(20, 550, 20, 60),
                        child: Column(
                          children: [
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 50),
                                color: Colors.amber[700],
                                onPressed: () async {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  final valid = await usernameCheck(username);
                                  if (!valid) {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                              title: Center(
                                                  child: Text(
                                                'User Name already taken',
                                                style: TextStyle(
                                                    color: Colors.blue[900]),
                                              )),
                                              actions: <Widget>[
                                                FlatButton(
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
                                                        'Try Another Name'))
                                              ]);
                                        });
                                    // username exists
                                  }
                                  if (_formkey.currentState.validate()) {
                                    try {
                                      var newUser = await _auth
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password)
                                          .then((newUser) {
                                        _firestore
                                            .collection('$designation')
                                            .doc(newUser.user.uid)
                                            .set({
                                          'Email': email,
                                          'Register As': registerAs,
                                          'User Name': username,
                                          'phone': phone,
                                        });
                                      });
                                      if (newUser != null) {
                                        print('I am here');
                                      }
                                      // int count = 0;
                                      // Navigator.popUntil(context, (route) {
                                      //   return count++ == 2;
                                      // });

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return RegSuccessScreen();
                                          },
                                        ),
                                      );

                                      setState(() {
                                        isLoading = false;
                                      });
                                    } catch (e) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      String errorMessage = "${e.toString()}";
                                      return showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Center(
                                                  child: Text(
                                                      '${errorMessage.split('] ')[1]}')),
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        isLoading = false;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Try Again'))
                                              ],
                                            );
                                          });
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      fontFamily: 'Source Sans Pro',
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
