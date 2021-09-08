import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/truckDetails.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';

class MtScreen extends StatefulWidget {
  @override
  _MtScreenState createState() => _MtScreenState();
}

class _MtScreenState extends State<MtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('My Truck Screen',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: DriverDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                Text(
                  'My Truck Status',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                    letterSpacing: 0,
                    // backgroundColor: Colors.indigoAccent
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(columns: <DataColumn>[
                      DataColumn(
                        label: Text('Truck Id'),
                      ),
                      DataColumn(
                        label: Text('Available Space'),
                      ),
                      DataColumn(
                        label: Text('Total Space'),
                      ),
                    ], rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TruckDetailsScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "01",
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text('500m^3')),
                          DataCell(Text('3000m^3')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            FlatButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return UserRegScreen();
                                //     },
                                //   ),
                                // );
                              },
                              child: Text(
                                "02",
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text('500m^3')),
                          DataCell(Text('3000m^3')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            FlatButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) {
                                //       return UserRegScreen();
                                //     },
                                //   ),
                                // );
                              },
                              child: Text(
                                "03",
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text('500m^3')),
                          DataCell(Text('3000m^3')),
                        ],
                      ),
                    ])),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
