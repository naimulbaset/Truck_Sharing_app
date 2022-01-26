import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/productSender.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/successfullyAdded.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class TruckRegScreen extends StatefulWidget {
  @override
  _TruckRegScreenState createState() => _TruckRegScreenState();
}

class _TruckRegScreenState extends State<TruckRegScreen> {
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

  // @override
  // void initState() {
  //   super.initState();
  //   time = TimeOfDay.now();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Add your Truck',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: DriverDrawer(),
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
                  child: Text('ENTER TRUCK DETAILS',
                      style: TextStyle(
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.drive_file_rename_outline),
                      hintText: 'NID No:',
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
                      icon: Icon(Icons.drive_file_rename_outline),
                      hintText: 'Chassis No:',
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
                      icon: Icon(Icons.drive_file_rename_outline),
                      hintText: 'Truck Number:',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
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
                      icon: Icon(Icons.drive_file_rename_outline),
                      hintText: 'License No:',
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
                      icon: Icon(Icons.drive_file_rename_outline),
                      hintText: 'Total Space:',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
                  ),
                ),

                // SizedBox(
                //   height: 12,
                // ),
                // Container(
                //   child: Container(
                //     //padding: EdgeInsets.all(8),
                //     color: Colors.white,
                //     //margin: EdgeInsets.fromLTRB(20, 130, 20, 50),
                //     child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: <Widget>[
                //           Container(
                //             padding: EdgeInsets.all(16),
                //             child: DropdownButtonFormField(
                //               isExpanded: true,
                //               hint: Text('Product type'),
                //               onChanged: (val) {
                //                 print(val);
                //                 setState(() {
                //                   this.purpose = val;
                //                 });
                //               },
                //               value: this.purpose,
                //               items: [
                //                 DropdownMenuItem(
                //                   child: Text('Fragile'),
                //                   value: 'Consultancy',
                //                 ),
                //                 DropdownMenuItem(
                //                   child: Text('Frozen'),
                //                   value: 'Follow up',
                //                 ),
                //                 DropdownMenuItem(
                //                   child: Text('Other'),
                //                   value: 'Report',
                //                 )
                //               ],
                //             ),
                //           ),
                //         ]),
                //   ),
                // ),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SuccessScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Register",
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
