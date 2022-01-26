import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/myTrucks.dart';
import 'package:truck_sharing_app/screens/truckReg.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';
import 'package:truck_sharing_app/screens/requestStatus.dart';

class PendingScreen extends StatefulWidget {
  @override
  _PendingScreenState createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
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
        title: Text('Request Status'),
      ),
      drawer: SenderDrawer(),
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
                        padding: EdgeInsets.fromLTRB(0, 150, 0, 30),
                        alignment: Alignment.center,
                        //height: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.amber[900]),
                            color: (Colors.green.withOpacity(0.3)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                bottomLeft: Radius.circular(0.0))),

                        child: Column(
                          children: [
                            Text(
                              'Trip Id: 23456',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                                letterSpacing: 0,
                                // backgroundColor: Colors.indigoAccent
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Your request is pending!\n'
                              'Please wait a moment!',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
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
                        "Cancel Request",
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
                              return RequestStatusScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Request Status",
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
