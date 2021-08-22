import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:truck_sharing_app/widgets/herder_container.dart';

class UserRegScreen extends StatefulWidget {
  @override
  _UserRegScreenState createState() => _UserRegScreenState();
}

class _UserRegScreenState extends State<UserRegScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // final _firestore = FirebaseFirestore.instance;
  // final _auth = FirebaseAuth.instance;
  // User loggedInUser;
  String designation;
  String username;
  String email;
  String phone;
  String password;
  bool isLoading = false;

  final formKey = new GlobalKey<FormState>();

  @override
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
                                    onChanged: (val) {},
                                    value: this.designation,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Truck Driver'),
                                        value: 'Truck Driver',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Truck Owner'),
                                        value: 'Truck Owner',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Sender'),
                                        value: 'Sender',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Receiver'),
                                        value: 'Receiver',
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
                                color: Colors.blue.withOpacity(0.9),
                                onPressed: () {},
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
