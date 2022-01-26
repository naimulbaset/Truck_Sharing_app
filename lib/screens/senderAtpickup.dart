import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';

class SenderAtPickupScreen extends StatefulWidget {
  @override
  _SenderAtPickupScreenState createState() => _SenderAtPickupScreenState();
}

class _SenderAtPickupScreenState extends State<SenderAtPickupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Sender at pickup Point',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: SenderDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
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
              SizedBox(
                height: 30,
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
                                'Expected time',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('1 PM')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Receiver Name',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('Mr X')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Receiver Phone No',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('0175908908')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Pickup Point',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('Lusaka')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Delivery Point',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('Kitwe')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Product Weight',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('10 kg')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Product Volume',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('700 m^3')),
                            ],
                          ),
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text(
                                'Product Type',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                              DataCell(Text('Fragile')),
                            ],
                          ),
                        ])),
                    SizedBox(
                      height: 20,
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
                              onPressed: () {},
                              child: Text(
                                "Send OTO to Driver",
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
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                  //height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: (Colors.amber.withOpacity(0.3)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 50.0),
                                child: Text(
                                  'Input OTP:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 30.0),
                              color: Colors.grey.withOpacity(0.6),
                              child: TextFormField(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(20, 550, 20, 60),
                        child: Column(
                          children: [
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 50),
                                color: Colors.green.withOpacity(0.9),
                                onPressed: () {},
                                child: Text(
                                  "confirm",
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
