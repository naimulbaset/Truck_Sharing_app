import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/productSender.dart';
import 'package:truck_sharing_app/screens/senderDrawer.dart';
import 'package:truck_sharing_app/screens/pending.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class PriceSetupScreen extends StatefulWidget {
  @override
  _PriceSetupScreenState createState() => _PriceSetupScreenState();
}

class _PriceSetupScreenState extends State<PriceSetupScreen> {
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
        title: Text('Price Setup',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: SenderDrawer(),
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
                  child: Text('ENTER DETAILS',
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
                      Text('Start Date:'),
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
                      Icon(Icons.calendar_today),
                      SizedBox(width: 5),
                      Text('End Date:'),
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
                      icon: Icon(Icons.edit_road),
                      hintText: 'Price per Km',
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
                      hintText: 'Price per Kg',
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
                      hintText: 'Price per Volume(inch^3)',
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
                      hintText: 'Price for Frozen',
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
                      hintText: 'Price for Fragile',
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
                      hintText: 'Price for Flammable',
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
                      hintText: 'Price for Liquid',
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
                      hintText: 'Price for Others',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                    ),
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
                          "Set",
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
