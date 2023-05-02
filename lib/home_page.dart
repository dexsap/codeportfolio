import 'package:flutter/material.dart';
import 'package:pet_sense/qr_scanner.dart';
import 'package:pet_sense/profile_screen.dart';
//import 'package:pet_sense/newsfeed_screen.dart';
import 'package:pet_sense/map_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const QrScannerPage(),
    const PetProfilePage(),
    const GpsTrackerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.brown, // Set the color of the selected item
        unselectedItemColor: Colors.grey, // Set the color of the unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'QR Scanner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pet Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'GPS Tracker',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
