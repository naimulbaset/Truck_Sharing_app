import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/api/pdf_api.dart';
import 'package:truck_sharing_app/screens/api/pdf_invoice_api.dart';
import 'package:truck_sharing_app/screens/model/customer.dart';
import 'package:truck_sharing_app/screens/model/invoice.dart';
import 'package:truck_sharing_app/screens/model/supplier.dart';
import 'package:truck_sharing_app/screens/widget/button_widget.dart';
import 'package:truck_sharing_app/screens/widget/title_widget.dart';
import 'package:truck_sharing_app/utils.dart';

class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Receipt'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Generate Invoice',
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Invoice PDF',
                  onClicked: () async {
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
                ),
              ],
            ),
          ),
        ),
      );
}
