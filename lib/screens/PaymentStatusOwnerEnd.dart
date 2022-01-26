import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/start/paymentSuccess.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';
import 'package:sslcommerz_flutter/model/SSLCAdditionalInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCCustomerInfoInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCEMITransactionInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCSdkType.dart';
import 'package:sslcommerz_flutter/model/SSLCShipmentInfoInitializer.dart';
import 'package:sslcommerz_flutter/model/SSLCTransactionInfoModel.dart';
import 'package:sslcommerz_flutter/model/SSLCommerzInitialization.dart';
import 'package:sslcommerz_flutter/model/SSLCurrencyType.dart';
import 'package:sslcommerz_flutter/model/sslproductinitilizer/General.dart';
import 'package:sslcommerz_flutter/model/sslproductinitilizer/SSLCProductInitializer.dart';
import 'package:sslcommerz_flutter/sslcommerz.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentStatusScreen extends StatefulWidget {
  @override
  _PaymentStatusScreenState createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Payment Status',
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
                padding: EdgeInsets.fromLTRB(10, 30, 0, 10),
                //height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: (Colors.greenAccent.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    // Text(
                    //   'Make Payment to confirm your Request',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     // fontWeight: FontWeight.bold,
                    //     color: Colors.blue[900],
                    //     letterSpacing: 0,
                    //
                    //     // backgroundColor: Colors.indigoAccent
                    //   ),
                    // ),

                    SizedBox(
                      height: 25,
                    ),

                    Row(
                      children: [
                        Text(
                          'Receipt',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 0,

                            // backgroundColor: Colors.indigoAccent
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Row(
                      children: [
                        Text(
                          'Trip Id#2345',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            letterSpacing: 0,

                            // backgroundColor: Colors.indigoAccent
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Date: 23/08/2021',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            letterSpacing: 0,

                            // backgroundColor: Colors.indigoAccent
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Paid',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            letterSpacing: 0,

                            // backgroundColor: Colors.indigoAccent
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Trip fare:',
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Expanded(
                          child: Text('80 BDT',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Discount:',
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Expanded(
                          child: Text('0.0 BDT',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                              )),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 5,
                      indent: 0,
                      endIndent: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Subtotal:',
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Expanded(
                          child: Text('80 BDT',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Tolls and Fees:',
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Expanded(
                          child: Text('20 BDT',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                              )),
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 5,
                      indent: 0,
                      endIndent: 10,
                      //color: Colors.red,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Total:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Expanded(
                          child: Text('100 BDT',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                              )),
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
                          Container(
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 70),
                              color: Colors.amber[700],
                              onPressed: () {
                                setState(() {
                                  _makePhoneCall('tel:0597924917');
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Call Sender",
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
                        ],
                      ),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
