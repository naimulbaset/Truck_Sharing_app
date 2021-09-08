import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/myTrucks.dart';
import 'package:truck_sharing_app/screens/truckReg.dart';
import 'package:truck_sharing_app/screens/requestStatus.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/PaymentStatusOwnerEnd.dart';

class OwnerThankScreen extends StatefulWidget {
  @override
  _OwnerThankScreenState createState() => _OwnerThankScreenState();
}

class _OwnerThankScreenState extends State<OwnerThankScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text(''),
      ),
      drawer: DriverDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: 400,
              height: 600,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
                        padding: EdgeInsets.fromLTRB(50, 100, 30, 0),
                        //height: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: (Colors.green.withOpacity(0.3)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                bottomLeft: Radius.circular(0.0))),

                        child: Column(
                          children: [
                            Text(
                              'Thank You for accepting!\n'
                              'The Sender is notfied!',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                      color: Colors.amber[700],
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return MtScreen();
                        //     },
                        //   ),
                        // );
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                      color: Colors.amber[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PaymentStatusScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Payment Status",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
