import 'package:flutter/material.dart';
import 'package:pet_sense/login_signup_screen.dart';
import 'package:pet_sense/qr_scanner.dart';
import 'package:pet_sense/profile_screen.dart';
import 'package:pet_sense/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Define your own theme here
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontSize: 64.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/loginSignup': (context) => const LoginSignupScreen(),
        '/qrScanner': (context) => const QrScannerPage(),
        '/profile': (context) => const PetProfilePage(),
        '/map': (context) => const GpsTrackerPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/petsenselogo.png', height: 500), // Replace 'company_logo.png' with your image asset name
            const SizedBox(height: 16.0),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/loginSignup');
              },
              child: const Text('Login / Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
