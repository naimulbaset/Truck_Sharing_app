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
        backgroundColor: Colors.amber[700],
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
              color: Colors.green[200],
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              //child: ExpansionTile(
              child: TextButton(
                //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                child: Column(
                  children: [
                    Text(
                      "Trip id 2345",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Date:12/08/2021',
                      style: TextStyle(fontSize: 16, color: Colors.green[900]),
                    ),
                    Text(
                      'Route: Lusaka To kitwe',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.green[900]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.green[200],
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              //child: ExpansionTile(
              child: TextButton(
                //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                child: Column(
                  children: [
                    Text(
                      "Trip id 5678",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Date:12/08/2021',
                      style: TextStyle(fontSize: 16, color: Colors.green[900]),
                    ),
                    Text(
                      'Route: Lusaka To Kitwe',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.green[900]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.green[200],
              margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
              //child: ExpansionTile(
              child: TextButton(
                //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                child: Column(
                  children: [
                    Text(
                      "Trip id 9080",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Date:14/08/2021',
                      style: TextStyle(fontSize: 16, color: Colors.green[900]),
                    ),
                    Text(
                      'Route: Ndola To Kabwe',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.green[900]),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   color: Colors.blue[200],
            //   margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
            //   child: ExpansionTile(
            //     title: TextButton(
            //       //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) {
            //               return TDatDeliveyScreen();
            //             },
            //           ),
            //         );
            //       },
            //       child: Text(
            //         "Trip id 6789",
            //         style: TextStyle(
            //             fontFamily: 'Source Sans Pro',
            //             fontSize: 17,
            //             color: Colors.black,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     children: <Widget>[
            //       ListTile(
            //         title: Row(
            //           children: [
            //             Text(
            //               'Date:13/08/2021',
            //               style: TextStyle(fontSize: 16),
            //             ),
            //             Text(
            //               'Route: Bashundhara To Mirpur',
            //               style: TextStyle(fontWeight: FontWeight.w700),
            //             ),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
