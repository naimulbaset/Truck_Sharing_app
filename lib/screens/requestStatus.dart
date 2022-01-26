import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class RequestStatusScreen extends StatefulWidget {
  @override
  _RequestStatusScreenState createState() => _RequestStatusScreenState();
}

class _RequestStatusScreenState extends State<RequestStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
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
                              color: Colors.black,
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
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
              //height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green[900]),
                color: (Colors.amber.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
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
                  ),
                  Divider(
                    height: 20,
                    thickness: 5,
                    indent: 0,
                    endIndent: 10,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        // padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.center,

                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Expected Delivery Date:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '10/08/2021',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Expected Delivery Time:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '1.00 PM',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Receiver Name:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Mr xyz',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Receiver Phone No:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '017595345789',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Pickup Point:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Lusaka',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Delivery Point:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Kitwe',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Product Weight:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '10kg',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Product Height:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '30 inch',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Product Width:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '30 inch',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Product Height:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '30 inch',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Product Length:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '30 inch',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Product Type:',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Frozen',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 30, 0, 10),
                //height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber[900]),
                  color: (Colors.greenAccent.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Make Payment to confirm your Request',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        // fontWeight: FontWeight.bold,
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
                          Center(
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 50),
                              color: Colors.green.withOpacity(0.9),
                              onPressed: () async {
                                sslCommerzCustomizedCall().then((value) async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PaymentSuccessScreen();
                                      },
                                    ),
                                  );
                                }).catchError((e) {
                                  print('error caught');
                                  print(e.message);
                                });
                              },
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
                )),
          ]),
        ),
      ),
    );
  }
}

Future<void> sslCommerzCustomizedCall() async {
  Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
          ipn_url: "www.ipnurl.com",
          currency: SSLCurrencyType.BDT,
          product_category: "Food",
          sdkType: SSLCSdkType.TESTBOX,
          store_id: 'mstec602216c516812',
          store_passwd: 'mstec602216c516812@ssl',
          total_amount: 100,
          tran_id: "1231321321321312"));

  sslcommerz
      .addCustomerInfoInitializer(
          customerInfoInitializer: SSLCCustomerInfoInitializer(
              customerName: null,
              customerEmail: null,
              customerAddress1: null,
              customerCity: null,
              customerPostCode: null,
              customerCountry: null,
              customerPhone: ''))
      .addProductInitializer(
          sslcProductInitializer: SSLCProductInitializer(
              productName: "Parking Booking",
              productCategory: "Parking",
              general: General(
                  general: "General Purpose",
                  productProfile: "Product Profile")));
  var result = await sslcommerz.payNow();
  if (result is PlatformException) {
    print("the response is: " + result.message + " code: " + result.code);
  } else {
    SSLCTransactionInfoModel model = result;
  }
}
