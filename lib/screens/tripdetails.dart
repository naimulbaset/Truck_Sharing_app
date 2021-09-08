import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/myTrucks.dart';
import 'package:truck_sharing_app/screens/truckReg.dart';
import 'package:truck_sharing_app/screens/senderAtpickup.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';

class TripDetailScreen extends StatefulWidget {
  @override
  _TripDetailScreenState createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Trip details'),
      ),
      drawer: SenderDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                //height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber[900]),
                  color: (Colors.green.withOpacity(0.3)),
                ),

                child: Column(
                  children: [
                    Text(
                      'Trip Id: 23456',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                        letterSpacing: 0,
                        // backgroundColor: Colors.indigoAccent
                      ),
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Expected Delivery Date',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text('10/08/2021'),
                              ),
                            ], rows: <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Driver Name:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('Mr Xyz')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Driver Number',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('0175954900')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Expected time',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('1 PM')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Receiver Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('Mr X')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Receiver Phone No',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('0175908908')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Pickup Point',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('Lusaka')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Delivery Point',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('Kitwe')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Product Weight',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('10 kg')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Product Volume',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('700 m^3')),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    'Product Type',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text('Fragile')),
                                ],
                              ),
                            ])),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      //margin: EdgeInsets.fromLTRB(20, 550, 20, 60),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 70),
                              color: Colors.green.withOpacity(0.9),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Call Driver",
                                    style: TextStyle(
                                        fontFamily: 'Source Sans Pro',
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 70),
                              color: Colors.green.withOpacity(0.9),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SenderAtPickupScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Pickup Point",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
