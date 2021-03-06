import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/productSender.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';
import 'package:truck_sharing_app/screens/pending.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class ProductSenderScreen extends StatefulWidget {
  @override
  _ProductSenderScreenState createState() => _ProductSenderScreenState();
}

class _ProductSenderScreenState extends State<ProductSenderScreen> {
  List _myActivities;
  String _myActivitiesResult;
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  final _formkey = new GlobalKey<FormState>();
  TimeOfDay time;
  TimeOfDay picked;
  String timee;
  int sl;
  String name;
  String phone;
  String purpose;
  String fee;

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked_s = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked_s != null && picked_s != selectedTime)
      setState(() {
        selectedTime = picked_s;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Product Sender',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: SenderDrawer(),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Text('ENTER PRODUCT DETAIL',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 5),
                      Text('Expected Delivery Date:'),
                      SizedBox(
                        width: 5,
                      ),
                      FlatButton(
                        onPressed: () => _selectDate(context),
                        child: Text("${selectedDate.toLocal()}".split(' ')[0]),

                        // onChanged: (value) {
                        //   time = value;
                        //   //Do something with the user input.
                        // },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(Icons.alarm),
                      SizedBox(width: 5),
                      Text('Expected Delivery Time:'),
                      SizedBox(
                        width: 5,
                      ),
                      FlatButton(
                        onPressed: () => _selectTime(context),
                        child: Text(timee = '${selectedTime.toString()}'),

                        // onChanged: (value) {
                        //   time = value;
                        //   //Do something with the user input.
                        // },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.drive_file_rename_outline),
                      hintText: 'Receiver Name:',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_call),
                      hintText: 'Receiver Phone No',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_location_alt_rounded),
                      hintText: 'Pick Up Point',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (!RegExp('^[a-zA-Z]').hasMatch(value)) {
                        return "example:John";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.gps_fixed),
                      hintText: 'Delivery Point',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (!RegExp('^[0-9]').hasMatch(value)) {
                        return "Only digit";
                      }
                      if (!RegExp('^[0-9]{11}').hasMatch(value)) {
                        return "Please enter 11 digit";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      phone = value;
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.line_weight),
                      hintText: 'Product Weight',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (!RegExp('^[0-9]').hasMatch(value)) {
                        return "Only digit";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      fee = value;
                      // String test0 = value;
                      // fee = test0 as num;
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.widgets_sharp),
                      hintText: 'Product Volume',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: Container(
                    //padding: EdgeInsets.all(8),
                    color: Colors.white,
                    //margin: EdgeInsets.fromLTRB(20, 130, 20, 50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(16),
                              child: MultiSelectFormField(
                                  autovalidate: false,
                                  chipBackGroundColor: Colors.green,
                                  chipLabelStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  dialogTextStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  checkBoxActiveColor: Colors.black,
                                  checkBoxCheckColor: Colors.green,
                                  dialogShapeBorder: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                  ),
                                  title: Text(
                                    "Product Type",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  dataSource: [
                                    {
                                      "display": "Frozen",
                                      "value": "Running",
                                    },
                                    {
                                      "display": "Fragile",
                                      "value": "Climbing",
                                    },
                                    {
                                      "display": "Others",
                                      "value": "Walking",
                                    },
                                  ],
                                  textField: 'display',
                                  valueField: 'value',
                                  okButtonLabel: 'OK',
                                  cancelButtonLabel: 'CANCEL',
                                  hintWidget: Text('Please choose one or more'),
                                  initialValue: _myActivities,
                                  onSaved: (value) {
                                    if (value == null) return;
                                    setState(() {
                                      _myActivities = value;
                                    });
                                  })),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Container(
                    //margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        color: Colors.amber[700],
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PendingScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Post",
                          style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
