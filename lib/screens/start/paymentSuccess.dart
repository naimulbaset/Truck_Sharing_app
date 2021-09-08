import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';
import 'package:truck_sharing_app/screens/tripdetails.dart';
import 'package:truck_sharing_app/screens/api/pdf_api.dart';
import 'package:truck_sharing_app/screens/api/pdf_invoice_api.dart';
import 'package:truck_sharing_app/screens/model/customer.dart';
import 'package:truck_sharing_app/screens/model/invoice.dart';
import 'package:truck_sharing_app/screens/model/supplier.dart';

class PaymentSuccessScreen extends StatefulWidget {
  @override
  _PaymentSuccessScreenState createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
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
        title: Text('Payment Success'),
      ),
      drawer: SenderDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: 400,
              height: 600,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/b1.png"))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Payment Successful!",
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 30,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        "Your Request was placed successfully.For more details click delivery status.",
                        style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 18,
                          //color: Colors.blue[900],
                          //fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                      color: Colors.amber[700],
                      onPressed: () async {
                        final date = DateTime.now();
                        final dueDate = date.add(Duration(days: 7));
                        Text('kkkk');

                        final invoice = Invoice(
                          supplier: Supplier(
                            name: 'Truck Sharing App',
                            // address: 'Sarah Street 9, Beijing, China',
                            // paymentInfo: 'https://paypal.me/sarahfieldzz',
                          ),
                          customer: Customer(
                            name: 'Mr Xyz',
                            address: 'Phone No:0159840',
                          ),
                          info: InvoiceInfo(
                            date: date,
                            dueDate: dueDate,
                            description: 'My description...',
                            number: '${DateTime.now().year}-9999',
                          ),
                          items: [
                            InvoiceItem(
                              description: '2345',
                              //date: DateTime.now(),
                              quantity: 5,
                              vat: 0.19,
                              unitPrice: 0.99,
                            ),
                          ],
                        );

                        final pdfFile = await PdfInvoiceApi.generate(invoice);

                        PdfApi.openFile(pdfFile);
                      },
                      child: Text(
                        "Receipt",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                      color: Colors.amber[700],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TripDetailScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Trip Details",
                        style: TextStyle(
                            fontFamily: 'Source Sans Pro',
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
