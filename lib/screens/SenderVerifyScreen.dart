import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/driverDrawer.dart';
import 'package:truck_sharing_app/screens/ThankOwner.dart';
import 'package:truck_sharing_app/screens/requestStatus.dart';

class SenderVerifyScreen extends StatefulWidget {
  @override
  _SenderVerifyScreenState createState() => _SenderVerifyScreenState();
}

class _SenderVerifyScreenState extends State<SenderVerifyScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate;
  TimeOfDay time;
  TimeOfDay picked;
  String timee;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.amber[700],
        title: Text('Trip Status',
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
            Card(
                margin: const EdgeInsets.all(16.0),
                //clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Check Status',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                          letterSpacing: 0,

                          // backgroundColor: Colors.indigoAccent
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Text(
                            'Trip Id:',
                            style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 0,

                              // backgroundColor: Colors.indigoAccent
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter trip id",
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Text(
                            'Trip Date:',
                            style: TextStyle(
                              fontSize: 18,
                              //fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 0,

                              // backgroundColor: Colors.indigoAccent
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: FlatButton(
                            onPressed: () => _selectDate(context),
                            child: selectedDate == null
                                ? Text('YYYY/DD/MM')
                                : Text(
                                    "${selectedDate.toLocal()}".split(' ')[0]),

                            // onChanged: (value) {
                            //   time = value;
                            //   //Do something with the user input.
                            // },
                          ),
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'example:',
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.black,
                      //         letterSpacing: 0,
                      //
                      //         // backgroundColor: Colors.indigoAccent
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Container(
                      //   //color: Colors.grey,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(
                      //       25,
                      //     ),
                      //     color: Colors.white,
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.calendar_today),
                      //       SizedBox(width: 2),
                      //       SizedBox(
                      //         width: 5,
                      //       ),
                      //       FlatButton(
                      //         onPressed: () {
                      //           setState(() {
                      //             _selectDate(context);
                      //           });
                      //         },
                      //         child: selectedDate == null
                      //             ? Text('DD/MM/YYYY')
                      //             : Text("${selectedDate.toLocal()}"
                      //                 .split(' ')[0]),
                      //
                      //         // onChanged: (value) {
                      //         //   time = value;
                      //         //   //Do something with the user input.
                      //         // },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        //margin: EdgeInsets.fromLTRB(20, 550, 20, 60),
                        child: Column(
                          children: [
                            Center(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 50),
                                color: Colors.green[700],
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return RequestStatusScreen();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  "Verify",
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
