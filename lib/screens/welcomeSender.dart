import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/myTrucks.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/truckReg.dart';
import 'package:truck_sharing_app/screens/DriverScreen/AssignedTrips.dart';
import 'package:truck_sharing_app/screens/truckDriverAtDeliverypoint.dart';
import 'package:truck_sharing_app/screens/productSender.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';

class WcSenderScreen extends StatefulWidget {
  @override
  _WcSenderScreenState createState() => _WcSenderScreenState();
}

class _WcSenderScreenState extends State<WcSenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Welcome Sender',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/s1.png"))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome!",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 30,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductSenderScreen();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.amber[900], Colors.green],
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: Center(
                            child: Text(
                          "Send Parcel",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return AssignedTripScreen();
                        //     },
                        //   ),
                        // );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.amber[900], Colors.green],
                            ),
                            borderRadius: BorderRadius.circular(50)),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: Center(
                            child: Text(
                          "Trip History",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
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
