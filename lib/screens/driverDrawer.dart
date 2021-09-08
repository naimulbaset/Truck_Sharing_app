import 'package:flutter/material.dart';
import 'package:truck_sharing_app/screens/truckDriverAtDeliverypoint.dart';
import 'package:truck_sharing_app/screens/start/dashboard.dart';
import 'package:truck_sharing_app/screens/myTrucks.dart';
import 'package:truck_sharing_app/screens/login.dart';
import 'truckOwner.dart';

class DriverDrawer extends StatefulWidget {
  @override
  _DriverDrawerState createState() => _DriverDrawerState();
}

class _DriverDrawerState extends State<DriverDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OwnerScreen();
                    },
                  ),
                );
              },
              title: Text(
                'Home',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return PatientTableScreen();
                //     },
                //   ),
                // );
              },
              title: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DashboardScreen();
                    },
                  ),
                );
              },
              title: Text(
                'Dashboard',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MtScreen();
                    },
                  ),
                );
              },
              title: Text(
                'My Trucks',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 10,
                    color: Colors.amber[700],
                    splashColor: Colors.white,
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
