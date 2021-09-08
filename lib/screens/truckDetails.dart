import 'package:flutter/material.dart';

class TruckDetailsScreen extends StatefulWidget {
  @override
  _TruckDetailsScreenState createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Truck Id Details',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Truck Id 01 Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900],
                  letterSpacing: 0,
                  // backgroundColor: Colors.indigoAccent
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Start Date',
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
                                'Start Time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('9.00 AM')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Current Location',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('Lusaka')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Destination',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('Kitwe')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Product Type',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('Fragile,Frozen')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Available Space',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('5000 m^3')),
                            ],
                          ),
                        ])),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Center(
                    child: FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                      color: Colors.amber[700],
                      onPressed: () {},
                      child: Text(
                        "Edit",
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
            ],
          ),
        ),
      ),
    );
  }
}
