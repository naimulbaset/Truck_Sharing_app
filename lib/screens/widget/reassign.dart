import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/ThankOwner.dart';

class ReAssignScreen extends StatefulWidget {
  @override
  _ReAssignScreenState createState() => _ReAssignScreenState();
}

class _ReAssignScreenState extends State<ReAssignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Re-assign Driver',
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
              height: 25,
            ),
            Column(
              children: <Widget>[
                Text(
                  'Your previous assigned driver is canceled!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900],
                    letterSpacing: 0,
                    // backgroundColor: Colors.indigoAccent
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
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
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(columns: <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Pickup Date',
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
                            'Pickup Point',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataCell(Text('Lusaka')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(
                            'Delivery point',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataCell(Text('Kitwe')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(
                            'Expected Delivery Time',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataCell(Text('1 PM')),
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
                          DataCell(Text('500 m^3')),
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
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Card(
                margin: const EdgeInsets.all(16.0),
                //clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Assign a new driver',
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
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Assign Truck Id:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              color: Colors.grey.withOpacity(0.6),
                              child: TextFormField(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Driver name:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              color: Colors.grey.withOpacity(0.6),
                              child: TextFormField(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Driver Phone No:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              color: Colors.grey.withOpacity(0.6),
                              child: TextFormField(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(20, 550, 20, 60),
                        child: Column(
                          children: [
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 50),
                                color: Colors.amber[700],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return OwnerThankScreen();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  "Agree",
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
                )),
          ]),
        ),
      ),
    );
  }
}
