import 'package:flutter/material.dart';

class TruckDetailsScreen extends StatefulWidget {
  @override
  _TruckDetailsScreenState createState() => _TruckDetailsScreenState();
}

class _TruckDetailsScreenState extends State<TruckDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Truck Id Details',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Source Sans Pro',
              fontWeight: FontWeight.bold,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Truck Id 01 Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                  letterSpacing: 0,
                  // backgroundColor: Colors.indigoAccent
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
                //height: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: (Colors.blue.withOpacity(0.3)),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        bottomLeft: Radius.circular(40.0))),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Start Date:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '09/08/2021',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Start Time:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '10.00 am',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Current Location:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Flexible(
                            //fit: FlexFit.tight,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'Chittagong',
                                //softWrap: false,
                                //overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Destination:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Dhaka',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Product Type:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Fragile',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Space Available now:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Flexible(
                          //fit: FlexFit.tight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '1000m^3',
                              //softWrap: false,
                              //overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                  margin: const EdgeInsets.all(16.0),
                  //clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Update Location',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900],
                            letterSpacing: 0,
                            // backgroundColor: Colors.indigoAccent
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Form(
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          icon: Icon(
                                              Icons.add_location_alt_rounded),
                                          hintText: 'Current Location',
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
                                          icon: Icon(Icons.gps_fixed),
                                          hintText: 'Destination',
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 20.0, horizontal: 20.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      //margin: EdgeInsets.fromLTRB(20, 550, 20, 60),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: FlatButton(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 50),
                                              color:
                                                  Colors.green.withOpacity(0.9),
                                              onPressed: () {},
                                              child: Text(
                                                "UPDATE",
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )))
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
