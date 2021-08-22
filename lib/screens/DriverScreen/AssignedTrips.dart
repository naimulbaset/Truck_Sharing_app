import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/truckDriverAtDeliverypoint.dart';

class AssignedTripScreen extends StatefulWidget {
  @override
  _AssignedTripScreenState createState() => _AssignedTripScreenState();
}

class _AssignedTripScreenState extends State<AssignedTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Assigned trips',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: DriverDrawer(),
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TDatDeliveyScreen();
                      },
                    ),
                  );
                },
                child: Text("trip id 1"),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              child: RaisedButton(
                onPressed: () {},
                child: Text("trip id 2"),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              child: RaisedButton(
                onPressed: () {},
                child: Text("trip id 3"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
