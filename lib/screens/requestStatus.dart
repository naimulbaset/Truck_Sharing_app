import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';

class RequestStatusScreen extends StatefulWidget {
  @override
  _RequestStatusScreenState createState() => _RequestStatusScreenState();
}

class _RequestStatusScreenState extends State<RequestStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Request Status',
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
          child: Column(children: [
            SizedBox(
              height: 25,
            ),
            Column(
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(left: 50.0),
                          child: Text(
                            'Request Status:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue[900],
                            ),
                          )),
                    ),
                    Expanded(
                      child: Text('Approved',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
              //height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: (Colors.blue.withOpacity(0.3)),
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
                            DataCell(Text('Bashundhara R/A')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(
                              'Delivery Point',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            DataCell(Text('Mirpur 10')),
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
                ],
              ),
            ),
            // Card(
            //   margin: const EdgeInsets.all(16.0),
            //   //clipBehavior: Clip.antiAlias,
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       children: [
            //         ListTile(
            //           leading: Icon(Icons.arrow_drop_down_circle),
            //           title: const Text(
            //             'Space Request 1',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 20),
            //           ),
            //         ),
            //         Text(
            //           'Pickup Date:10/08/21',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //         Text(
            //           'Pickup Point: Bashundhara R/A',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //         Text(
            //           'Delivery Point: Mirpur 10',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //         Text(
            //           'Delivery Time: 1.00 pm',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //         Text(
            //           'Product Weight: 10 kg',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //         Text(
            //           'Product Volume: Mirpur 10',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //         Text(
            //           'Product type: Fragile',
            //           style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         ),
            //         // ButtonBar(
            //         //   alignment: MainAxisAlignment.start,
            //         //   children: [
            //         //     FlatButton(
            //         //       textColor: const Color(0xFF6200EE),
            //         //       onPressed: () {
            //         //         // Perform some action
            //         //       },
            //         //       child: const Text('ACTION 1'),
            //         //     ),
            //         //     FlatButton(
            //         //       textColor: const Color(0xFF6200EE),
            //         //       onPressed: () {
            //         //         // Perform some action
            //         //       },
            //         //       child: const Text('ACTION 2'),
            //         //     ),
            //         //   ],
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 25,
            ),

            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                //height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: (Colors.greenAccent.withOpacity(0.3)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Make Payment to confirm your Request',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
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
                                  'Charge:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              margin: const EdgeInsets.only(right: 10.0),
                              color: Colors.grey.withOpacity(0.6),
                              child: Text('80 BDT',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.bold,
                                  )),
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
                                color: Colors.green.withOpacity(0.9),
                                onPressed: () {},
                                child: Text(
                                  "Make Payment",
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
